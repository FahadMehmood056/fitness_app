import 'package:fitness_app/core/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/plan_bloc.dart';
import '../../../../../core/constants/app_text_styles.dart';

class PlanTopBarWidget extends StatelessWidget {
  final PlanLoaded state;
  const PlanTopBarWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Training Calendar',
            style: AppTextStyles.title.copyWith(fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () {
              context.read<PlanBloc>().add(SavePlan());
              AppSnackBar.show(
                context: context,
                message: 'Plan saved successfully!',
                isSuccess: true,
              );
            },
            child: Text(
              'Save',
              style: AppTextStyles.title.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
