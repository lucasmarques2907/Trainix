class ExerciseModel {
  final int? id;
  final String name;
  final int series;
  final int reps;
  final int rest;
  final String? observations;

  ExerciseModel({
    this.id,
    required this.name,
    required this.series,
    required this.reps,
    required this.rest,
    this.observations,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      name: json['name'],
      series: json['series'],
      reps: json['reps'],
      rest: json['rest'],
      observations: json['observations'] ?? "",
    );
  }

  Map<String, dynamic> toJson({bool includeId = false}) {
    final Map<String, dynamic> data = {
      'name': name,
      'series': series,
      'reps': reps,
      'rest': rest,
      'observations': observations ?? "",
    };

    if (includeId && id != null) {
      data['id'] = id;
    }

    return data;
  }
}
