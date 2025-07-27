import 'package:flutter/material.dart';
import 'package:flutter_vpn_app/core/constants/size_constant.dart';
import 'package:flutter_vpn_app/core/extensions/context_extension.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    double borderRadius = 12.0,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    final snackBar = SnackBar(
      content: IntrinsicWidth(
        child: Center(
          child: Text(
            message,
            style: context.textTheme.bodyLarge?.copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppSize.padding2x, vertical: AppSize.padding * 0.5),
      elevation: AppSize.elevation,
      // padding: EdgeInsets.zero,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
