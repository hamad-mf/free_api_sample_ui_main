import 'package:flutter/material.dart';
import 'package:free_api_sample_ui_main/controller/login_screen_controller.dart';
import 'package:free_api_sample_ui_main/global_widgets/custom_textfield.dart';
import 'package:free_api_sample_ui_main/global_widgets/refactored_button.dart';
import 'package:free_api_sample_ui_main/view/home_screen/home_screen.dart';
import 'package:free_api_sample_ui_main/view/registration_screen/registration_screen.dart';
import 'package:provider/provider.dart';
// Import the registration screen

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: emailController,
              label: "Email",
              keyboardType:
                  TextInputType.emailAddress, // Optional, for email input
            ),
            CustomTextField(
              controller: passwordController,
              label: "Password",
              obscureText: true,
            ),
            SizedBox(height: 20),


            Consumer<LoginScreenController>(builder: (context, providerObj, child) =>
            providerObj.isLoading?CircularProgressIndicator():
             RefactoredButton(
              label: "Login",
              onTap: () async {
                // Implement login logic here

                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  await context
                      .read<LoginScreenController>()
                      .onLogin(
                        context: context,
                          email: emailController.text,
                          password: passwordController.text)
                      .then(
                        (value) {
                          if(value ==true){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Login success")));
                            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                          }
                        },
                      );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Enter valid credentials")));
                }
              },
            ),),
            
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RegistrationScreen()), // Navigate to RegisterScreen
                );
              },
              child: Text("Don't have an account? Register now"),
            ),
          ],
        ),
      ),
    );
  }
}
