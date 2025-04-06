import 'package:trainix/config/imports.dart';

class HomeController with ChangeNotifier {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  List<TrainingModel> trainings = [];
  List<ExerciseModel> exercises = [];
  bool teste = false;

  void initializeExercises() {
    exercises = [
      ExerciseModel(
        name: 'Cadeira Extensora',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        isCompleted: false,
      ),
      ExerciseModel(
        name: 'Leg Press 45',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        isCompleted: false,
      ),
      ExerciseModel(
        name: 'Cadeira Flexora',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        isCompleted: false,
      ),
      ExerciseModel(
        name: 'Flexora Vertical Unilateral',
        series: 3,
        isTimed: false,
        valuePerSeries: 12,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        observations: '12 cada lado',
        isCompleted: false,
      ),
      ExerciseModel(
        name: 'Cadeira Adutora',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        isCompleted: false,
      ),
      ExerciseModel(
        name: 'Cadeira Abdutora',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        isCompleted: false,
      ),
      ExerciseModel(
        name: 'Panturrilha Máquina Em Pé',
        series: 3,
        isTimed: false,
        valuePerSeries: 15,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        isCompleted: false,
      ),
      ExerciseModel(
        name: 'Prancha Isométrica',
        series: 3,
        isTimed: true,
        valuePerSeries: 30,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        isCompleted: false,
      ),
      ExerciseModel(
        name: 'LISS',
        series: 1,
        isTimed: true,
        valuePerSeries: 30,
        rest: 60,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        observations: "Caminhada inclinada, bike leve ou escada",
        isCompleted: false,
      ),
    ];
    notifyListeners();
  }

  void initializeTrainings() {
    trainings = [TrainingModel(name: 'Treino A', exercises: exercises)];
    trainings += [TrainingModel(name: 'Treino B', exercises: exercises)];
    trainings += [TrainingModel(name: 'Treino C', exercises: exercises)];
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}
