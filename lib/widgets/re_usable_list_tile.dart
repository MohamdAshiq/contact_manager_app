import 'package:flutter/material.dart';

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
