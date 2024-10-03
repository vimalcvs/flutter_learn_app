import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: ()  {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: size.width,
        color: Colors.white, // Consistent with LoginScreen
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                "assets/logocut.png",
                height: 180,
                width: 160,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Forgot your password?',
              style: TextStyle(
                fontSize: 28.0, // Adjusted to match LoginScreen
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Enter your email address below to receive a link to reset your password.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email Address',
                filled: true,
                fillColor: Colors.white,
                // Consistent with LoginScreen
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.blueAccent,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent.shade700,
                    Colors.blue.shade500,
                    Colors.lightBlueAccent.shade200,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Add the logic for sending the reset password link
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Send Reset Link',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend link",
                      style: TextStyle(color: Colors.blueAccent),
                    )))
          ],
        ),
      ),
    );
  }
}
