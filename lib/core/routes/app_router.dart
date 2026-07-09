import 'package:go_router/go_router.dart';
import 'package:sudani_app/core/routes/route_center.dart';
import 'package:sudani_app/feature/announcements/presentation/screen/announcements_screen.dart';
import '../../feature/auth/presentation/screen/login_screen.dart';
import '../../feature/home/presentation/screen/home_screen.dart';
import '../../feature/layout/presentation/screen/layout_screen.dart';
import '../../feature/splash/presentation/screen/splash_screen.dart';

class AppRouter {
  static final routes = GoRouter(
    routes: [
      ///splash
      GoRoute(
        path: RouteCenter.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      ///login
      GoRoute(
        path: RouteCenter.login,
        builder: (context, state) => const LoginScreen(),
      ),

      ///layout
      GoRoute(
        path: RouteCenter.layout,
        builder: (context, state) => const LayoutScreen(),
      ),

      ///home
      GoRoute(
        path: RouteCenter.home,
        builder: (context, state) => const HomeScreen(),
      ),

      ///announcements
      GoRoute(
        path: RouteCenter.announcements,
        builder: (context, state) => const AnnouncementsScreen(),
      ),
    ],
  );
}
