import 'package:flutter/material.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/utils/sb.dart';

class MoodQuestionWidget extends StatelessWidget {
  const MoodQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Start your day',
            style: AppTextStyles.body.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          SB.h(5),
          Text(
            'How are you feeling at the Moment?',
            style: AppTextStyles.body.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
