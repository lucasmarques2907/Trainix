import 'package:flutter/material.dart';
import 'package:trainix/features/profile/views/profile_page.dart';
import 'package:trainix/features/tabs/repositories/tabs_repository.dart';
import 'package:trainix/features/training/views/training_page.dart';

class TabsController extends ChangeNotifier {
  final TabsRepository tabsRepository;

  TabsController({required this.tabsRepository});

  late TabController tabController;

  final List<Tab> tabs = const [
    Tab(icon: Icon(Icons.fitness_center), text: 'Treinos'),
    Tab(icon: Icon(Icons.person), text: 'Perfil'),
  ];

  void init(TabController controller) {
    tabController = controller;
    tabController.addListener(_onTabChange);
  }

  void _onTabChange() {
    notifyListeners();
  }

  int get currentIndex => tabController.index;

  String get currentTitle {
    switch (currentIndex) {
      case 0:
        return 'Treinos';
      case 1:
        return 'Perfil';
      default:
        return 'Trainix';
    }
  }

  List<Widget> get views => const [
    TrainingPage(),
    ProfilePage(),
  ];

  void switchTo(int index) {
    if (tabController.index != index) {
      tabController.animateTo(index);
    }
  }

  @override
  void dispose() {
    tabController.removeListener(_onTabChange);
    tabController.dispose();
    super.dispose();
  }
}
