import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/plan_bloc.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/utils/sb.dart';
import 'plan_day_tile_widget.dart';

class PlanWeekSectionWidget extends StatelessWidget {
  final PlanWeek week;
  final int weekIndex;

  const PlanWeekSectionWidget({
    super.key,
    required this.week,
    required this.weekIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.planWeekBg,
        border: Border(
          top: BorderSide(
            color: weekIndex == 0 ? AppColors.purple : AppColors.tealLight,
            width: 3,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.read<PlanBloc>().add(
              ToggleWeekExpansion(weekIndex: weekIndex),
            ),
            child: _WeekHeaderWidget(week: week, weekIndex: weekIndex),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: week.isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: week.days.isNotEmpty
                ? _WeekDaysWidget(week: week, weekIndex: weekIndex)
                : const SizedBox(),
            secondChild: const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class _WeekHeaderWidget extends StatelessWidget {
  final PlanWeek week;
  final int weekIndex;
  const _WeekHeaderWidget({required this.week, required this.weekIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                week.weekLabel,
                style: AppTextStyles.heading.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SB.h(2),
              Text(
                week.dateRange,
                style: AppTextStyles.body.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightPurple,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                week.totalDuration,
                style: AppTextStyles.body.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightPurple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeekDaysWidget extends StatelessWidget {
  final PlanWeek week;
  final int weekIndex;

  const _WeekDaysWidget({required this.week, required this.weekIndex});

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      buildDefaultDragHandles: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: week.days.length,
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) newIndex--;
        context.read<PlanBloc>().add(
          ReorderWorkout(
            weekIndex: weekIndex,
            oldIndex: oldIndex,
            newIndex: newIndex,
          ),
        );
      },
      itemBuilder: (context, index) {
        return PlanDayTileWidget(
          key: ValueKey('${weekIndex}_${week.days[index].dayNumber}'),
          day: week.days[index],
          index: index,
        );
      },
    );
  }
}
