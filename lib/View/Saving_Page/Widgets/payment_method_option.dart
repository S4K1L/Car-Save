import 'package:flutter/material.dart';

class PaymentMethodOption extends StatelessWidget {
  final String title;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  PaymentMethodOption({
    required this.title,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
      ),
      trailing: Radio<String>(
        value: title,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
