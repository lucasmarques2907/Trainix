import 'package:go_router/go_router.dart';

String getPageTitle(String location, Map<String, String> titlesMap) {
  if (titlesMap.containsKey(location)) {
    return titlesMap[location]!;
  }

  for (final entry in titlesMap.entries) {
    if (location.startsWith(entry.key)) {
      return entry.value;
    }
  }

  return 'Trainix';
}

bool getShowBack(GoRouterState state) {
  final path = state.uri.path;
  const noBackRoutes = [
    '/splash',
  ];

  return !noBackRoutes.contains(path);
}
