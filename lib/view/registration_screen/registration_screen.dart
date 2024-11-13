import 'package:flutter/material.dart';
import 'package:free_api_sample_ui_main/global_widgets/custom_textfield.dart';
import 'package:free_api_sample_ui_main/global_widgets/refactored_button.dart';
import 'package:free_api_sample_ui_main/view/login_screen/login_screen.dart';


class RegistrationScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              label: "Name",
            ),
            CustomTextField(
              controller: phoneController,
              label: "Phone",
            ),
            CustomTextField(
              controller: placeController,
              label: "Place",
            ),
            CustomTextField(
              controller: pincodeController,
              label: "Pincode",
            ),
            CustomTextField(
              controller: emailController,
              label: "Email",
              keyboardType: TextInputType.emailAddress, // For email input
            ),
            CustomTextField(
              controller: passwordController,
              label: "Password",
            ),
            const SizedBox(height: 20),
            RefactoredButton(
              label: "Register",
              onTap: () {
                // Implement registration logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // navigate back to login screen
              },
              child: const Text("Alredy have an account? LOGIN Now"),
            ),
          ],
        ),
      ),
    );
  }
}
