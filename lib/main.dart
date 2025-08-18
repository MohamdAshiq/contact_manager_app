import 'package:contact_manager_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:contact_manager_app/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: Consumer<ThemeProvider>(
        builder: (context, value, _) => MaterialApp(
          title: "Contact Manager App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: value.isDark ? Brightness.dark : Brightness.light,
            fontFamily: "Poppins",
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
