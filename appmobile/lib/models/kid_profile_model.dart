class KidProfileModel {
  String profileImage;
  // type need to ba updated when use
  String firstName;
  String lastName;
  String gender;
  String allergies;
  String syndromes;
  String hobbies;
  DateTime dateOfBirth;
  List<String> authorizedPickUpPersons;

  KidProfileModel({
    this.profileImage = '',
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.allergies,
    required this.syndromes,
    required this.hobbies,
    required this.dateOfBirth,
    required this.authorizedPickUpPersons,
  });
}
