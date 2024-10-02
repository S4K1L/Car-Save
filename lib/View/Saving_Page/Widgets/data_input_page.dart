import 'package:carsave/Controller/saving_controller.dart';
import 'package:carsave/Routes/routes.dart';
import 'package:carsave/Utils/Widgets/custom_appbar.dart';
import 'package:carsave/Utils/Widgets/custom_button.dart';
import 'package:carsave/Utils/Widgets/input_form_field.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/Utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataInputPage extends StatefulWidget {
  final String selectedPaymentMethod;

  DataInputPage({required this.selectedPaymentMethod});

  @override
  _DataInputPageState createState() => _DataInputPageState();
}

class _DataInputPageState extends State<DataInputPage> {
  late SavingController savingController;

  @override
  void initState() {
    super.initState();
    savingController = Get.put(SavingController());
    savingController.amountController.value.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBoxColor,
        elevation: 0,
        title: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: kBoxColor,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: kWhiteColor,
                    radius: 90,
                    child: Image.asset(logo),
                  ),
                  sizeBox,
                  Text(
                    'CAR SAVE',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      widget.selectedPaymentMethod,  // Use widget.selectedPaymentMethod in StatefulWidget
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: InputFormField(
                      title: 'Amount',
                      icon: Icons.attach_money_rounded,
                      controller: savingController.amountController.value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      onPress: () {
                        savingController.addSaving(widget.selectedPaymentMethod);
                        Get.toNamed(RoutesPath.home);
                      },
                      title: 'Add Saving',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
