class AppUser {
  final String firstName;
  final String lastName;
  String? phoneNumber;
  String? imageUrl;

  AppUser({
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.imageUrl,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'] as String?,
      imageUrl: map['imageUrl'] as String?,
    );
  }
}
