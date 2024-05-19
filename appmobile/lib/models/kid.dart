import 'dart:io';

class Kid {
  String firstName;
  String familyName;
  DateTime? dateOfBirth; // Make dateOfBirth nullable
  String gender;
  File? imageUrl; // Change type to File
  String allergies;
  String syndromes;
  String hobbies;
  String authorizedPickupper;
  String relationshipToChild;
  bool isSet;
  int kidId;
  int category_id;
  bool done;

  // Constructor
  Kid(
      {this.firstName = '',
      this.familyName = '',
      this.gender = '',
      this.allergies = '',
      this.syndromes = '',
      this.hobbies = '',
      this.authorizedPickupper = '',
      this.relationshipToChild = '',
      this.isSet = false, // Initialization of isSet
      this.dateOfBirth, // Make dateOfBirth nullable
      this.imageUrl,
      this.kidId = 0,
      this.category_id = 1,
      this.done = false // Change type to File
      });
}
