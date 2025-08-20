import 'package:contact_manager_app/models/screen_mode.dart';
import 'package:contact_manager_app/provider/contacts_provider.dart';
import 'package:contact_manager_app/screens/add_or_edit_screen.dart';
import 'package:contact_manager_app/widgets/contact_details_footer_section.dart';
import 'package:contact_manager_app/widgets/contact_details_header_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen({super.key, required this.contactId});

  final int contactId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddOrEditScreen(
                  screenMode: ScreenMode.edit,
                  contactDetails: context
                      .read<ContactsProvider>()
                      .contacts
                      .firstWhere((element) => element.id == contactId),
                ),
              ),
            ),
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => deleteDialogBox(context),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 10,
          children: [
            Center(
              child: Hero(
                tag: 'profile_icon_$contactId',
                child: Icon(Icons.account_circle, size: 120),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Consumer<ContactsProvider>(
                builder: (context, value, child) {
                  final contact = value.contacts.firstWhere(
                    (element) => element.id == contactId,
                  );
                  return Text(
                    "${contact.firstName} ${contact.lastName}",
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                },
              ),
            ),
            ContactDetailsHeaderSection(contactId: contactId),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                "More",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ),
            ContactDetailsFooterSection(),
          ],
        ),
      ),
    );
  }

  Future<bool?> deleteDialogBox(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: Text("Are you sure you want to delete ?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<ContactsProvider>().deleteContact(contactId);
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        );
      },
    );
  }
}
