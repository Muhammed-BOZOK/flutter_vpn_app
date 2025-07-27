// controllers/search_controller.dart
// ignore_for_file: avoid_print

import 'package:get/get.dart';
import '../../core/mock_data/moc_data.dart';
import '../models/country_model.dart';
import 'vpn_controller.dart';

class MySearchController extends GetxController {
  // Reaktif arama sorgusu
  RxString searchQuery = ''.obs;
  // Filtrelenmiş ülkeler listesi
  RxList<Country> filteredCountries = <Country>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Başlangıçta tüm ülkeleri göster
    filteredCountries.assignAll(MockData.mockCountries);
    // Arama sorgusu değiştiğinde filtreleme yap
    ever(searchQuery, (_) => filterCountries());
    print('SearchController initialized');
  }

  void filterCountries() {
    if (searchQuery.value.isEmpty) {
      // Arama sorgusu boşsa tüm ülkeleri göster
      filteredCountries.assignAll(MockData.mockCountries);
    } else {
      // Arama sorgusuna göre ülkeleri filtrele
      filteredCountries.assignAll(
        MockData.mockCountries.where((country) =>
            country.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
            country.city.toLowerCase().contains(searchQuery.value.toLowerCase())).toList(),
      );
    }
    print('Filtered countries: ${filteredCountries.map((c) => c.name).toList()}');
  }

  void selectCountry(int index) {
    // VpnController'ı bul ve lokasyonu değiştir
    final vpnController = Get.find<VpnController>();
    final selectedCountry = filteredCountries[index];
    // MockData.mockCountries içindeki orijinal index'i bul
    final originalIndex = MockData.mockCountries.indexWhere((c) => c == selectedCountry);
    if (originalIndex != -1) {
      vpnController.changeLocation(originalIndex);
    }
  }
}