import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/create_screen.dart';
import 'screens/detail_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'detail/:id',
          builder: (context, state) {
            // 1. Capturamos el ID de la URL (Deep Link)
            final id = state.pathParameters['id'] ?? 'No ID';
            // 2. Se lo pasamos a la pantalla
            return DetailScreen(taskId: id);
          },
        ),
      ],
    ),
    GoRoute(path: '/create', builder: (context, state) => const CreateScreen()),
  ],
);
