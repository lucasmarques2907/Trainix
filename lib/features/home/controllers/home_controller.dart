import 'package:flutter/widgets.dart';
import 'package:trainix/features/home/repositories/home_repository.dart';

class HomeController with ChangeNotifier {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});
}
