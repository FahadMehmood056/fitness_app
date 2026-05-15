import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:fitness_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/nutrition_bloc.dart';
import 'workout_card_widget.dart';

class WorkoutsSectionWidget extends StatelessWidget {
  final NutritionLoaded state;
  const WorkoutsSectionWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Workouts',
              style: AppTextStyles.title.copyWith(fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  state.isDayTime
                      ? Assets.icons.iconSun
                      : Assets.icons.iconMoon,
                  width: 24,
                  height: 24,
                ),
                SB.w(8),
                Text(
                  state.temperature,
                  style: AppTextStyles.title.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        SB.h(20),
        WorkoutCardWidget(state: state),
      ],
    );
  }
}
