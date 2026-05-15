import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:flutter/material.dart';
import '../bloc/nutrition_bloc.dart';
import '../../../../../core/constants/app_colors.dart';

class CaloriesCardWidget extends StatelessWidget {
  final NutritionLoaded state;
  const CaloriesCardWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${state.calories}',
                  style: AppTextStyles.heading,
                ),
                TextSpan(
                  text: ' Calories',
                  style: AppTextStyles.body.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
          Text(
            '${state.remainingCalories} Remaining',
            style: AppTextStyles.secondary,
          ),
          SB.h(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0',
                style: AppTextStyles.secondary.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${state.totalCalories}',
                style: AppTextStyles.secondary.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SB.h(4),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: 6,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xFF464646),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 6,
                    width:
                        constraints.maxWidth *
                        (state.calories / state.totalCalories),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.caloriesGradientStart,
                          AppColors.caloriesGradientMid,
                          AppColors.caloriesGradientEnd,
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
