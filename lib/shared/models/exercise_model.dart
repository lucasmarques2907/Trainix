class ExerciseModel {
  final int? id;
  final String name;
  final int series;
  final bool isTimed;
  final int valuePerSeries;
  final int rest;
  final String video;
  final String? observations;
  bool isCompleted;

  ExerciseModel({
    this.id,
    required this.name,
    required this.series,
    required this.isTimed,
    required this.valuePerSeries,
    required this.rest,
    required this.video,
    required this.isCompleted,
    this.observations,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      name: json['name'],
      series: json['series'],
      isTimed: json['isTimed'],
      valuePerSeries: json['valuePerSeries'],
      rest: json['rest'],
      video: json['video'],
      observations: json['observations'] ?? "",
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson({bool includeId = false}) {
    final Map<String, dynamic> data = {
      'name': name,
      'series': series,
      'isTimed': isTimed,
      'valuePerSeries': valuePerSeries,
      'rest': rest,
      'video': video,
      'observations': observations ?? "",
      'isCompleted': false,
    };

    if (includeId && id != null) {
      data['id'] = id;
    }

    return data;
  }
}
