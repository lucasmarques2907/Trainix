import 'package:trainix/config/imports.dart';

class TrainingCard extends StatefulWidget {
  final HomeController ctrl;
  final ExerciseModel exercise;
  const TrainingCard({super.key, required this.ctrl, required this.exercise});

  @override
  State<TrainingCard> createState() => _TrainingCardState();
}

class _TrainingCardState extends State<TrainingCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              // <- isso resolve
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
                          widget.exercise.name,
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
                      Text(
                        '${widget.exercise.series}x${widget.exercise.valuePerSeries}${widget.exercise.isTimed ? 's' : ""}',
                      ),
                      SizedBox(width: 12.w),
                      Icon(Icons.timer, size: 16.sp, color: AppColors.primary),
                      SizedBox(width: 4.w),
                      Text('${widget.exercise.rest}s'),
                    ],
                  ),
                  if ((widget.exercise.observations?.isNotEmpty ?? false)) ...[
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.notes, size: 16.sp),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            widget.exercise.observations!,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () {
                      logger.d(widget.exercise.video);
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
            Checkbox(
              activeColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              value: widget.exercise.isCompleted,
              onChanged: (value) {
                widget.exercise.isCompleted = value!;
                widget.ctrl.update(); // se quiser reatividade
              },
            ),
          ],
        ),
      ),
    );
  }
}
