import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:fitness_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/nutrition_bloc.dart';
import '../../../../../core/constants/app_colors.dart';

class WeightCardWidget extends StatelessWidget {
  final NutritionLoaded state;
  const WeightCardWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  text: '${state.weightKg.toInt()}',
                  style: AppTextStyles.heading,
                ),
                TextSpan(
                  text: ' kg',
                  style: AppTextStyles.body.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
          SB.h(4),
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF154124),
                ),
                child: Center(
                  child: SvgPicture.asset(Assets.icons.iconArrowTilt),
                ),
              ),
              SB.w(4),
              Text('+${state.weightChange}kg', style: AppTextStyles.secondary),
            ],
          ),
          SB.h(30),
          Text('Weight', style: AppTextStyles.body.copyWith(fontSize: 18)),
        ],
      ),
    );
  }
}
