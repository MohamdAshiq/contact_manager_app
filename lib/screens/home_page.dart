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
    );
  }
}
