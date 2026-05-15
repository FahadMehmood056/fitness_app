import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class WaterChartWidget extends StatelessWidget {
  const WaterChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 35,
            child: Column(
              children: [
                Text(
                  '2 L',
                  style: AppTextStyles.body.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFBFBFB),
                  ),
                ),
                const Spacer(),
                Text(
                  '0 L',
                  style: AppTextStyles.body.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFBFBFB),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 35,
                  bottom: 6,
                  child: Container(height: 1, color: Color(0xFF363638)),
                ),

                Positioned(
                  right: 0,
                  bottom: -5,
                  child: Text(
                    '0ml',
                    style: AppTextStyles.body.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFBFBFB),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 6,
                  bottom: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _BlueBar(),
                      ...List.generate(4, (_) => const _Dot()),
                      _BlueBar(),
                      ...List.generate(4, (_) => const _Dot()),
                      _BlueBar(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BlueBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 2,
      decoration: BoxDecoration(
        color: const Color(0xFF26364A),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
