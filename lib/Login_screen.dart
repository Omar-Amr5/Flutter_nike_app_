import 'package:flutter/material.dart';
import 'SignUpScreen.dart';
import 'SignInScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nike App",
          style: TextStyle(
            fontFamily: "Suwannaphum",
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "logo.jpeg",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 20),
                Image.network(
                  "https://cdn-icons-png.flaticon.com/512/107/107831.png",
                  width: 100,
                  height: 100,
                ),
              ],
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: const Text("Sign Up"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
