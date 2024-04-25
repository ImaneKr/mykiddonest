import 'package:appmobile/models/kid_profile_model.dart';
//import 'package:flutter/foundation.dart';

class KidProfileController {
  bool isEditMode = false;
  //will be used to track whether the user is currently in “edit mode” or not.

  KidProfileModel kidProfile = KidProfileModel(
    firstName: 'Aymen',
    lastName: 'Benaissa',
    gender: 'Male',
    allergies: 'Fish allergy, flower',
    syndromes: 'None',
    hobbies: 'Playing football, painting',
    dateOfBirth: DateTime(2020, 4, 10), // year , month , day
    authorizedPickUpPersons: ['Ahmed Kadri', 'ahlem kadri'],
  );

  String get gender => kidProfile.gender;
  String get firstName => kidProfile.firstName;
  String get lastName => kidProfile.lastName;
  DateTime get dateOfBirth => kidProfile.dateOfBirth;
  String get allergies => kidProfile.allergies;
  String get syndromes => kidProfile.syndromes;
  String get hobbies => kidProfile.hobbies;
  List<String> get authorizedPickUpPersons =>
      kidProfile.authorizedPickUpPersons;

  // functions
  Future<void> fetchUserProfile() async {
    // Fetch user data from data source
  }

//switching between read-only and edit modes.
  void toggleEditMode() {
    isEditMode = !isEditMode;
  }
  // toggles the value of isEditMode. If isEditMode is currently false, it sets it to true

  void updateKidProfile(KidProfileModel profileUpdated) {
    kidProfile = profileUpdated;
  }
  // this method is to update the kid’s profile data with the information provided in the updatedProfile.

  // ValueNotifier to hold the user profile data
/*final ValueNotifier<KidProfileModel> _userProfileNotifier =
      ValueNotifier<KidProfileModel>(KidProfileModel(
    firstName: 'Aymen',
    lastName: 'Benaissa',
    gender: 'Male',
    allergies: ['fish Allergy', 'flowers Allergy'],
    syndromes: ['None'],
    hobbies: ['Playing football', 'painting'],
    dateOfBirth: DateTime(2020, 4, 10), // year , month , day
    authorizedPickUpPersons: ['Ahmed Kadri'],
  ));*/

  //KidProfileModel get kidProfile => _userProfileNotifier.value;

  /*void updateUserProfile(KidProfileModel updatedProfile) {
    _userProfileNotifier.value = updatedProfile;
  }*/
}
