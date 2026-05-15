import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:fitness_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/nutrition_bloc.dart';
import '../../../../../core/constants/app_colors.dart';
import 'month_calendar_widget.dart';

class NutritionTopBarWidget extends StatelessWidget {
  final NutritionLoaded state;
  const NutritionTopBarWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.icons.iconBell),
        GestureDetector(
          onTap: () => _showCalendarBottomSheet(context),
          child: Row(
            children: [
              SvgPicture.asset(Assets.icons.iconWeek),
              SB.w(6),
              Text(state.weekLabel, style: AppTextStyles.body),
              SB.w(4),
              SvgPicture.asset(Assets.icons.iconArrowDown),
            ],
          ),
        ),
        SizedBox(),
      ],
    );
  }

  void _showCalendarBottomSheet(BuildContext context) {
    final bloc = context.read<NutritionBloc>();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardBg,
      useRootNavigator: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BlocProvider.value(
          value: bloc,
          child: BlocBuilder<NutritionBloc, NutritionState>(
            builder: (context, state) {
              if (state is NutritionLoaded) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: MonthCalendarWidget(state: state),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}
