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

                    // Lista de cards dos treinos
                    ...ctrl.trainings.map((training) {
                      return Card(
                        color: AppColors.cardBackground,
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                training.name,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: training.exercises.length,
                                separatorBuilder:
                                    (_, __) => SizedBox(height: 12.h),
                                itemBuilder: (context, exIndex) {
                                  final e = training.exercises[exIndex];
                                  return ExerciseCard(e);
                                },
                              ),
                            ],
                          ),
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

  Widget ExerciseCard(ExerciseModel e) {
    return Card(
      color: AppColors.background,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.fitness_center_rounded,
                  size: 20.sp,
                  color: AppColors.primary,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    e.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.repeat, size: 16.sp, color: AppColors.primary),
                SizedBox(width: 4.w),
                Text('${e.series}x${e.valuePerSeries} ${e.isTimed ? 's' : ""}'),
                SizedBox(width: 12.w),
                Icon(Icons.timer, size: 16.sp, color: AppColors.primary),
                SizedBox(width: 4.w),
                Text('${e.rest}s'),
              ],
            ),
            if ((e.observations?.isNotEmpty ?? false)) ...[
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.notes, size: 16.sp),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      e.observations!,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ],
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                logger.d(e.video);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.play_circle_fill_rounded,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'Ver Vídeo',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
