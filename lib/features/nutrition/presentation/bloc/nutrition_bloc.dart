import 'package:flutter_bloc/flutter_bloc.dart';
part 'nutrition_event.dart';
part 'nutrition_state.dart';

class NutritionBloc extends Bloc<NutritionEvent, NutritionState> {
  NutritionBloc() : super(NutritionInitial()) {
    on<LoadNutrition>(_onLoadNutrition);
    on<ToggleCalendar>(_onToggleCalendar);
    on<SelectDate>(_onSelectDate);
    on<PreviousMonth>(_onPreviousMonth);
    on<NextMonth>(_onNextMonth);
    on<LoadTimeOfDay>(_onLoadTimeOfDay);
  }

  void _onLoadNutrition(LoadNutrition event, Emitter<NutritionState> emit) {
    final today = DateTime(2024, 12, 22);
    final hour = DateTime.now().hour;
    final isDayTime = hour >= 6 && hour < 18;
    emit(
      NutritionLoaded(
        weekLabel: _getWeekLabel(today),
        todayDate: 'Today, 22 Dec 2024',
        temperature: '9°',
        weekDays: _getWeekDays(today),
        workoutTitle: 'Upper Body',
        workoutDate: 'December 22 - 25m - 30m',
        calories: 550,
        remainingCalories: 1950,
        totalCalories: 2500,
        weightKg: 75,
        weightChange: 1.6,
        hydrationMl: 0,
        totalHydrationMl: 2000,
        hydrationBanner: '500 ml added to water log',
        isCalendarExpanded: false,
        selectedDate: today,
        focusedMonth: today,
        isDayTime: isDayTime,
      ),
    );
  }

  void _onToggleCalendar(ToggleCalendar event, Emitter<NutritionState> emit) {
    if (state is NutritionLoaded) {
      final current = state as NutritionLoaded;
      emit(current.copyWith(isCalendarExpanded: !current.isCalendarExpanded));
    }
  }

  void _onSelectDate(SelectDate event, Emitter<NutritionState> emit) {
    if (state is NutritionLoaded) {
      final current = state as NutritionLoaded;
      emit(
        current.copyWith(
          selectedDate: event.selectedDate,
          weekDays: _getWeekDays(event.selectedDate),
          weekLabel: _getWeekLabel(event.selectedDate),
          focusedMonth: event.selectedDate,
          isCalendarExpanded: false,
        ),
      );
    }
  }

  void _onPreviousMonth(PreviousMonth event, Emitter<NutritionState> emit) {
    if (state is NutritionLoaded) {
      final current = state as NutritionLoaded;
      final previousMonth = DateTime(
        current.focusedMonth.year,
        current.focusedMonth.month - 1,
      );
      emit(current.copyWith(focusedMonth: previousMonth));
    }
  }

  void _onNextMonth(NextMonth event, Emitter<NutritionState> emit) {
    if (state is NutritionLoaded) {
      final current = state as NutritionLoaded;
      final nextMonth = DateTime(
        current.focusedMonth.year,
        current.focusedMonth.month + 1,
      );
      emit(current.copyWith(focusedMonth: nextMonth));
    }
  }

  List<Map<String, dynamic>> _getWeekDays(DateTime date) {
    final monday = date.subtract(Duration(days: date.weekday - 1));
    final days = ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'];
    return List.generate(7, (i) {
      final day = monday.add(Duration(days: i));
      return {
        'day': days[i],
        'date': day.day,
        'isSelected':
            day.day == date.day &&
            day.month == date.month &&
            day.year == date.year,
      };
    });
  }

  String _getWeekLabel(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final weekNumber = ((date.day + firstDayOfMonth.weekday - 2) / 7).ceil();
    final totalWeeks = _getTotalWeeks(date.year, date.month);
    return 'Week $weekNumber/$totalWeeks';
  }

  int _getTotalWeeks(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);
    return ((lastDay.day + firstDay.weekday - 2) / 7).ceil();
  }

  void _onLoadTimeOfDay(LoadTimeOfDay event, Emitter<NutritionState> emit) {
    if (state is NutritionLoaded) {
      final current = state as NutritionLoaded;
      final hour = DateTime.now().hour;
      final isDayTime = hour >= 6 && hour < 18;
      emit(current.copyWith(isDayTime: isDayTime));
    }
  }
}
