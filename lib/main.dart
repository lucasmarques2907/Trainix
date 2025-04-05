import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:trainix/config/locator.dart';
import 'package:trainix/config/providers.dart';
import 'package:trainix/routing/router.dart';
import 'package:trainix/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  setupLocator(); // Injeção de dependências via GetIt

  runApp(
    ProviderScope(
      child: MultiProvider(
        providers: appProviders,
        child: const TrainixApp(),
      ),
    ),
  );
}

class TrainixApp extends ConsumerStatefulWidget {
  const TrainixApp({super.key});

  @override
  ConsumerState<TrainixApp> createState() => _TrainixAppState();
}

class _TrainixAppState extends ConsumerState<TrainixApp> {
  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: 'Trainix',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lexend',
          brightness: Brightness.light,
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: AppColors.textPrimary),
          ),
        ),
        themeMode: ThemeMode.system,
        routerConfig: goRouter,
      ),
    );
  }
}
