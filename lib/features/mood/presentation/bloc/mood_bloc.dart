import 'dart:math';
import 'package:fitness_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'mood_event.dart';
part 'mood_state.dart';

class MoodBloc extends Bloc<MoodEvent, MoodState> {
  MoodBloc() : super(MoodInitial()) {
    on<LoadMood>(_onLoadMood);
    on<UpdateDotAngle>(_onUpdateDotAngle);
  }

  void _onLoadMood(LoadMood event, Emitter<MoodState> emit) {
    emit(
      MoodLoaded(
        selectedMood: MoodType.calm,
        currentAngle: MoodType.calm.defaultAngle,
      ),
    );
  }

  void _onUpdateDotAngle(UpdateDotAngle event, Emitter<MoodState> emit) {
    if (state is MoodLoaded) {
      final current = state as MoodLoaded;
      final mood = _getMoodFromAngle(event.angle);
      emit(current.copyWith(currentAngle: event.angle, selectedMood: mood));
    }
  }

  MoodType _getMoodFromAngle(double angle) {
    double a = angle;
    while (a > pi) {
      a -= 2 * pi;
    }
    while (a < -pi) {
      a += 2 * pi;
    }

    if (a >= -pi && a < -pi / 2) {
      return MoodType.happy;
    } else if (a >= -pi / 2 && a < 0) {
      return MoodType.calm;
    } else if (a >= 0 && a < pi / 2) {
      return MoodType.content;
    } else {
      return MoodType.peaceful;
    }
  }
}
