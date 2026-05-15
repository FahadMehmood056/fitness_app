part of 'mood_bloc.dart';

enum MoodType { calm, content, peaceful, happy }

extension MoodTypeExtension on MoodType {
  String get label {
    switch (this) {
      case MoodType.calm:
        return 'Calm';
      case MoodType.content:
        return 'Content';
      case MoodType.peaceful:
        return 'Peaceful';
      case MoodType.happy:
        return 'Happy';
    }
  }

  String get icon {
    switch (this) {
      case MoodType.calm:
        return Assets.icons.iconCalmMood;
      case MoodType.content:
        return Assets.icons.iconContentMood;
      case MoodType.peaceful:
        return Assets.icons.iconPeacefulMood;
      case MoodType.happy:
        return Assets.icons.iconHappyMood;
    }
  }

  double get defaultAngle {
    switch (this) {
      case MoodType.happy:
        return -pi + pi / 4;
      case MoodType.calm:
        return -pi / 4;
      case MoodType.content:
        return pi / 4;
      case MoodType.peaceful:
        return pi - pi / 4;
    }
  }

  Color get ringColor {
    switch (this) {
      case MoodType.happy:
        return const Color(0xFF6EB9AD);
      case MoodType.peaceful:
        return const Color(0xFFC9BBEF);
      case MoodType.calm:
        return const Color(0xFFF28DB3);
      case MoodType.content:
        return const Color(0xFFF99955);
    }
  }
}

abstract class MoodState {}

class MoodInitial extends MoodState {}

class MoodLoaded extends MoodState {
  final MoodType selectedMood;
  final double currentAngle;

  MoodLoaded({required this.selectedMood, required this.currentAngle});

  MoodLoaded copyWith({MoodType? selectedMood, double? currentAngle}) {
    return MoodLoaded(
      selectedMood: selectedMood ?? this.selectedMood,
      currentAngle: currentAngle ?? this.currentAngle,
    );
  }
}
