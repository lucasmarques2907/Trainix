import 'package:trainix/config/imports.dart';

class HomeController with ChangeNotifier {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  List<TrainingModel> trainings = [];
  List<ExerciseModel> exercises = [];

  void initializeExercises() {
    exercises = [
      ExerciseModel(
        name: 'Cadeira Extensora',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      ),
      ExerciseModel(
        name: 'Leg Press 45',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      ),
      ExerciseModel(
        name: 'Cadeira Flexora',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      ),
      ExerciseModel(
        name: 'Flexora Vertical Unilateral',
        series: 3,
        isTimed: false,
        valuePerSeries: 12,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        observations: '12 cada lado',
      ),
      ExerciseModel(
        name: 'Cadeira Adutora',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      ),
      ExerciseModel(
        name: 'Cadeira Abdutora',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      ),
      ExerciseModel(
        name: 'Panturrilha Máquina Em Pé',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      ),
      ExerciseModel(
        name: 'Prancha Isométrica',
        series: 3,
        isTimed: true,
        valuePerSeries: 30,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      ),
      ExerciseModel(
        name: 'LISS',
        series: 1,
        isTimed: true,
        valuePerSeries: 30,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        observations: "Caminhada inclinada, bike leve ou escada",
      ),
    ];
    notifyListeners();
  }

  void initializeTrainings() {
    trainings = [TrainingModel(name: 'Treino C', exercises: exercises)];
    notifyListeners();
  }
}
