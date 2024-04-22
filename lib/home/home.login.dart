import 'package:edumatrics_lite/actions/actions.services.dart';
import 'package:edumatrics_lite/components/components.button.dart';
import 'package:edumatrics_lite/components/components.textfield.dart';
import 'package:edumatrics_lite/home/home.home.dart';
import 'package:flutter/material.dart';

class StudentLogin extends StatefulWidget {
  StudentLogin({Key? key}) : super(key: key); // Corrected constructor

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool anyError = false;
  bool loading = false;

  void login() async {
    print("Login Attempt!!");
    String email = emailController.text;
    String password = passwordController.text;

    if (email.contains("@srishakthi.ac.in")) {
      print("Valid");
    }

    setState(() {
      loading = true;
    });

    final response = await service.login(email, password);
    print("response: student login $response ${response["success"] == true}");

    if (response["success"] == true) {
      await service.getUserData();
      setState(() {
        anyError = false;
        loading = false;
      });
      // Navigator.popUntil(context, ModalRoute.withName("studentLogin"));
      // Navigator.pushNamedAndRemoveUntil(
      //     context, "home", ModalRoute.withName("studentLogin"));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
          ModalRoute.withName("home"));
    } else {
      setState(() {
        anyError = true;
        loading = false;
      });
    }

    print("Email: $email");
    print("Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Student Login",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            // message
            Text(
              "Login to your student account",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),

            // email field
            CustomTextField(
              controller: emailController,
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 25),

            // password field
            CustomTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),

            // login button
            CustomButton(
              onTap: () {
                login();
              },
              label: 'Submit',
            ),

            // footer
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: Center(
                child: Text(
                  "Forgot your password? Contact your administrator.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
