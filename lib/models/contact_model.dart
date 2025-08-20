class ContactModel {
  int? id;
  final String firstName;
  final String lastName;
  final String phoneNo;
  final String email;

  ContactModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "phone": phoneNo,
      "email": email,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNo: map['phone'],
      email: map['email'],
    );
  }
}
