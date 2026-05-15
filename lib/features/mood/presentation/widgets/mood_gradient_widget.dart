import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MoodBackgroundWidget extends StatelessWidget {
  const MoodBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 0.8,
          colors: [
            const Color(0xFF09607E),
            const Color(0xFF072B42),
            const Color(0xFF030810),
            AppColors.scaffoldBg,
          ],
          stops: const [0.0, 0.4, 0.7, 1.0],
        ),
      ),
    );
  }
}
