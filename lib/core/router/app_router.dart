import 'package:go_router/go_router.dart';
import '../../features/nutrition/presentation/pages/nutrition_page.dart';
import '../../features/plan/presentation/pages/plan_page.dart';
import '../../features/mood/presentation/pages/mood_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../widgets/bottom_nav_shell.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/nutrition',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return BottomNavShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/nutrition',
            builder: (context, state) => const NutritionPage(),
          ),
          GoRoute(path: '/plan', builder: (context, state) => const PlanPage()),
          GoRoute(path: '/mood', builder: (context, state) => const MoodPage()),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
}
