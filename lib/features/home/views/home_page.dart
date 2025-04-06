import 'package:trainix/config/imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctrl = Provider.of<HomeController>(context, listen: false);
      ctrl.initializeExercises();
      ctrl.initializeTrainings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, ctrl, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Qualquer conteúdo fixo antes da lista
                    Text(
                      'Seus Treinos',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Lista de treinos com expansão
                    ...ctrl.trainings.map((training) {
                      return Card(
                        color: AppColors.cardBackground,
                        child: ExpansionTile(
                          iconColor: AppColors.primary,
                          collapsedIconColor: AppColors.primary,
                          dense: true,
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          title: Text(
                            training.name,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: training.exercises.length,
                              separatorBuilder:
                                  (_, __) => SizedBox(height: 12.h),
                              itemBuilder: (context, exIndex) {
                                final e = training.exercises[exIndex];
                                return TrainingCard(ctrl: ctrl, exercise: e);
                              },
                            ),
                            SizedBox(height: 12.h),
                          ],
                        ),
                      );
                    }).toList(),

                    // Algo depois da lista
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Adicionar novo treino"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
