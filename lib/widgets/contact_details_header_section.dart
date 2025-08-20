import 'package:contact_manager_app/provider/contacts_provider.dart';
import 'package:contact_manager_app/widgets/re_usable_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactDetailsHeaderSection extends StatelessWidget {
  const ContactDetailsHeaderSection({super.key, required this.contactId});

  final int contactId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(left: 20, right: 10),
                minTileHeight: 70,
                title: Consumer<ContactsProvider>(
                  builder: (context, value, child) {
                    final contact = value.contacts.firstWhere(
                      (element) => element.id == contactId,
                    );
                    return Text(contact.phoneNo);
                  },
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text("Mobile | India"),
                ),
                trailing: IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
              ),
              ReUsableListTile(
                title: "Video Call",
                icon: Icons.videocam_rounded,
                iconColor: Colors.grey,
              ),
              ReUsableListTile(
                title: "Telegram",
                icon: CupertinoIcons.paperplane_fill,
                iconColor: Colors.blue,
              ),
              ReUsableListTile(
                title: "WhatsApp",
                icon: CupertinoIcons.chat_bubble_fill,
                iconColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
