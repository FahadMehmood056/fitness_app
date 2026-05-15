// ignore_for_file: deprecated_member_use

import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'plan_event.dart';
part 'plan_state.dart';

enum WorkoutCategory { arms, legs }

extension WorkoutCategoryExtension on WorkoutCategory {
  Color get color {
    switch (this) {
      case WorkoutCategory.arms:
        return AppColors.green;
      case WorkoutCategory.legs:
        return AppColors.purple;
    }
  }

  String get label {
    switch (this) {
      case WorkoutCategory.arms:
        return 'Arms Workout';
      case WorkoutCategory.legs:
        return 'Leg Workout';
    }
  }

  String get icon {
    switch (this) {
      case WorkoutCategory.arms:
        return Assets.icons.iconArmsWorkout;
      case WorkoutCategory.legs:
        return Assets.icons.iconLegsWorkout;
    }
  }

  Color get tagColor {
    switch (this) {
      case WorkoutCategory.arms:
        return AppColors.green.withOpacity(0.17);
      case WorkoutCategory.legs:
        return AppColors.purple.withOpacity(0.17);
    }
  }
}

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc() : super(PlanInitial()) {
    on<LoadPlan>(_onLoadPlan);
    on<ReorderWorkout>(_onReorderWorkout);
    on<SavePlan>(_onSavePlan);
    on<ToggleWeekExpansion>(_onToggleWeekExpansion);
  }

  void _onLoadPlan(LoadPlan event, Emitter<PlanState> emit) {
    emit(
      PlanLoaded(
        isSaved: false,
        weeks: [
          PlanWeek(
            weekLabel: 'Week 2/8',
            dateRange: 'December 8-14',
            totalDuration: 'Total: 60min',
            days: [
              PlanDay(
                dayName: 'Mon',
                dayNumber: 8,
                workout: PlanWorkout(
                  title: 'Arm Blaster',
                  duration: '25m - 30m',
                  category: WorkoutCategory.arms,
                ),
              ),
              PlanDay(dayName: 'Tue', dayNumber: 9),
              PlanDay(dayName: 'Wed', dayNumber: 10),
              PlanDay(
                dayName: 'Thu',
                dayNumber: 11,
                workout: PlanWorkout(
                  title: 'Leg Day Blitz',
                  duration: '25m - 30m',
                  category: WorkoutCategory.legs,
                ),
              ),
              PlanDay(dayName: 'Fri', dayNumber: 12),
              PlanDay(dayName: 'Sat', dayNumber: 13),
              PlanDay(dayName: 'Sun', dayNumber: 14),
            ],
          ),
          PlanWeek(
            weekLabel: 'Week 2',
            dateRange: 'December 14-22',
            totalDuration: 'Total: 60min',
            days: [
              PlanDay(
                dayName: 'Mon',
                dayNumber: 14,
                workout: PlanWorkout(
                  title: 'Arm Blaster',
                  duration: '25m - 30m',
                  category: WorkoutCategory.arms,
                ),
              ),
              PlanDay(dayName: 'Tue', dayNumber: 15),
              PlanDay(dayName: 'Wed', dayNumber: 16),
              PlanDay(
                dayName: 'Thu',
                dayNumber: 17,
                workout: PlanWorkout(
                  title: 'Leg Day Blitz',
                  duration: '25m - 30m',
                  category: WorkoutCategory.legs,
                ),
              ),
              PlanDay(dayName: 'Fri', dayNumber: 18),
              PlanDay(dayName: 'Sat', dayNumber: 19),
              PlanDay(dayName: 'Sun', dayNumber: 20),
            ],
          ),
        ],
      ),
    );
  }

  void _onReorderWorkout(ReorderWorkout event, Emitter<PlanState> emit) {
    if (state is PlanLoaded) {
      final current = state as PlanLoaded;
      final weeks = List<PlanWeek>.from(current.weeks);
      final days = List<PlanDay>.from(weeks[event.weekIndex].days);

      final oldDay = days[event.oldIndex];
      final newDay = days[event.newIndex];

      days[event.oldIndex] = oldDay.copyWith(
        workout: newDay.workout,
        clearWorkout: newDay.workout == null,
      );
      days[event.newIndex] = newDay.copyWith(
        workout: oldDay.workout,
        clearWorkout: oldDay.workout == null,
      );

      weeks[event.weekIndex] = weeks[event.weekIndex].copyWith(days: days);
      emit(current.copyWith(weeks: weeks));
    }
  }

  void _onSavePlan(SavePlan event, Emitter<PlanState> emit) {
    if (state is PlanLoaded) {
      final current = state as PlanLoaded;
      emit(current.copyWith(isSaved: true));
    }
  }

  void _onToggleWeekExpansion(
    ToggleWeekExpansion event,
    Emitter<PlanState> emit,
  ) {
    if (state is PlanLoaded) {
      final current = state as PlanLoaded;
      final weeks = List<PlanWeek>.from(current.weeks);
      weeks[event.weekIndex] = weeks[event.weekIndex].copyWith(
        isExpanded: !weeks[event.weekIndex].isExpanded,
      );
      emit(current.copyWith(weeks: weeks));
    }
  }
}
