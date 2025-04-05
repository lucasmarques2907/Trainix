import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainix/features/tabs/controllers/tabs_controller.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final tabsController = context.read<TabsController>();
    final tabCtrl = TabController(length: tabsController.tabs.length, vsync: this);
    tabsController.init(tabCtrl);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabsController>(
      builder: (context, ctrl, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(ctrl.currentTitle),
            centerTitle: true,
          ),
          body: TabBarView(
            controller: ctrl.tabController,
            children: ctrl.views,
          ),
          bottomNavigationBar: Material(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              controller: ctrl.tabController,
              tabs: ctrl.tabs,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              indicatorColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
