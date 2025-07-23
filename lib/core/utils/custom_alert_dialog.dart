import 'package:flutter/material.dart';

class CustomAlertDialog {
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Evet',
    String cancelText = 'Hayır',
    required VoidCallback onConfirm,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // Dışarı tıklayınca kapanmasın
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(message),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Köşeleri yuvarlak
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // İptal, false döner
              },
              child: Text(
                cancelText,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                onConfirm();
              },
              child: Text(
                confirmText,
                style: TextStyle(color: Colors.redAccent), // Onay butonu renkli
              ),
            ),
          ],
        );
      },
    );
  }
}
