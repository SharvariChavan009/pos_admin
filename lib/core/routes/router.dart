import 'package:go_router/go_router.dart';
import 'package:pos_admin/features/auth/presentation/login_page.dart';
import 'package:pos_admin/features/home/presentation/home_page.dart';

import '../../features/splash/presentation/splash_page.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
      path: '/login',
      name: 'login',
  builder: (context,state) => const LoginPage(),
  ),
  GoRoute(
    path: '/home',
    name: 'home',
    builder: (context,state) => const HomePage(),
  ),
]
);