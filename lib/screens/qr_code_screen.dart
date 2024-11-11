import 'package:ctmax_upai/styles/colors_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(
        top: padding.top,
        left: padding.left,
        right: padding.right,
        bottom: padding.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const Text(
            "My QR",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 30),
          _qr("741 147"),
          const SizedBox(height: 10),
          _qrCodeButton("741 147"),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _qr(String code) {
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

  Widget _qrCodeButton(String code) {
    return SizedBox(
        height: 40,
        width: 250,
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor:
                WidgetStatePropertyAll(AppColors.primary.withOpacity(0.1)),
          ),
          child: const Text(
            "741 147",
            style: TextStyle(color: AppColors.primary, fontSize: 20),
          ),
        ));
  }

  Widget _scanQrCodeButton() {
    return SizedBox(
        height: 50,
        width: 250,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
                SizedBox(width: 10),
                Text("Сканировать",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            )));
  }
}
