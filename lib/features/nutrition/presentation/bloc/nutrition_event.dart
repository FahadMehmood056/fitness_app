part of 'nutrition_bloc.dart';

abstract class NutritionEvent {}

class LoadNutrition extends NutritionEvent {}

class ToggleCalendar extends NutritionEvent {}

class SelectDate extends NutritionEvent {
  final DateTime selectedDate;
  SelectDate(this.selectedDate);
}

class PreviousMonth extends NutritionEvent {}

class NextMonth extends NutritionEvent {}

class LoadTimeOfDay extends NutritionEvent {}
