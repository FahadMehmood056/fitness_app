import 'package:fitness_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/plan_bloc.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/utils/sb.dart';

class PlanDayTileWidget extends StatelessWidget {
  final PlanDay day;
  final int index;
  const PlanDayTileWidget({super.key, required this.day, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 6, bottom: 6, left: 8, right: 8),
          decoration: const BoxDecoration(color: AppColors.scaffoldBg),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      day.dayName,
                      style: AppTextStyles.body.copyWith(
                        color: day.workout != null
                            ? AppColors.textPrimary
                            : Color(0xFF5D607C),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${day.dayNumber}',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 20,
                        color: day.workout != null
                            ? AppColors.textPrimary
                            : Color(0xFF5D607C),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SB.w(8),
              Expanded(
                child: day.workout != null
                    ? _WorkoutCardWidget(workout: day.workout!, index: index)
                    : const SB.h(60),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Divider(
            color: AppColors.divider,
            thickness: 0.5,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _WorkoutCardWidget extends StatelessWidget {
  final PlanWorkout workout;
  final int index;
  const _WorkoutCardWidget({required this.workout, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: AppColors.white, width: 8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReorderableDragStartListener(
            index: index,
            child: SvgPicture.asset(
              Assets.icons.iconDragHandler,
              width: 22,
              height: 22,
              colorFilter: const ColorFilter.mode(
                AppColors.textSecondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          SB.w(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: workout.category.tagColor,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        workout.category.icon,
                        width: 12,
                        height: 12,
                        colorFilter: ColorFilter.mode(
                          workout.category.color,
                          BlendMode.srcIn,
                        ),
                      ),
                      SB.w(4),
                      Text(
                        workout.category.label,
                        style: AppTextStyles.body.copyWith(
                          color: workout.category.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SB.h(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      workout.title,
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      workout.duration,
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
