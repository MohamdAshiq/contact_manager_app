class ContactModel {
  int? id;
  final String name;
  final String phoneNo;
  final String email;

  ContactModel({
    this.id,
    required this.name,
    required this.phoneNo,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "phone": phoneNo, "email": email};
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'],
      phoneNo: map['phone'],
      email: map['email'],
    );
  }
}
