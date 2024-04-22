import 'package:edumatrics_lite/actions/actions.services.dart';
import 'package:edumatrics_lite/components/components.drawer_tile.dart';
import 'package:edumatrics_lite/home/home.home.dart';
import 'package:edumatrics_lite/home/home.login.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(height: 25.0),
            Icon(
              Icons.person,
              size: 56,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Divider(
              height: 5.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(height: 10.0),
            DrawerTile(
                text: "H O M E",
                icon: Icons.home,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      ModalRoute.withName("home"));
                }),
            const SizedBox(height: 10.0),
            DrawerTile(
                text: "S E T T I N G S", icon: Icons.settings, onTap: () {}),
            const SizedBox(height: 10.0),
            DrawerTile(
                text: "L O G O U T",
                icon: Icons.logout,
                onTap: () {
                  service.logout();
                  // Navigator.pop(context);
                  // Navigator.pop(context);
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, "studentLogin", ModalRoute.withName("home"));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => StudentLogin()),
                      ModalRoute.withName("home"));

                  print("logged out");
                }),
          ],
        ),
      ),
    );
  }
}
