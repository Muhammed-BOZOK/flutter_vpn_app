import 'country_model.dart';

class ConnectionStatus {
  final int downloadSpeed;
  final int uploadSpeed;
  final Duration connectedTime;
  final Country connectedCountry;

  ConnectionStatus({
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.connectedTime,
    required this.connectedCountry,
  });
}
