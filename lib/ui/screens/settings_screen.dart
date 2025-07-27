// screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vpn_app/core/constants/color_constant.dart';
import 'package:flutter_vpn_app/core/constants/size_constant.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Appcolors.blackcolor,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSize.padding),
            ListTile(
              title: Text('Light Theme'),
              onTap: () {
                // Implement theme change logic here
                debugPrint('Light Theme selected');
              },
            ),
            ListTile(
              title: Text('Dark Theme'),
              onTap: () {
                // Implement theme change logic here
                debugPrint('Dark Theme selected');
              },
            ),
            SizedBox(height: AppSize.padding),
            Text(
              'About',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSize.padding),
            ListTile(
              title: Text('Version'),
              subtitle: Text('1.0.0'),
            ),
          ],
        ),
      ),
    );
  }
}
