// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter_vpn_app/core/mock_data/moc_data.dart';
import 'package:get/get.dart';

import '../models/conection_status.dart';
import '../models/country_model.dart';

class VpnController extends GetxController {
  // Reaktif değişkenler
  Rx<ConnectionStatus> connectionStats = MockData.mockConnectionStatuses[1].obs;
  RxList<Country> countries = MockData.mockCountries.obs;
  Rx<Duration> timer = Duration.zero.obs;
  Rx<bool> isConnected = true.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    print('VpnController initialized');
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    timer.value = connectionStats.value.connectedTime;

    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      timer.value = timer.value + Duration(seconds: 1);
    });
  }

  void changeLocation(int index) {
    connectionStats.value = ConnectionStatus(
      connectedCountry: MockData.mockConnectionStatuses[index].connectedCountry,
      downloadSpeed: MockData.mockConnectionStatuses[index].downloadSpeed,
      uploadSpeed: MockData.mockConnectionStatuses[index].uploadSpeed,
      connectedTime: Duration.zero,
    );
    timer.value = connectionStats.value.connectedTime;
    isConnected.value = true;
    startTimer();
    print('Location changed to: ${connectionStats.value.connectedCountry?.name}');
  }

  void disconnect() {
    connectionStats.value = ConnectionStatus(
      downloadSpeed: 0,
      uploadSpeed: 0,
      connectedTime: Duration.zero,
      connectedCountry: null,
    );

    _timer?.cancel();
    timer.value = Duration.zero;
    connectionStats.refresh();
    isConnected.value = false;
    print('Connection disconnected');
  }
}
