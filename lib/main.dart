import 'package:edumatrics_lite/configs/themes/theme_provider.dart';
import 'package:edumatrics_lite/home/home.home.dart';
import 'package:edumatrics_lite/home/home.login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final loginStatus = pref.getBool("login-status");
  print("main: pref.getBool('login-status') ${pref.getBool("login-status")}");

  late Widget screen;

  if (loginStatus == null || !loginStatus) {
    screen = StudentLogin();
  } else {
    screen = Home();
  }
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: MainApp(screen)));
}

class MainApp extends StatefulWidget {
  final screen;
  const MainApp(this.screen, {super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "home": (context) => Home(),
        "studentLogin": (context) => StudentLogin(),
      },
      home: widget.screen,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
