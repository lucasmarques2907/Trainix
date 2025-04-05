import 'package:trainix/shared/models/exercise_model.dart';

class TrainingModel {
  final int? id;
  final String name;
  final String? description;
  final List<ExerciseModel> exercises;

  TrainingModel({
    this.id,
    required this.name,
    this.description,
    required this.exercises,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? "",
      exercises: json['exercises'],
    );
  }

  Map<String, dynamic> toJson({bool includeId = false}) {
    final Map<String, dynamic> data = {
      'name': name,
      'description': description ?? "",
      'exercises': exercises,
    };

    if (includeId && id != null) {
      data['id'] = id;
    }

    return data;
  }
}
