import 'package:http/http.dart' as http;
import 'package:trainix/features/home/services/home_service.dart';

class HomeRepository {
  final HomeService homeService;

  HomeRepository({required this.homeService});
}
