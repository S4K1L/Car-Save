import 'package:carsave/Controller/notification_controller.dart';
import 'package:carsave/Utils/Widgets/custom_appbar.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LicensesPage extends StatefulWidget {
  LicensesPage({super.key});

  @override
  _LicensesPageState createState() => _LicensesPageState();
}

class _LicensesPageState extends State<LicensesPage> {
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
                "Licenses",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showLicensePage(
                    context: context,
                    applicationName: 'Car Save',
                    applicationVersion: '1.0.0',
                    applicationLegalese: '© 2024 Car Save. All rights reserved.',
                  );
                },
                child: Text("View Licenses"),
              ),
              SizedBox(height: 20),
              Text(
                "By using this app, you agree to the terms and conditions of the licenses for the third-party libraries and dependencies that power Car Save.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
