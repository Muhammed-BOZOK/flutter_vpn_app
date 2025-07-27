import 'package:flutter/material.dart';
import 'package:flutter_vpn_app/core/constants/color_constant.dart';
import 'package:flutter_vpn_app/core/constants/size_constant.dart';
import 'package:flutter_vpn_app/core/utils/size_utils.dart';
import 'package:flutter_vpn_app/ui/screens/search_screen.dart';
import 'package:flutter_vpn_app/widgets/custom_image_view.dart';
import 'package:get/get.dart';

import '../controllers/vpn_controller.dart';
import '../../core/utils/custom_snackbar.dart';
import '../../widgets/custom_listile_widget.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VpnController vpnController = Get.put(VpnController());

    return Scaffold(
      body: Column(
        children: [
          buildAppBar(context),
          Expanded(
            child: SingleChildScrollView(
              padding: getPadding(
                  left: AppSize.padding2x, right: AppSize.padding2x, top: AppSize.padding, bottom: AppSize.padding),
              child: Column(
                children: [
                  Text(
                    "Connecting Time",
                    style: context.textTheme.bodyLarge,
                  ),
                  viewConectionInfo(vpnController, context),
                  SizedBox(
                    height: getDynamicHeight(16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "free locations (3)",
                        style: context.textTheme.bodyMedium?.copyWith(fontSize: getFontSize(12)),
                      ),
                      Icon(
                        Icons.info,
                        color: Appcolors.blackcolor.withValues(alpha: 0.4),
                        size: getSize(16),
                      ),
                    ],
                  ),
                  viewCountriesList(vpnController)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Obx viewConectionInfo(VpnController vpnController, BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Text(
            !vpnController.isConnected.value
                ? '--:--:--'
                : '${vpnController.timer.value.inHours.toString().padLeft(2, '0')}:${(vpnController.timer.value.inMinutes % 60).toString().padLeft(2, '0')}:${(vpnController.timer.value.inSeconds % 60).toString().padLeft(2, '0')}',
            style: context.textTheme.headlineSmall,
          ),
          Padding(
            padding: getPadding(all: AppSize.padding),
            child: Column(
              children: [
                Container(
                  padding: getPadding(left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Appcolors.whitecolor,
                    borderRadius: BorderRadius.circular(AppSize.cardRadius),
                  ),
                  child: CustomListTile(
                    leading: CustomImageView(
                      imagePath: vpnController.connectionStats.value.connectedCountry?.flag,
                    ),
                    title: vpnController.connectionStats.value.connectedCountry?.name ?? 'Not Connected',
                    subtitle: vpnController.connectionStats.value.connectedCountry?.city ?? 'Unknown',
                    titleStyle: context.textTheme.titleMedium,
                    subtitleStyle: context.textTheme.bodyMedium,
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'stealth',
                          style: context.textTheme.bodyMedium,
                        ),
                        Text(
                          vpnController.connectionStats.value.connectedCountry?.strength.toString() ?? '0',
                          style: context.textTheme.headlineSmall?.copyWith(
                            color: Appcolors.blackcolor,
                            fontSize: getFontSize(11),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: getDynamicHeight(8),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: getPadding(left: 8, right: 8),
                            decoration: BoxDecoration(
                              color: Appcolors.whitecolor,
                              borderRadius: BorderRadius.circular(AppSize.cardRadius),
                            ),
                            child: CustomListTile(
                              leading: Container(
                                padding: getPadding(all: 8),
                                decoration: BoxDecoration(
                                  color: Appcolors.yellowAccent.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CustomImageView(
                                  svgPath: 'assets/svg/import.svg',
                                ),
                              ),
                              title: "Download",
                              subtitle: "${vpnController.connectionStats.value.downloadSpeed} MB",
                              titleStyle: context.textTheme.bodyMedium,
                              subtitleStyle: context.textTheme.titleMedium,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getDynamicWidth(8),
                        ),
                        Expanded(
                          child: Container(
                            padding: getPadding(left: 8, right: 8),
                            decoration: BoxDecoration(
                              color: Appcolors.whitecolor,
                              borderRadius: BorderRadius.circular(AppSize.cardRadius),
                            ),
                            child: CustomListTile(
                              leading: Container(
                                padding: getPadding(all: 8),
                                decoration: BoxDecoration(
                                  color: Appcolors.redAccent.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CustomImageView(
                                  svgPath: 'assets/svg/export.svg',
                                ),
                              ),
                              title: "Upload",
                              subtitle: "${vpnController.connectionStats.value.uploadSpeed} MB",
                              titleStyle: context.textTheme.bodyMedium,
                              subtitleStyle: context.textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView viewCountriesList(VpnController vpnController) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: vpnController.countries.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final country = vpnController.countries[index];
        return Obx(() {
          final isConnected = vpnController.connectionStats.value.connectedCountry == country;

          return Container(
            padding: getPadding(left: 12, right: 12),
            decoration: BoxDecoration(
              color: Appcolors.whitecolor,
              borderRadius: BorderRadius.circular(AppSize.cardRadius),
            ),
            child: CustomListTile(
              leading: CustomImageView(
                imagePath: country.flag,
              ),
              title: country.name,
              subtitle: country.city,
              titleStyle: context.textTheme.titleMedium,
              subtitleStyle: context.textTheme.bodyMedium,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  viewCountryItemIconButton(
                    fillColor: isConnected ? Appcolors.redAccent : Appcolors.blackcolor.withValues(alpha: 0.06),
                    iconColor: isConnected ? Appcolors.whitecolor : Appcolors.blackcolor,
                    onPressed: () {
                      if (isConnected) {
                        vpnController.disconnect();
                        _showMessage(context, 'Disconnected from ${country.name}');
                      } else {
                        vpnController.changeLocation(index);
                        _showMessage(context, 'Connected to ${country.name}');
                      }
                    },
                    icon: Icons.power_settings_new_rounded,
                  ),
                  SizedBox(width: getDynamicWidth(8)),
                  viewCountryItemIconButton(
                    fillColor: Appcolors.blackcolor.withValues(alpha: 0.06),
                    onPressed: () {},
                    icon: Icons.arrow_forward_ios_rounded,
                  ),
                ],
              ),
            ),
          );
        });
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: getDynamicHeight(8),
        );
      },
    );
  }

  static Container viewCountryItemIconButton({
    Color? fillColor,
    Color? iconColor,
    VoidCallback? onPressed,
    required IconData icon,
  }) {
    return Container(
      height: getSize(35),
      width: getSize(35),
      decoration: BoxDecoration(
        color: fillColor ?? Appcolors.blackcolor.withValues(alpha: 0.06),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: getSize(20),
        onPressed: onPressed,
        color: iconColor ?? Appcolors.blackcolor,
        icon: Icon(icon),
      ),
    );
  }

  Container buildAppBar(BuildContext context) {
    return Container(
      height: getDynamicHeight(190),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.cardRadius),
          bottomRight: Radius.circular(AppSize.cardRadius),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/appbar_backround.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: getPadding(all: AppSize.padding2x),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: getPadding(all: 8),
                  decoration: BoxDecoration(
                    color: Appcolors.secondaryBlue,
                    borderRadius: BorderRadius.circular(
                      AppSize.cardRadius,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      debugPrint('Category button pressed');
                    },
                    child: CustomImageView(
                      svgPath: 'assets/svg/category_2.svg',
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  'Countries',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Container(
                  padding: getPadding(all: 8),
                  decoration: BoxDecoration(
                    color: Appcolors.secondaryBlue,
                    borderRadius: BorderRadius.circular(
                      AppSize.cardRadius,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      debugPrint('Crown button pressed');
                    },
                    child: CustomImageView(
                      svgPath: 'assets/svg/crown.svg',
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => Get.to(() => const SearchScreen()),
              child: Container(
                padding: getPadding(all: 10),
                height: getDynamicHeight(56),
                decoration: BoxDecoration(
                  color: Appcolors.whitecolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'search for country or city',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Appcolors.blackcolor.withValues(alpha: 0.4),
                        fontSize: getFontSize(14),
                      ),
                    ),
                    CustomImageView(
                      svgPath: 'assets/svg/search-normal.svg',
                      height: getSize(24),
                      width: getSize(24),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    CustomSnackBar.show(
      context: context,
      message: message,
      duration: const Duration(seconds: 2),
      backgroundColor: Appcolors.blueAccent,
      textColor: Colors.white,
      borderRadius: AppSize.cardRadius,
    );
  }
}
