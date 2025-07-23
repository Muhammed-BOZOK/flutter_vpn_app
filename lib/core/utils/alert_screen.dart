import 'package:flutter/material.dart';

import 'size_utils.dart';

class AlertScreen extends StatelessWidget {
  final String message;

  const AlertScreen({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.1,
              child: Icon(
                Icons.warning_outlined,
                size: getSize(250), // Büyük simge boyutu
                color: Colors.red, // Uyarı temasına uygun renk
              ),
            ),
            Padding(
              padding: getPadding(all: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: getSize(25),
                children: [
                  Text(
                    message,
                    style: TextStyle(fontSize: 20, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Giriş Ekranına Dön'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
