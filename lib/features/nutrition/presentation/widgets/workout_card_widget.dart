import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:fitness_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/nutrition_bloc.dart';
import '../../../../../core/constants/app_colors.dart';

class WorkoutCardWidget extends StatelessWidget {
  final NutritionLoaded state;
  const WorkoutCardWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(8),
        border: const Border(left: BorderSide(color: AppColors.teal, width: 8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.workoutDate,
                style: AppTextStyles.body.copyWith(fontSize: 12),
              ),
              SB.h(4),
              Text(state.workoutTitle, style: AppTextStyles.title),
            ],
          ),
          SvgPicture.asset(Assets.icons.iconArrowRight),
        ],
      ),
    );
  }
}
