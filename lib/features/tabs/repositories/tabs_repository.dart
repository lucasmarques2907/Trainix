import 'package:http/http.dart' as http;
import 'package:trainix/features/tabs/services/tabs_service.dart';

class TabsRepository {
  final TabsService tabsService;

  TabsRepository({required this.tabsService});
}
