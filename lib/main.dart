import 'package:contact_manager_app/provider/theme_provider.dart';
import 'package:contact_manager_app/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:contact_manager_app/screens/home_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isDark = await ThemeServices.getTheme();
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(isDark)),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, _) => MaterialApp(
          title: "Contact Manager App",
          debugShowCheckedModeBanner: false,
          theme: value.theme,
          home: HomePage(),
        ),
      ),
    );
  }
}
