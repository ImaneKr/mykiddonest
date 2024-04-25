import 'package:flutter/material.dart';

class PaymentTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator; // Validator function added

  const PaymentTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator, // Validator function included in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, // Set a fixed height for the text field container
      child: Container(
        width: 340.0,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: null,
            hintText: labelText,
            errorStyle: TextStyle(height: 0), // Set error text height to 0
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 132, 131, 131),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          validator: validator, // Validator function applied here
        ),
      ),
    );
  }
}
