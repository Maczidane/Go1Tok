class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  //final String verifiedEmail;
  //final String verifiedPhone;


  const UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
   // required this.verifiedEmail,
   // required this.verifiedPhone,
  });

  toJson(){
    return{
      "FirstName" : firstName,
      "LastName" : lastName,
      "PhoneNumber" : phoneNumber,
      "Password": password,
      "Email": email,
    };
  }
}
