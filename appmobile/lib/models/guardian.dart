import 'dart:io';

class Guardian {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String username;
  String password;
  String? adresseMail;
  String? gender;
  String? civilState;
  String? address;
  File? guardianPic;
  Guardian({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    required this.username,
    required this.password,
    this.adresseMail,
    this.gender,
    this.civilState,
    this.address,
    this.guardianPic,
  });
}
