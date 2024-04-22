import 'package:edumatrics_lite/components/components.drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final pref = await SharedPreferences.getInstance();
    final loginStatus = pref.getBool("login-status");
    print("home: pref.getBool('login-status') $loginStatus");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: CustomDrawer(),
    );
  }
}
