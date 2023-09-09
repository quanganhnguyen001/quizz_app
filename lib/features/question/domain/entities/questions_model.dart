class QuestionsModel {
  int? correctOption;
  List? options;
  String? question;

  QuestionsModel({this.correctOption, this.options, this.question});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    correctOption = json['correct_option'];
    options = json['options'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['correct_option'] = correctOption;
    data['options'] = options;
    data['question'] = question;
    return data;
  }

  static List<QuestionsModel> questionFromjson(List question) {
    return question.map((e) {
      return QuestionsModel.fromJson(e);
    }).toList();
  }
}
