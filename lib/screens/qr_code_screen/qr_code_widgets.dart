import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ctmax_upai/styles/colors_style.dart';

class QrCodeWidget extends StatelessWidget {
  const QrCodeWidget({super.key, required this.code});
  final String code;
  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: code,
      version: QrVersions.auto,
      size: 250,
      backgroundColor: Colors.white,
      gapless: false,
      embeddedImageStyle: const QrEmbeddedImageStyle(
        size: Size(50, 50),
      ),
      eyeStyle: const QrEyeStyle(
        eyeShape: QrEyeShape.circle,
        color: Colors.blueAccent,
      ),
      dataModuleStyle: const QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.circle,
        color: AppColors.primary,
      ),
    );
  }
}
