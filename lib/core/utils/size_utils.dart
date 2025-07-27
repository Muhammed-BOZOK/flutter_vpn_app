// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double FIGMA_DESIGN_WIDTH = 360;
const double FIGMA_DESIGN_HEIGHT = 800;
const double FIGMA_DESIGN_STATUS_BAR = 45;

double get getWidth => ScreenUtil().screenWidth;

double get getHeight {
  num statusBar = ScreenUtil().statusBarHeight;
  return ScreenUtil().screenHeight - statusBar;
}

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getDynamicWidth(double px) {
  return px.w;
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getDynamicHeight(double px) {
  return px.h;
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  return px.r;
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  return px.sp;
}

///This method is used to set padding responsively
EdgeInsets getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to set margin responsively
EdgeInsets getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to get padding or margin responsively
EdgeInsets getMarginOrPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left: getDynamicWidth(left ?? 0),
    top: getDynamicHeight(top ?? 0),
    right: getDynamicWidth(right ?? 0),
    bottom: getDynamicHeight(bottom ?? 0),
  );
}

/// Initialize ScreenUtil to set design dimensions for responsive layout
void initializeScreenSize(BuildContext context,
    {double width = FIGMA_DESIGN_WIDTH, double height = FIGMA_DESIGN_HEIGHT}) {
  ScreenUtil.init(
    context,
    designSize: Size(width, height),
    minTextAdapt: true,
    splitScreenMode: true,
  );
}
