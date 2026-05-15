import 'package:fitness_app/core/utils/sb.dart';
import 'package:fitness_app/features/mood/presentation/widgets/mood_gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/mood_bloc.dart';
import '../widgets/mood_top_bar_widget.dart';
import '../widgets/mood_question_widget.dart';
import '../widgets/mood_ring_widget.dart';
import '../widgets/mood_continue_button_widget.dart';
import '../../../../../core/widgets/app_loader.dart';

class MoodPage extends StatelessWidget {
  const MoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoodBloc()..add(LoadMood()),
      child: const _MoodView(),
    );
  }
}

class _MoodView extends StatelessWidget {
  const _MoodView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MoodBloc, MoodState>(
        builder: (context, state) {
          if (state is MoodLoaded) {
            return Stack(
              children: [
                MoodBackgroundWidget(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SB.h(10),
                        MoodTopBarWidget(),
                        SB.h(16),
                        MoodQuestionWidget(),
                        Expanded(
                          child: Center(child: MoodRingWidget(state: state)),
                        ),
                        MoodContinueButtonWidget(state: state),
                        SB.h(16),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const AppLoader();
        },
      ),
    );
  }
}
