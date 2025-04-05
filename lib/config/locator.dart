import 'package:get_it/get_it.dart';
import 'package:trainix/features/home/controllers/home_controller.dart';
import 'package:trainix/features/home/repositories/home_repository.dart';
import 'package:trainix/features/home/services/home_service.dart';
import 'package:trainix/features/tabs/controllers/tabs_controller.dart';
import 'package:trainix/features/tabs/repositories/tabs_repository.dart';
import 'package:trainix/features/tabs/services/tabs_service.dart';

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
