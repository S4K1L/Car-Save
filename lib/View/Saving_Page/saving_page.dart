import 'package:carsave/Utils/Widgets/custom_appbar.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/Utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'Widgets/data_input_page.dart';
import 'Widgets/payment_method_option.dart';

class SavingsPage extends StatefulWidget {
  SavingsPage({super.key, required this.totalSaving, required this.lastUpdate});
  final int totalSaving;
  final Timestamp? lastUpdate;

  @override
  _SavingsPageState createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  String? _selectedPaymentMethod;

  // Function to format the Timestamp to 'dd/MM/yyyy HH:mm'
  String formatTimestamp(Timestamp? timestamp) {
    if (timestamp == null) return 'No recent updates';
    DateTime dateTime = timestamp.toDate();
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime); // Format to 'day/month/year hours:minutes'
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TOTAL SAVINGS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
            SizedBox(height: 16),
            Text(
              'RM ${widget.totalSaving}',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Updated on ${formatTimestamp(widget.lastUpdate)}',  // Use the formatted date
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 32),
            Text(
              'PAYMENT METHOD',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
            SizedBox(height: 16),
            PaymentMethodOption(
              title: 'ONLINE BANKING',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            PaymentMethodOption(
              title: 'CREDIT CARD',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            PaymentMethodOption(
              title: 'DEBIT CARD',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            PaymentMethodOption(
              title: 'TOUCH N GO',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            PaymentMethodOption(
              title: 'DUIT NOW',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            SizedBox(height: kDefaultPadding * 4),
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: kWhiteColor,
                child: IconButton(
                  onPressed: () {
                    if (_selectedPaymentMethod != null) {
                      Get.to(() => DataInputPage(
                        selectedPaymentMethod: _selectedPaymentMethod!,
                      ), transition: Transition.leftToRight);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select a payment method'),
                        ),
                      );
                    }
                  },
                  icon: Icon(Icons.navigate_next, size: 35,color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
