import 'package:fitness_app/core/utils/sb.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AppSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    bool isSuccess = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 2),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSuccess ? AppColors.tealdark : Colors.red.shade900,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSuccess ? AppColors.teal : Colors.red,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                isSuccess ? Icons.check_circle_outline : Icons.error_outline,
                color: isSuccess ? AppColors.teal : Colors.red,
                size: 20,
              ),
              SB.w(12),
              Text(
                message,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
