import 'package:trainix/config/imports.dart';

class HomeController with ChangeNotifier {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});
}
