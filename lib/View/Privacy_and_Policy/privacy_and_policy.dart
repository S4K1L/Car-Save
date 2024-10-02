import 'package:carsave/Controller/notification_controller.dart';
import 'package:carsave/Utils/Widgets/custom_appbar.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/Utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PrivacyAndPolicyPage extends StatefulWidget {
  PrivacyAndPolicyPage({super.key});

  @override
  _PrivacyAndPolicyPageState createState() => _PrivacyAndPolicyPageState();
}

class _PrivacyAndPolicyPageState extends State<PrivacyAndPolicyPage> {

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "Effective Date: October 4, 2024",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "At Car Save, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data when you use the Car Save app. By using the app, you agree to the terms outlined in this policy.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "Information We Collect",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "1.1. Personal Information\n1.2. Financial Information\n1.3. Usage Data\n1.4. Location Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "Children's Privacy",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "The Car Save app is not intended for individuals under the age of 13. We do not knowingly collect personal information from children under 13. If we become aware that we have inadvertently collected such information, we will take steps to delete it.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "Changes to This Privacy Policy",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "We may update this Privacy Policy from time to time to reflect changes in our practices or applicable laws. When we make significant changes, we will notify you within the app or by other means. Your continued use of the app after any changes indicates your acceptance of the revised policy.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}