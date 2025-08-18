import 'package:contact_manager_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Manager"),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, value, child) => IconButton(
              onPressed: () => value.toggleTheme(),
              icon: Icon(
                value.isDark ? Icons.dark_mode : Icons.light_mode,
                size: 25,
              ),
            ),
          ),
          SizedBox(width: 7),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          padding: EdgeInsets.all(10),
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: Icon(Icons.account_circle, size: 42),
            minLeadingWidth: 50,
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            title: Text("Name ${index + 1}"),
            subtitle: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("email${index + 1}@gmail.com"),
                Text("9876543210"),
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20),
          ),
        ),
      ),
    );
  }
}
