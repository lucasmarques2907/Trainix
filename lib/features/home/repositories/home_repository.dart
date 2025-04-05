import 'package:http/http.dart' as http;
import 'package:trainix/config/imports.dart';

class HomeRepository {
  final HomeService homeService;

  HomeRepository({required this.homeService});
}
