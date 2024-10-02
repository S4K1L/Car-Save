import 'package:carsave/Controller/transaction_history_controller.dart';
import 'package:carsave/Utils/Widgets/custom_appbar.dart';
import 'package:carsave/Utils/colors.dart';
import 'package:carsave/Utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TransactionHistory extends StatefulWidget {
  TransactionHistory({super.key});

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final TransactionHistoryController _controller = Get.put(TransactionHistoryController());

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
      body: Obx(() {
        if(_controller.transactionsList.isEmpty) {
          return Center(child: Text('No transactions found.',style: TextStyle(color: Theme.of(context).primaryColor,),));
        } else {
          return Skeletonizer(
            enabled: _controller.isLoading.value,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Transaction History',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: kDefaultPadding),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _controller.transactionsList.length,
                      itemBuilder: (context, index) {
                        var transaction = _controller.transactionsList[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: kBoxColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      transaction.paymentMethod ?? 'Unknown',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor,),
                                    ),
                                    Text(
                                      formatTimestamp(transaction.date),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  'RM ${transaction.amount.toString()}',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent[700]),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
