import 'package:fitness_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';

class BottomNavShell extends StatelessWidget {
  final Widget child;
  const BottomNavShell({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/plan')) return 1;
    if (location.startsWith('/mood')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.divider, width: 0.5)),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.bottomNavBg,
          currentIndex: _currentIndex(context),
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/nutrition');
                break;
              case 1:
                context.go('/plan');
                break;
              case 2:
                context.go('/mood');
                break;
              case 3:
                context.go('/profile');
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: SvgPicture.asset(
                  Assets.icons.iconNutrition,
                  width: 24,
                  height: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: SvgPicture.asset(
                  Assets.icons.iconNutrition,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Nutrition',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: SvgPicture.asset(
                  Assets.icons.iconPlan,
                  width: 24,
                  height: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: SvgPicture.asset(
                  Assets.icons.iconPlan,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Plan',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: SvgPicture.asset(
                  Assets.icons.iconMood,
                  width: 24,
                  height: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: SvgPicture.asset(
                  Assets.icons.iconMood,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Mood',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: SvgPicture.asset(
                  Assets.icons.iconProfile,
                  width: 24,
                  height: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: SvgPicture.asset(
                  Assets.icons.iconProfile,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
