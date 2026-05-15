import 'package:flutter/material.dart';
import '../bloc/mood_bloc.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/widgets/app_snack_bar.dart';

class MoodContinueButtonWidget extends StatelessWidget {
  final MoodLoaded state;
  const MoodContinueButtonWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          AppSnackBar.show(
            context: context,
            message: 'Mood set to ${state.selectedMood.label}!',
            isSuccess: true,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.scaffoldBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          'Continue',
          style: AppTextStyles.body.copyWith(
            color: AppColors.scaffoldBg,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
