import 'package:trainix/config/imports.dart';

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
    final tabCtrl = TabController(
      length: tabsController.tabs.length,
      vsync: this,
    );
    tabsController.init(tabCtrl);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabsController>(
      builder: (context, ctrl, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.cardBackground,
            title: Text(
              ctrl.currentTitle,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            controller: ctrl.tabController,
            children: ctrl.views,
          ),
          bottomNavigationBar: Material(
            color: AppColors.cardBackground,
            child: SizedBox(
              height: 60,
              child: TabBar(
                dividerColor: Colors.transparent,
                controller: ctrl.tabController,
                tabs: ctrl.tabs,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primary,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.textPrimary,
                unselectedLabelColor: Colors.white60,
                overlayColor: WidgetStatePropertyAll(
                  AppColors.primary.withAlpha(10),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
