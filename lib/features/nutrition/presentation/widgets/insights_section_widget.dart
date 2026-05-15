import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:flutter/material.dart';
import '../bloc/nutrition_bloc.dart';
import 'calories_card_widget.dart';
import 'weight_card_widget.dart';
import 'hydration_card_widget.dart';

class InsightsSectionWidget extends StatelessWidget {
  final NutritionLoaded state;
  const InsightsSectionWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Insights',
          style: AppTextStyles.title.copyWith(fontWeight: FontWeight.w600),
        ),
        SB.h(12),
        Row(
          children: [
            Expanded(child: CaloriesCardWidget(state: state)),
            SB.w(12),
            Expanded(child: WeightCardWidget(state: state)),
          ],
        ),
        SB.h(12),
        HydrationCardWidget(state: state),
      ],
    );
  }
}
