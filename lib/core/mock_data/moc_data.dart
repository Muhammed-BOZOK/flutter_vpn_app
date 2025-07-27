import '../../ui/models/conection_status.dart';
import '../../ui/models/country_model.dart';

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

  static final mockConnectionStatuses = [
    ConnectionStatus(
      downloadSpeed: 450,
      uploadSpeed: 40,
      connectedTime: Duration.zero, // Italy için sıfır
      connectedCountry: mockCountries[0], // Italy
    ),
    ConnectionStatus(
      downloadSpeed: 527,
      uploadSpeed: 49,
      connectedTime: Duration(hours: 2, minutes: 41, seconds: 52), // Netherlands
      connectedCountry: mockCountries[1], // Netherlands
    ),
    ConnectionStatus(
      downloadSpeed: 600,
      uploadSpeed: 55,
      connectedTime: Duration.zero, // Germany için sıfır
      connectedCountry: mockCountries[2], // Germany
    ),
  ];
}
