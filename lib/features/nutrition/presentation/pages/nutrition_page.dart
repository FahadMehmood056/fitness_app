import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/core/widgets/app_loader.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:fitness_app/features/nutrition/presentation/widgets/workout_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/nutrition_bloc.dart';
import '../widgets/nutrition_top_bar_widget.dart';
import '../widgets/nutrition_date_header_widget.dart';
import '../widgets/week_strip_widget.dart';
import '../widgets/insights_section_widget.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NutritionBloc()..add(LoadNutrition()),
      child: const _NutritionView(),
    );
  }
}

class _NutritionView extends StatelessWidget {
  const _NutritionView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NutritionBloc, NutritionState>(
        builder: (context, state) {
          if (state is NutritionLoaded) {
            return SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SB.h(10),
                      NutritionTopBarWidget(state: state),
                      SB.h(16),
                      NutritionDateHeaderWidget(state: state),
                      SB.h(12),
                      WeekStripWidget(state: state),
                      SB.h(16),
                      Center(
                        child: Container(
                          height: 5,
                          color: AppColors.weekStripDivider,
                          width: 32,
                        ),
                      ),
                      SB.h(16),
                      WorkoutsSectionWidget(state: state),
                      SB.h(16),
                      InsightsSectionWidget(state: state),
                      SB.h(16),
                    ],
                  ),
                ),
              ),
            );
          }
          return const AppLoader();
        },
      ),
    );
  }
}
