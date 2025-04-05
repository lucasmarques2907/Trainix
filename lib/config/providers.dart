import 'package:trainix/config/imports.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => locator<HomeController>()),
  ChangeNotifierProvider(create: (_) => locator<TabsController>()),
];
