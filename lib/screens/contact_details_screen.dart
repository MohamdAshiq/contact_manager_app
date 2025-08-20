import 'package:contact_manager_app/models/contact_model.dart';
import 'package:contact_manager_app/models/screen_mode.dart';
import 'package:contact_manager_app/screens/add_or_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen({super.key, required this.contact});

  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        // title: Text(contact.name),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddOrEditScreen(screenMode: ScreenMode.edit),
              ),
            ),
            icon: Icon(Icons.edit),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 10,
          children: [
            Center(
              child: Hero(
                tag: 'profile_icon_${contact.id}',
                child: Icon(Icons.account_circle, size: 120),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                contact.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(
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
                        title: Text(contact.phoneNo),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text("Mobile | India"),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.phone),
                        ),
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
            ),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                "More",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ReUsableListTile(
                      title: "Default Ringtone",
                      icon: Icons.arrow_forward_ios_rounded,
                      iconColor: Colors.grey,
                      iconSize: 18,
                    ),
                    ReUsableListTile(
                      title: "QR Code",
                      icon: Icons.arrow_forward_ios_rounded,
                      iconColor: Colors.grey,
                      iconSize: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReUsableListTile extends StatelessWidget {
  const ReUsableListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    this.iconSize = 22,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      contentPadding: EdgeInsets.only(left: 20, right: 10),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }
}
