// ignore_for_file: deprecated_member_use

import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:flutter/material.dart';
import '../bloc/nutrition_bloc.dart';
import '../../../../../core/constants/app_colors.dart';
import 'water_chart_widget.dart';

class HydrationCardWidget extends StatelessWidget {
  final NutritionLoaded state;
  const HydrationCardWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${state.hydrationMl == 0 ? '0' : state.hydrationMl}%',
                      style: AppTextStyles.heading.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                    ),
                    SB.h(35),
                    Text(
                      'Hydration',
                      style: AppTextStyles.title.copyWith(fontSize: 18),
                    ),
                    Text(
                      'Log Now',
                      style: AppTextStyles.secondary.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const WaterChartWidget(),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.tealdark,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                state.hydrationBanner,
                style: AppTextStyles.body.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
