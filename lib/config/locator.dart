import 'package:trainix/config/imports.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Tabs
  locator.registerLazySingleton<TabsService>(() => TabsService());
  locator.registerLazySingleton<TabsRepository>(
    () => TabsRepository(tabsService: locator<TabsService>()),
  );
  locator.registerLazySingleton<TabsController>(
    () => TabsController(tabsRepository: locator<TabsRepository>()),
  );

  // Home
  locator.registerLazySingleton<HomeService>(() => HomeService());
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepository(homeService: locator<HomeService>()),
  );
  locator.registerLazySingleton<HomeController>(
    () => HomeController(homeRepository: locator<HomeRepository>()),
  );
}
