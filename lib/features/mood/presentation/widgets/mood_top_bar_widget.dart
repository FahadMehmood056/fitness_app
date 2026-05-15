import 'package:flutter/material.dart';
import '../../../../../core/constants/app_text_styles.dart';

class MoodTopBarWidget extends StatelessWidget {
  const MoodTopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Mood',
      style: AppTextStyles.title.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
