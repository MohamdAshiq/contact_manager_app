import 'package:contact_manager_app/widgets/re_usable_list_tile.dart';
import 'package:flutter/material.dart';

class ContactDetailsFooterSection extends StatelessWidget {
  const ContactDetailsFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
