part of 'plan_bloc.dart';

abstract class PlanState {}

class PlanInitial extends PlanState {}

class PlanLoaded extends PlanState {
  final List<PlanWeek> weeks;
  final bool isSaved;

  PlanLoaded({required this.weeks, required this.isSaved});

  PlanLoaded copyWith({List<PlanWeek>? weeks, bool? isSaved}) {
    return PlanLoaded(
      weeks: weeks ?? this.weeks,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}

class PlanWeek {
  final String weekLabel;
  final String dateRange;
  final String totalDuration;
  final List<PlanDay> days;
  final bool isExpanded;

  PlanWeek({
    required this.weekLabel,
    required this.dateRange,
    required this.totalDuration,
    required this.days,
    this.isExpanded = true,
  });

  PlanWeek copyWith({List<PlanDay>? days, bool? isExpanded}) {
    return PlanWeek(
      weekLabel: weekLabel,
      dateRange: dateRange,
      totalDuration: totalDuration,
      days: days ?? this.days,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}

class PlanDay {
  final String dayName;
  final int dayNumber;
  final PlanWorkout? workout;

  PlanDay({required this.dayName, required this.dayNumber, this.workout});

  PlanDay copyWith({PlanWorkout? workout, bool clearWorkout = false}) {
    return PlanDay(
      dayName: dayName,
      dayNumber: dayNumber,
      workout: clearWorkout ? null : workout ?? this.workout,
    );
  }
}

class PlanWorkout {
  final String title;
  final String duration;
  final WorkoutCategory category;

  PlanWorkout({
    required this.title,
    required this.duration,
    required this.category,
  });
}
