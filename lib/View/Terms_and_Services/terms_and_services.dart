import 'package:carsave/Utils/Widgets/custom_appbar.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:flutter/material.dart';

class TermsAndServicesPage extends StatefulWidget {
  TermsAndServicesPage({super.key});

  @override
  _TermsAndServicesPageState createState() => _TermsAndServicesPageState();
}

class _TermsAndServicesPageState extends State<TermsAndServicesPage> {
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
                "Terms and Services",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "Effective Date: October 4, 2024",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "Introduction",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "Welcome to Car Save. These Terms and Services govern your use of the Car Save app. By accessing or using the app, you agree to comply with and be bound by these terms. Please review them carefully before using the app.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "1. Use of the App",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "1.1 You agree to use the app only for lawful purposes and in accordance with these Terms. You may not use the app to engage in any illegal or unauthorized activities.\n"
                    "1.2 You are responsible for ensuring that your use of the app complies with all applicable laws and regulations.\n"
                    "1.3 You agree not to use the app in a manner that could disable, overburden, or impair its operation.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "2. User Accounts",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "2.1 To access certain features of the app, you may be required to create an account. You agree to provide accurate, current, and complete information during the registration process.\n"
                    "2.2 You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "3. Intellectual Property",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "3.1 All content and materials within the app, including but not limited to text, graphics, logos, and software, are the property of Car Save or its licensors and are protected by copyright and trademark laws.\n"
                    "3.2 You may not use, copy, reproduce, distribute, or modify any content from the app without our prior written consent.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "4. Termination",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "4.1 We reserve the right to suspend or terminate your access to the app at any time, without notice, for conduct that we believe violates these Terms or is harmful to other users or the app.\n"
                    "4.2 Upon termination, your right to use the app will cease immediately, and any data or content associated with your account may be deleted.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "5. Limitation of Liability",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "5.1 To the maximum extent permitted by law, Car Save and its affiliates will not be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the app.\n"
                    "5.2 We do not warrant that the app will be error-free, secure, or uninterrupted, and we disclaim all liability for any harm resulting from your access or use of the app.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "6. Governing Law",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "These Terms are governed by and construed in accordance with the laws of your jurisdiction. Any disputes arising from your use of the app will be subject to the exclusive jurisdiction of the courts in your area.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "7. Changes to the Terms",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "We reserve the right to modify these Terms at any time. If we make significant changes, we will notify you via the app or by other means. Your continued use of the app after the changes take effect constitutes your acceptance of the revised Terms.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 20),
              Text(
                "Contact Us",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              Text(
                "If you have any questions or concerns about these Terms, please contact us at support@carsave.com.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
