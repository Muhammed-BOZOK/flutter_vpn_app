import 'package:flutter/material.dart';
import 'package:flutter_vpn_app/core/constants/color_constant.dart';
import 'package:flutter_vpn_app/ui/screens/countries_screen.dart';
import 'package:flutter_vpn_app/ui/screens/settings_screen.dart';
import 'package:flutter_vpn_app/widgets/custom_image_view.dart';

class BottomNevigation extends StatefulWidget {
  const BottomNevigation({super.key});

  @override
  State<BottomNevigation> createState() => _BottomNevigationState();
}

class _BottomNevigationState extends State<BottomNevigation> {
  int _currentIndex = 0;
  static final List<Widget> _screens = [
    const CountriesScreen(),
    // Diğer ekranlar eklenebilir
    Container(color: Colors.blue, child: Center(child: Text('Screen 2'))),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  BottomNavigationBar _buildBottomBar() {
    final bottomNavigationItem = [
      BottomNavigationBarItem(
        icon: CustomImageView(
          svgPath: 'assets/svg/map.svg',
          color: _currentIndex == 0 ? Appcolors.blueAccent : Appcolors.blackcolor,
        ),
        label: 'Countries',
      ),
      BottomNavigationBarItem(
        icon: CustomImageView(
          svgPath: 'assets/svg/radar.svg',
          color: _currentIndex == 1 ? Appcolors.blueAccent : Appcolors.blackcolor,
        ),
        label: 'Disconnect',
      ),
      BottomNavigationBarItem(
        icon: CustomImageView(
          svgPath: 'assets/svg/setting.svg',
          color: _currentIndex == 2 ? Appcolors.blueAccent : Appcolors.blackcolor,
        ),
        label: 'Setting',
      ),
    ];

    return BottomNavigationBar(
      elevation: 2.0,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      currentIndex: _currentIndex,
      iconSize: 30,
      items: bottomNavigationItem,
      backgroundColor: Colors.white,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        color: Appcolors.blueAccent,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        color: Appcolors.blackcolor,
      ),
    );
  }
}
