import 'package:carsave/Controller/data_controller.dart';
import 'package:carsave/Controller/set_target_controller.dart';
import 'package:carsave/Utils/Widgets/custom_appbar.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/Utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TargetPage extends StatefulWidget {
  TargetPage({super.key, required this.targetSaving, required this.lastUpdate});

  final int targetSaving;
  final Timestamp? lastUpdate;

  @override
  _TargetPageState createState() => _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
  final SetTargetController setTargetController = Get.put(SetTargetController());
  final DataController dataController = Get.put(DataController());

  @override
  void initState() {
    super.initState();
    setTargetController.fetchTargetCompletionStatus();
  }

  // Function to format the Timestamp to 'dd/MM/yyyy HH:mm'
  String formatTimestamp(Timestamp? timestamp) {
    if (timestamp == null) return 'No recent updates';
    DateTime dateTime = timestamp.toDate();
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
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
      body: SingleChildScrollView(
        child: Padding(
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
                'RM ${dataController.userModel.value.totalSaving}',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Updated on ${formatTimestamp(widget.lastUpdate)}',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Obx(() {
                // Observe changes in month completion status
                return Column(
                  children: [
                    targetMonth('JAN', setTargetController.monthCompletionStatus[0]),
                    targetMonth('FEB', setTargetController.monthCompletionStatus[1]),
                    targetMonth('MAR', setTargetController.monthCompletionStatus[2]),
                    targetMonth('APR', setTargetController.monthCompletionStatus[3]),
                    targetMonth('MAY', setTargetController.monthCompletionStatus[4]),
                    targetMonth('JUN', setTargetController.monthCompletionStatus[5]),
                    targetMonth('JUL', setTargetController.monthCompletionStatus[6]),
                    targetMonth('AUG', setTargetController.monthCompletionStatus[7]),
                    targetMonth('SEP', setTargetController.monthCompletionStatus[8]),
                    targetMonth('OCT', setTargetController.monthCompletionStatus[9]),
                    targetMonth('NOV', setTargetController.monthCompletionStatus[10]),
                    targetMonth('DEC', setTargetController.monthCompletionStatus[11]),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Padding targetMonth(String month, bool complete) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
      child: Row(
        children: [
          Text(
            month,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor
            ),
          ),
          Spacer(),
          Text(
            complete ? '........COMPLETE........' : '......INCOMPLETE......',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: complete ? Colors.greenAccent[400] : Colors.red),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
