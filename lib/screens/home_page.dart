import 'package:contact_manager_app/models/screen_mode.dart';
import 'package:contact_manager_app/provider/theme_provider.dart';
import 'package:contact_manager_app/screens/add_or_edit_screen.dart';
import 'package:contact_manager_app/screens/contact_details_screen.dart';
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
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactDetailsScreen()),
            ),
            minTileHeight: 75,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: Hero(
              tag: "profile_icon_$index",
              child: Icon(Icons.account_circle, size: 42)),
            minLeadingWidth: 50,
            contentPadding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
            title: Text("Name ${index + 1}"),
            subtitle: Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Text("email${index + 1}@gmail.com"),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddOrEditScreen(screenMode: ScreenMode.add),
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
