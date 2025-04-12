import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_ease/utils/formatters/formatter.dart';

class UserModel {
  // Fields to store user data 🧑‍💻
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  // Constructor to initialize the user model 📥
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //! Getter for full name 📝
  // Combines first name and last name into a single string
  String get fullName => '$firstName $lastName';

  //! Getter for formatted phone number 📱
  // Uses a formatter to present the phone number in a specific way
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  //! Static method to split full name into parts (first name and last name) 🔍
  // Splits the name by a space and returns a list of parts
  static List<String> nameParts(fullName) => fullName.split(" ");

  //! Static method to generate a username from the full name 🧑‍💻
  // Creates a username by concatenating the first and last names
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    String camelCaseUserName = '$firstName$lastName';
    String userNameWithPrefix = 'cwt_$camelCaseUserName';
    return userNameWithPrefix;
  }

  //! Static method to return an empty user model 📤
  // Useful as a placeholder or default value when no data is available
  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
  );

  //! Method to convert the user model into a JSON object 💾
  // This is important for saving data to databases like Firestore
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  //! Factory method to create a user model from Firestore data 📄
  // This converts a Firestore document into a UserModel instance
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['UserName'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    }
    return UserModel.empty();
  }
}

