class Kid {
  String firstName;
  String familyName;
  DateTime dateOfBirth;
  String gender;
  String imageUrl;
  String allergies;
  String syndromes;
  String hobbies;
  String authorizedPickupper;
  String additionalInfo;

  // Constructor
  Kid({
    this.firstName = '',
    this.familyName = '',
    this.gender = '',
    this.allergies = '',
    this.syndromes = '',
    this.hobbies = '',
    this.authorizedPickupper = '',
    this.additionalInfo = '',
    DateTime? dateOfBirth, // Make dateOfBirth nullable
  })  : dateOfBirth = dateOfBirth ?? DateTime(2000, 1, 1),
        imageUrl = _getDefaultImageUrl(gender) {
    // Providing default value directly
  }

  // Function to get default image URL based on gender
  static String _getDefaultImageUrl(String gender) {
    return gender == 'Male' ? 'assets/kid.jpg' : 'assets/girl.jpg';
  }
}
