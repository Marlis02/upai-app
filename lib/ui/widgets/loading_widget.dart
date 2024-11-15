import 'package:ctmax_upai/styles/colors_style.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.5), // Полупрозрачный фон
          child: const Center(
            child: CircularProgressIndicator(
                color: AppColors.primary), // Индикатор загрузки
          ),
        ),
      ],
    );
  }
}
