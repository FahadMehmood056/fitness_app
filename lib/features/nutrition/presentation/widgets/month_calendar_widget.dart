import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/nutrition_bloc.dart';
import '../../../../../core/constants/app_colors.dart';

class MonthCalendarWidget extends StatelessWidget {
  final NutritionLoaded state;
  const MonthCalendarWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(
      state.focusedMonth.year,
      state.focusedMonth.month,
      1,
    );
    final daysInMonth = DateTime(
      state.focusedMonth.year,
      state.focusedMonth.month + 1,
      0,
    ).day;
    final startWeekday = firstDay.weekday;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          _CalendarHeaderWidget(state: state),
          SB.h(8),
          _CalendarWeekdaysWidget(),
          SB.h(8),
          _CalendarGridWidget(
            state: state,
            startWeekday: startWeekday,
            daysInMonth: daysInMonth,
          ),
        ],
      ),
    );
  }
}

class _CalendarHeaderWidget extends StatelessWidget {
  final NutritionLoaded state;
  const _CalendarHeaderWidget({required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left, color: AppColors.textPrimary),
          onPressed: () => context.read<NutritionBloc>().add(PreviousMonth()),
        ),
        Text(
          '${_monthName(state.focusedMonth.month)} ${state.focusedMonth.year}',
          style: AppTextStyles.body.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, color: AppColors.textPrimary),
          onPressed: () => context.read<NutritionBloc>().add(NextMonth()),
        ),
      ],
    );
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}

class _CalendarWeekdaysWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
          .map(
            (d) => Text(
              d,
              style: AppTextStyles.body.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CalendarGridWidget extends StatelessWidget {
  final NutritionLoaded state;
  final int startWeekday;
  final int daysInMonth;

  const _CalendarGridWidget({
    required this.state,
    required this.startWeekday,
    required this.daysInMonth,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
      ),
      itemCount: startWeekday - 1 + daysInMonth,
      itemBuilder: (context, index) {
        if (index < startWeekday - 1) return const SizedBox();
        final day = index - (startWeekday - 2);
        final date = DateTime(
          state.focusedMonth.year,
          state.focusedMonth.month,
          day,
        );
        final isSelected =
            date.day == state.selectedDate.day &&
            date.month == state.selectedDate.month &&
            date.year == state.selectedDate.year;

        return GestureDetector(
          onTap: () {
            context.read<NutritionBloc>().add(SelectDate(date));
            Navigator.pop(context);
          },
          child: Center(
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: isSelected ? AppColors.green.withOpacity(0.19) : null,
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(color: AppColors.green, width: 2)
                    : null,
              ),
              child: Center(
                child: Text(
                  '$day',
                  style: AppTextStyles.body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
