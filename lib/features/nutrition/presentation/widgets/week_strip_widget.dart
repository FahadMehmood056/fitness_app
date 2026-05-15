// ignore_for_file: deprecated_member_use

import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/nutrition_bloc.dart';
import '../../../../../core/constants/app_colors.dart';

class WeekStripWidget extends StatelessWidget {
  final NutritionLoaded state;
  const WeekStripWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: state.weekDays.map((day) {
        final isSelected = day['isSelected'] as bool;
        return GestureDetector(
          onTap: () {
            final date = DateTime(
              state.selectedDate.year,
              state.selectedDate.month,
              day['date'] as int,
            );
            context.read<NutritionBloc>().add(SelectDate(date));
          },
          child: Column(
            children: [
              Text(
                day['day'] as String,
                style: AppTextStyles.body.copyWith(fontSize: 12),
              ),
              SB.h(10),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.green.withOpacity(0.19)
                      : AppColors.cardBg,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: AppColors.green, width: 2)
                      : null,
                ),
                child: Center(
                  child: Text('${day['date']}', style: AppTextStyles.body),
                ),
              ),
              SB.h(8),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.green : Colors.transparent,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
