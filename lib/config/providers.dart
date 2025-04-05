import 'package:provider/provider.dart';
import 'package:trainix/config/locator.dart';
import 'package:provider/single_child_widget.dart';
import 'package:trainix/features/home/controllers/home_controller.dart';
import 'package:trainix/features/tabs/controllers/tabs_controller.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => locator<HomeController>()),
  ChangeNotifierProvider(create: (_) => locator<TabsController>()),
];
