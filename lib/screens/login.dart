import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  static Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      print(e);
    }
  }

  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  bool isRegisteredEmail = false; // Flag to check if the email is registered
  bool isEmailChecked = false; // Flag to check if the email has been verified

  void resetForm() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    lastNameController.clear();
    repeatPasswordController.clear();

    setState(() {
      isRegisteredEmail = false;
      isEmailChecked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: isEmailChecked
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: resetForm,
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            const Text(
              "Let's get started",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48.0),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            if (isEmailChecked)
              isRegisteredEmail
                  ? buildPasswordField()
                  : buildRegistrationForm(),
            ElevatedButton(
              onPressed: isEmailChecked
                  ? (isRegisteredEmail ? signIn : registerAccount)
                  : checkEmail,
              child: Text(isEmailChecked
                  ? (isRegisteredEmail ? 'Login' : 'Registrar')
                  : 'Continue'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Column(
      children: [
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Senha',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }

  Widget buildRegistrationForm() {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Primeiro Nome',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: lastNameController,
          decoration: const InputDecoration(
            labelText: 'Ultimo Nome',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Senha',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: repeatPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Confirmar Senha',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }

  Future<void> checkEmail() async {
    final String email = emailController.text.trim();
    try {
      final signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      setState(() {
        isRegisteredEmail = signInMethods.isNotEmpty;
        isEmailChecked = true;
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void signIn() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'E-mail não existe.';
          break;
        case 'wrong-password':
          errorMessage = 'Password incorreto.';
          break;
        case 'email-already-in-use':
          errorMessage = 'Já existe uma conta com o e-mail informado.';
          break;
        case 'weak-password':
          errorMessage = 'A senha fornecida é muito fraca.';
          break;
        default:
          errorMessage = 'Ocorreu um erro indefinido.';
      }

      showErrorMessage(errorMessage);
    }
  }

  void registerAccount() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String repeatPassword = repeatPasswordController.text.trim();
    final String firstName = nameController.text.trim();
    final String lastName = lastNameController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        repeatPassword.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty) {
      return;
    }

    if (password != repeatPassword) {
      return;
    }

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      saveUserDetails(userCredential);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'E-mail não existe.';
          break;
        case 'wrong-password':
          errorMessage = 'Password incorreto.';
          break;
        case 'email-already-in-use':
          errorMessage = 'Já existe uma conta com o e-mail informado.';
          break;
        case 'weak-password':
          errorMessage = 'A senha fornecida é muito fraca.';
          break;
        default:
          errorMessage = 'Ocorreu um erro indefinido.';
      }

      showErrorMessage(errorMessage);
    }
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void saveUserDetails(UserCredential userCredential) async {
    final user = userCredential.user;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'firstName': nameController.text.trim(),
        'lastName': lastNameController.text.trim(),
      }).catchError((e) {
        showErrorMessage('Falha ao salvar as informações do usuário.');
      });

      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
