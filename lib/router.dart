import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resumequest/screen/main/s_main.dart';
import 'package:resumequest/screen/main/tab/gemini/gemini_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/",
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: GeminiFragment.routeName,
          path: GeminiFragment.routeUrl,
          builder: (context, state) => const GeminiFragment(),
        ),
        GoRoute(
          name: MainScreen.routeName,
          path: MainScreen.routeUrl,
          builder: (context, state) => const MainScreen(),
        ),
      ],
    );
  },
);
