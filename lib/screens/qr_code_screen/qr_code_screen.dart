import 'package:ctmax_upai/screens/qr_code_screen/qr_code_widgets.dart';
import 'package:ctmax_upai/styles/colors_style.dart';
import 'package:flutter/material.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                "My QR",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              const QrCodeWidget(code: "741 147"),
              const SizedBox(height: 10),
              _qrCodeButton("741 147"),
              const SizedBox(height: 10),
            ],
          ),
        ),
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
          overlayColor: WidgetStateProperty.all(
            AppColors.primary.withOpacity(0.1),
          ),
        ),
        child: const Text(
          "741 147",
          style: TextStyle(color: AppColors.primary, fontSize: 20),
        ),
      ),
    );
  }
}
