
import '../../models/conection_status.dart';
import '../../models/country_model.dart';

class MockData {
  static final mockCountries = [
    Country(
      name: 'Italy',
      flag: 'assets/flags/italy.png',
      city: '',
      locationCount: 4,
      strength: 70,
    ),
    Country(
      name: 'Netherlands',
      flag: 'assets/flags/netherlands.png',
      city: 'Amsterdam',
      locationCount: 12,
      strength: 85,
    ),
    Country(
      name: 'Germany',
      flag: 'assets/flags/germany.png',
      city: '',
      locationCount: 10,
      strength: 90,
    ),
  ];



  final mockConnectionStats = ConnectionStatus(
    downloadSpeed: 527,
    uploadSpeed: 49,
    connectedTime: Duration(hours: 2, minutes: 41, seconds: 52),
    connectedCountry: mockCountries[1], // Netherlands
  );
}
