
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;

  final String imageUrl;

  //final String verifiedEmail;
  //final String verifiedPhone;

  const UserModel( {
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.imageUrl,
    // required this.verifiedEmail,
    // required this.verifiedPhone,
  });

  toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "PhoneNumber": phoneNumber,
     "Password": password,
      "Email": email,
      "ImageUrl" : imageUrl,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {

    final data = document.data()!;
    return UserModel(
      id: document.id,
        firstName: data['FirstName'],
        lastName: data['LastName'],
        email: data['Email'],
        phoneNumber: data['PhoneNumber'],
        password: "", /// We don't need to get the user's password
        imageUrl: data['ImageUrl'],
    );
  }
}
