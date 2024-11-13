import 'package:flutter/material.dart';
import 'package:free_api_sample_ui_main/global_widgets/custom_textfield.dart';
import 'package:free_api_sample_ui_main/global_widgets/refactored_button.dart';


class ProductAddScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  ProductAddScreen({super.key});

  // Method to show an error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Input Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTextField(controller: nameController, label: "Product Name"),
            CustomTextField(controller: descriptionController, label: "Description"),
            CustomTextField(controller: priceController, label: "Price"),
            CustomTextField(controller: stockController, label: "Stock"),
            CustomTextField(controller: categoryController, label: "Category"),
            const SizedBox(height: 20),
            RefactoredButton(
              label: "Add Product",
              onTap: () {
                // Validation and creating the product
                if (nameController.text.isEmpty ||
                    descriptionController.text.isEmpty ||
                    priceController.text.isEmpty ||
                    stockController.text.isEmpty ||
                    categoryController.text.isEmpty) {
                  _showErrorDialog(context, 'Please fill in all fields.');
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
