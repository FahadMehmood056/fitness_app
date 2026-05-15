part of 'plan_bloc.dart';

abstract class PlanEvent {}

class LoadPlan extends PlanEvent {}

class ReorderWorkout extends PlanEvent {
  final int weekIndex;
  final int oldIndex;
  final int newIndex;

  ReorderWorkout({
    required this.weekIndex,
    required this.oldIndex,
    required this.newIndex,
  });
}

class SavePlan extends PlanEvent {}

class ToggleWeekExpansion extends PlanEvent {
  final int weekIndex;
  ToggleWeekExpansion({required this.weekIndex});
}
