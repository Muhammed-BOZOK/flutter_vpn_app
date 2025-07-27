// screens/search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_vpn_app/ui/controllers/search_controller.dart';
import 'package:flutter_vpn_app/core/constants/color_constant.dart';
import 'package:flutter_vpn_app/core/constants/size_constant.dart';
import 'package:flutter_vpn_app/core/utils/size_utils.dart';
import 'package:flutter_vpn_app/ui/screens/countries_screen.dart';
import 'package:flutter_vpn_app/widgets/custom_image_view.dart';
import 'package:flutter_vpn_app/widgets/custom_listile_widget.dart';
import 'package:get/get.dart';

import '../controllers/vpn_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SearchController'ı başlat
    final MySearchController searchController = Get.put(MySearchController());
    final VpnController vpnController = Get.find<VpnController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.whitecolor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Appcolors.blackcolor),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Search Countries',
          style: TextStyle(color: Appcolors.blackcolor, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: getPadding(all: AppSize.padding2x),
        child: Column(
          children: [
            Container(
              padding: getPadding(all: 10),
              decoration: BoxDecoration(
                color: Appcolors.whitecolor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Appcolors.blackcolor.withValues(alpha: 0.4)),
              ),
              child: TextField(
                onChanged: (value) {
                  searchController.searchQuery.value = value;
                },
                decoration: InputDecoration(
                  hintText: 'Search country...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Appcolors.blackcolor),
                ),
              ),
            ),
            SizedBox(height: getDynamicHeight(16)),
            // Filtrelenmiş ülkeler listesi
            Expanded(
              child: Obx(() => searchController.filteredCountries.isEmpty
                  ? const Center(child: Text('No results found'))
                  : ListView.separated(
                      itemCount: searchController.filteredCountries.length,
                      separatorBuilder: (context, index) => SizedBox(height: getDynamicHeight(8)),
                      itemBuilder: (context, index) {
                        final country = searchController.filteredCountries[index];
                        final isConnected = vpnController.connectionStats.value.connectedCountry == country &&
                            vpnController.connectionStats.value.downloadSpeed > 0;
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
                                CountriesScreen.viewCountryItemIconButton(
                                  fillColor:
                                      isConnected ? Appcolors.redAccent : Appcolors.blackcolor.withValues(alpha: 0.06),
                                  iconColor: isConnected ? Appcolors.whitecolor : Appcolors.blackcolor,
                                  onPressed: () {
                                    searchController.selectCountry(index);
                                    Get.back(); 
                                  },
                                  icon: Icons.power_settings_new_rounded,
                                ),
                                SizedBox(width: getDynamicWidth(8)),
                                CountriesScreen.viewCountryItemIconButton(
                                  fillColor: Appcolors.blackcolor.withValues(alpha: 0.06),
                                  onPressed: () {},
                                  icon: Icons.arrow_forward_ios_rounded,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
            ),
          ],
        ),
      ),
    );
  }
}
