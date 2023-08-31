class ModelAI {
  final String id;
  final int created;
  final String root;
  ModelAI({
    required this.id,
    required this.created,
    required this.root,
  });

  factory ModelAI.fromJson(Map<String, dynamic> json) {
    return ModelAI(
        id: json['id'], created: json['created'], root: json['root']);
  }

  static List<ModelAI> modelFromJson(List modelJson) {
    return modelJson.map((e) => ModelAI.fromJson(e)).toList();
  }
}
