import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.5), // Полупрозрачный фон
          child: Center(
            child: CircularProgressIndicator(), // Индикатор загрузки
          ),
        ),
      ],
    );
  }
}
