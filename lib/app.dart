import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resumequest/common/common.dart';
import 'package:resumequest/common/theme/custom_theme_app.dart';
import 'package:resumequest/screen/main/s_main.dart';
import 'package:resumequest/screen/main/tab/gemini/accepted_essay_screen.dart';
import 'package:resumequest/screen/main/tab/gemini/carrier_info_screen.dart';
import 'package:resumequest/screen/main/tab/gemini/gemini_screen.dart';
import 'package:resumequest/screen/main/tab/gemini/personal_story_screen.dart';
import 'package:resumequest/screen/main/tab/gemini/result_screen.dart';

import 'common/theme/custom_theme.dart';

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  ///light, dark 테마가 준비되었고, 시스템 테마를 따라가게 하려면 해당 필드를 제거 하시면 됩니다.
  static const defaultTheme = CustomTheme.light;
  static bool isForeground = true;

  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> with Nav, WidgetsBindingObserver {
  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomThemeApp(
      child: Builder(builder: (context) {
        return ProviderScope(
          child: MaterialApp.router(
            // navigatorKey: App.navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            routerConfig: _router,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: '서합부터',
            theme: context.themeType.themeData,
            color: AppColors.grey50,
            // home: const MainScreen(),
          ),
        );
      }),
    );
  }

  final _router = GoRouter(
    initialLocation: "/gemini",
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
      GoRoute(
        name: CarrierInfoScreen.routeName,
        path: CarrierInfoScreen.routeUrl,
        builder: (context, state) => const CarrierInfoScreen(),
      ),
      GoRoute(
        name: PersonalStoryScreen.routeName,
        path: PersonalStoryScreen.routeUrl,
        builder: (context, state) => const PersonalStoryScreen(),
      ),
      GoRoute(
        name: AcceptedEssayScreen.routeName,
        path: AcceptedEssayScreen.routeUrl,
        builder: (context, state) => const AcceptedEssayScreen(),
      ),
      GoRoute(
        name: ResultScreen.routeName,
        path: ResultScreen.routeUrl,
        builder: (context, state) => const ResultScreen(),
      ),
    ],
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        App.isForeground = true;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        App.isForeground = false;
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden: //Flutter 3.13 이하 버전을 쓰신다면 해당 라인을 삭제해주세요.
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
