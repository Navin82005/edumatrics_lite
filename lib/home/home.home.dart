import 'package:edumatrics_lite/components/components.drawer.dart';
import 'package:edumatrics_lite/components/components.home_tile.dart';
import 'package:edumatrics_lite/home/home.profile.dart';
import 'package:edumatrics_lite/internals/internals.main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String? username = "user";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final pref = await SharedPreferences.getInstance();
    final loginStatus = pref.getBool("login-status");
    setState(() {
      username = pref.getString("name");
    });
    print("home: pref.getBool('login-status') $loginStatus");
    print("home: pref.getString('name') $username");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home | $username"),
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        shrinkWrap: true,
        children: [
          const StudentProfile(),
          const SizedBox(height: 15),
          Divider(
            height: 10,
            color: Theme.of(context).colorScheme.primary,
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(height: 15),
          CustomHomeTile(
            content: "Internals",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InternalView()));
            },
          ),
          const SizedBox(height: 30),
          CustomHomeTile(
            content: "Attendance",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
