part of 'nutrition_bloc.dart';

abstract class NutritionState {}

class NutritionInitial extends NutritionState {}

class NutritionLoaded extends NutritionState {
  final String weekLabel;
  final String todayDate;
  final List<Map<String, dynamic>> weekDays;
  final String temperature;
  final String workoutTitle;
  final String workoutDate;
  final int calories;
  final int remainingCalories;
  final int totalCalories;
  final double weightKg;
  final double weightChange;
  final int hydrationMl;
  final int totalHydrationMl;
  final String hydrationBanner;
  final bool isCalendarExpanded;
  final DateTime selectedDate;
  final DateTime focusedMonth;
  final bool isDayTime;

  NutritionLoaded({
    required this.weekLabel,
    required this.todayDate,
    required this.weekDays,
    required this.temperature,
    required this.workoutTitle,
    required this.workoutDate,
    required this.calories,
    required this.remainingCalories,
    required this.totalCalories,
    required this.weightKg,
    required this.weightChange,
    required this.hydrationMl,
    required this.totalHydrationMl,
    required this.hydrationBanner,
    required this.isCalendarExpanded,
    required this.selectedDate,
    required this.focusedMonth,
    required this.isDayTime,
  });

  NutritionLoaded copyWith({
    String? weekLabel,
    String? todayDate,
    List<Map<String, dynamic>>? weekDays,
    String? temperature,
    String? workoutTitle,
    String? workoutDate,
    int? calories,
    int? remainingCalories,
    int? totalCalories,
    double? weightKg,
    double? weightChange,
    int? hydrationMl,
    int? totalHydrationMl,
    String? hydrationBanner,
    bool? isCalendarExpanded,
    DateTime? selectedDate,
    DateTime? focusedMonth,
    bool? isDayTime,
  }) {
    return NutritionLoaded(
      weekLabel: weekLabel ?? this.weekLabel,
      todayDate: todayDate ?? this.todayDate,
      weekDays: weekDays ?? this.weekDays,
      temperature: temperature ?? this.temperature,
      workoutTitle: workoutTitle ?? this.workoutTitle,
      workoutDate: workoutDate ?? this.workoutDate,
      calories: calories ?? this.calories,
      remainingCalories: remainingCalories ?? this.remainingCalories,
      totalCalories: totalCalories ?? this.totalCalories,
      weightKg: weightKg ?? this.weightKg,
      weightChange: weightChange ?? this.weightChange,
      hydrationMl: hydrationMl ?? this.hydrationMl,
      totalHydrationMl: totalHydrationMl ?? this.totalHydrationMl,
      hydrationBanner: hydrationBanner ?? this.hydrationBanner,
      isCalendarExpanded: isCalendarExpanded ?? this.isCalendarExpanded,
      selectedDate: selectedDate ?? this.selectedDate,
      focusedMonth: focusedMonth ?? this.focusedMonth,
      isDayTime: isDayTime ?? this.isDayTime,
    );
  }
}
