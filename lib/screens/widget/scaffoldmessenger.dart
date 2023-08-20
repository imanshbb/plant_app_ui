import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';

class SnacBarWidget extends StatelessWidget {
  final String text;
  const SnacBarWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SnackBarAction(
            textColor: Constant.primeryColor.withOpacity(1),
            label: 'Action',
            onPressed: () {
              // Code to execute.
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              text,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontFamily: 'Lalezar'),
            ),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 1500),
      width: 280.0, // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
