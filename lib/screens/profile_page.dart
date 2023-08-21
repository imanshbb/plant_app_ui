import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants/constants.dart';
import 'package:flutter_application_6/screens/widget/optionwidget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            //profile image
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 5.0,
                  color: Constant.primeryColor.withOpacity(0.5),
                ),
              ),
              child: const CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            //end profile image
            const SizedBox(height: 16.0),
            // profile name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ساناز امینی',
                  style: TextStyle(
                    fontFamily: 'IranSans',
                    color: Constant.blackColor.withOpacity(0.5),
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(width: 5.0),
                Image.asset(
                  'assets/images/verified.png',
                  height: 25.0,
                ),
              ],
            ),
            //end profile name
            const SizedBox(height: 10.0),
            //profile email
            Text(
              'Sanaz@gmail.com',
              style: TextStyle(
                fontFamily: 'IranSans',
                color: Constant.blackColor.withOpacity(0.4),
                fontSize: 16.0,
              ),
            ),
            //end profile email
            const SizedBox(height: 20.0),
            //profile option
            const Column(
              children: <Widget>[
                WidgetOption(title: 'پروفایل من', icon: Icons.person),
                WidgetOption(title: 'تنظیمات', icon: Icons.settings),
                WidgetOption(
                    title: 'اطلاع رسانی‌ها', icon: Icons.notifications),
                WidgetOption(title: 'شبکه های اجتماعی', icon: Icons.share),
                WidgetOption(title: 'خروج', icon: Icons.logout),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
