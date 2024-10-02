import 'package:flutter/material.dart';
import '../colors.dart';

class InputFormField extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextEditingController? controller;
  const InputFormField({
    super.key, required this.title, required this.icon, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon,size: 26,),
        label: Align(
            alignment: Alignment.center,
            child: Text(title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15),)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: kBoxColor, // Background color of text field
      ),
      validator: (value) {
        if(controller == null)
          {
            return 'Enter Text';
          }
        return null;
      },
    );
  }
}