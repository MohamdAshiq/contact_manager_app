import 'package:contact_manager_app/models/contact_model.dart';
import 'package:contact_manager_app/services/database_helper.dart';
import 'package:flutter/cupertino.dart';

class ContactsProvider extends ChangeNotifier {
  ContactsProvider() {
    fetchAllContacts();
  }
  List<ContactModel> _contacts = [];
  List<ContactModel> get contacts => List.unmodifiable(_contacts);

  // Status Indicator
  bool _isloading = true;
  bool get isloading => _isloading;

  // Database Instance
  final db = DatabaseHelper.instance;

  // Function to fetch all contacts from DB
  Future<void> fetchAllContacts() async {
    try {
      _contacts = await db.getContacts();
      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      debugPrint("Exception : ${e.toString()}");
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }

  // Function to add a new contact to DB
  Future<void> addNewContact(ContactModel contact) async {
    try {
      await db.addContact(contact);
      fetchAllContacts();
    } catch (e) {
      debugPrint("Exception : ${e.toString()}");
    }
  }

  // Function to edit a contact
  Future<void> editContact(ContactModel contact) async {
    try {
      await db.updateContact(contact);
      fetchAllContacts();
    } catch (e) {
      debugPrint("Exception :${e.toString()}");
    }
  }
}
