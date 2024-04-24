import 'package:edumatrics_lite/actions/actions.services.dart';
import 'package:edumatrics_lite/components/components.profile_rows.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  String username = "username";
  String sem = "00";
  String registerNumber = "999999999999";
  String rollNumber = "00as000";
  String department = "sss";
  String currentSem = "00";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> loadUserData() async {
    if (await _checkInternetConnection()) {
      await service.getUserData();
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("name")!;
      sem = prefs.getString("academicYear")!;
      currentSem = prefs.getString("currentSem")!;
      sem =
          "${int.parse(sem.split(" - ")[1]) - DateTime.now().year} - $currentSem";
      rollNumber = prefs.getString("rollNumber")!;
      registerNumber = prefs.getString("registerNumber")!;
      department = prefs.getString("department")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Icon(
            Icons.person,
            color: Theme.of(context).colorScheme.primary,
            size: 70,
          ),
          const SizedBox(height: 10),
          CustomProfileRow(label: "Name", text: username),
          const SizedBox(height: 10),
          CustomProfileRow(label: "Roll Number", text: rollNumber),
          const SizedBox(height: 10),
          CustomProfileRow(label: "Register Number", text: registerNumber),
          const SizedBox(height: 10),
          CustomProfileRow(label: "Department", text: department),
          const SizedBox(height: 10),
          CustomProfileRow(label: "Current Semester", text: sem),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
