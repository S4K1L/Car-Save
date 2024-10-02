import 'package:carsave/Utils/colors.dart';
import 'package:carsave/Utils/const.dart';
import 'package:flutter/material.dart';

class FormDataContainer extends StatelessWidget {
  const FormDataContainer({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: kDefaultPadding * 2, vertical: 10),
      width: MediaQuery.of(context).size.width / 1.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 12,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kBoxColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        data,
                        style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
