import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../bloc/nutrition_bloc.dart';

class NutritionDateHeaderWidget extends StatelessWidget {
  final NutritionLoaded state;
  const NutritionDateHeaderWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Text(
      state.todayDate,
      style: AppTextStyles.body.copyWith(fontSize: 16),
    );
  }
}
