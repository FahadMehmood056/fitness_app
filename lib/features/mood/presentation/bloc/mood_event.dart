part of 'mood_bloc.dart';

abstract class MoodEvent {}

class LoadMood extends MoodEvent {}

class UpdateDotAngle extends MoodEvent {
  final double angle;
  UpdateDotAngle(this.angle);
}
