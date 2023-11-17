import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_for_events/models/user.dart';
import 'package:map_for_events/utils/contants.dart';
import 'package:path/path.dart' as Path;

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  User? user = FirebaseAuth.instance.currentUser;
  AppUser? userData;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isEditingPhone = false;
  bool _isEditingEmail = false;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    if (user != null) {
      try {
        DocumentSnapshot userProfile = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();
        Map<String, dynamic> data = userProfile.data() as Map<String, dynamic>;
        setState(() {
          userData = AppUser.fromMap(data);
          _phoneController.text = userData?.phoneNumber ?? '';
          _emailController.text = user?.email ?? '';
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      body: userData == null
          ? const Center(
              child:
                  CircularProgressIndicator()) // Exibir um spinner enquanto os dados não são carregados
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(userData?.imageUrl ??
                          'https://th.bing.com/th/id/R.4871374905aa85c48423c26517b5bc71?rik=%2baH%2brtYTFbRAvA&pid=ImgRaw&r=0'), // Substitua 'default_image_url' pelo seu URL de imagem padrão
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: _pickImage,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "${userData?.firstName ?? ''} ${userData?.lastName ?? ''}"
                          .trim(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Divider(),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.facebook),
                          Icon(FontAwesomeIcons.linkedin),
                          Icon(FontAwesomeIcons.twitter),
                          Icon(FontAwesomeIcons.googlePlus),
                        ],
                      ),
                    ),
                    Divider(),
                    _editPhoneWidget(),
                    _editEmailWidget(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _editEmailWidget() {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState: _isEditingEmail
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'Digite seu novo e-mail',
              labelText: 'E-mail',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () async {
                  await _saveEmail();
                  setState(() {
                    _isEditingEmail = false;
                  });
                },
                child: const Text('Salvar'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isEditingEmail = false;
                  });
                },
                child: const Text('Cancelar'),
              ),
            ],
          ),
        ],
      ),
      secondChild: ListTile(
        leading: const Icon(Icons.email),
        title: Text(user?.email ?? 'E-mail não disponível'),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            setState(() {
              _isEditingEmail = true;
            });
          },
        ),
      ),
    );
  }

  Widget _editPhoneWidget() {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState: _isEditingPhone
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: 'Digite seu novo telefone',
              labelText: 'Telefone',
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () async {
                  await _savePhone();
                  setState(() {
                    _isEditingPhone = false;
                  });
                },
                child: const Text('Salvar'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isEditingPhone = false;
                  });
                },
                child: const Text('Cancelar'),
              ),
            ],
          ),
        ],
      ),
      secondChild: ListTile(
        leading: const Icon(Icons.phone),
        title: Text(userData?.phoneNumber ?? 'Telefone não disponível'),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            setState(() {
              _isEditingPhone = true;
            });
          },
        ),
      ),
    );
  }

  Future<void> _savePhone() async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'phoneNumber': _phoneController.text,
      });

      setState(() {
        userData!.phoneNumber = _phoneController.text;
      });
    }
  }

  Future<void> _saveEmail() async {
    if (user != null) {
      try {
        await user!.updateEmail(_emailController.text);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .update({
          'email': _emailController.text,
        });

        await FirebaseAuth.instance.signOut();

        Navigator.of(context).pushReplacementNamed('/');
      } catch (e) {
        print("Erro ao atualizar o e-mail: $e");
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha a imagem'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: const Text('Câmera'),
                onTap: () => Navigator.of(context).pop(ImageSource.camera),
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: const Text('Galeria'),
                onTap: () => Navigator.of(context).pop(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );

    if (pickedFile != null) {
      final pickedImage = await picker.pickImage(source: pickedFile);
      if (pickedImage != null) {
        File imageFile = File(pickedImage.path);
        _uploadImage(imageFile);
      }
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    try {
      // Criar uma referência para o Firebase Storage
      String fileName = Path.basename(imageFile.path);
      Reference storageRef =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');

      // Upload da imagem
      UploadTask uploadTask = storageRef.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      // Quando o upload estiver completo, obter o URL da imagem
      String imageUrl = await snapshot.ref.getDownloadURL();

      // Atualizar o Firestore com o novo URL
      await _updateUserImage(imageUrl);
    } catch (e) {
      print(e);
      // Tratar erros aqui
    }
  }

  Future<void> _updateUserImage(String imageUrl) async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'imageUrl': imageUrl,
      });

      setState(() {
        userData!.imageUrl = imageUrl;
      });
    }
  }
}
