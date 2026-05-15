import 'package:fitness_app/core/utils/sb.dart';
import 'package:fitness_app/features/plan/presentation/widgets/plan_top_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/plan_bloc.dart';
import '../widgets/plan_week_section_widget.dart';
import '../../../../../core/widgets/app_loader.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlanBloc()..add(LoadPlan()),
      child: const _PlanView(),
    );
  }
}

class _PlanView extends StatelessWidget {
  const _PlanView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlanBloc, PlanState>(
        builder: (context, state) {
          if (state is PlanLoaded) {
            return SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SB.h(10),
                        PlanTopBarWidget(state: state),
                        SB.h(30),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return PlanWeekSectionWidget(
                        week: state.weeks[index],
                        weekIndex: index,
                      );
                    }, childCount: state.weeks.length),
                  ),
                ],
              ),
            );
          }
          return const AppLoader();
        },
      ),
    );
  }
}
