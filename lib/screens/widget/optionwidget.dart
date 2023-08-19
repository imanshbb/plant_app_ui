import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';

class WidgetOption extends StatelessWidget {
  final IconData icon;
  final String title;
  const WidgetOption({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios,
            size: 17.0,
            color: Constant.blackColor.withOpacity(0.4),
          ),
          Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'IranSans',
                  color: Constant.blackColor.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8.0),
              Icon(
                icon,
                size: 23.0,
                color: Constant.blackColor.withOpacity(0.5),
              ),
            ],
          )
        ],
      ),
    );
  }
}
