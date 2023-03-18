// To parse this JSON data, do
//
//     final paperModel = paperModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PaperModel paperModelFromJson(String str) => PaperModel.fromJson(json.decode(str));

String paperModelToJson(PaperModel data) => json.encode(data.toJson());

class PaperModel {
  PaperModel({
    required this.data,
    required this.status,
    required this.msg,
  });

  Data data;
  String status;
  String msg;

  factory PaperModel.fromJson(Map<String, dynamic> json) => PaperModel(
    data: Data.fromJson(json["data"]),
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status": status,
    "msg": msg,
  };
}

class Data {
  Data({
    required this.test,
    required this.section,
    required this.questions,
  });

  List<Test> test;
  List<SectionElement> section;
  List<Question> questions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    test: List<Test>.from(json["test"].map((x) => Test.fromJson(x))),
    section: List<SectionElement>.from(json["section"].map((x) => SectionElement.fromJson(x))),
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "test": List<dynamic>.from(test.map((x) => x.toJson())),
    "section": List<dynamic>.from(section.map((x) => x.toJson())),
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
  };
}

class Question {
  Question({
    required this.quesId,
    required this.section,
    required this.ques,
    required this.positiveMark,
    required this.negativeMark,
    required this.answers,
  });

  String quesId;
  SectionEnum section;
  String ques;
  String positiveMark;
  String negativeMark;
  Answers answers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    quesId: json["ques_id"],
    section: sectionEnumValues.map[json["section"]]!,
    ques: json["ques"],
    positiveMark: json["positive_mark"],
    negativeMark: json["negative_mark"],
    answers: Answers.fromJson(json["answers"]),
  );

  Map<String, dynamic> toJson() => {
    "ques_id": quesId,
    "section": sectionEnumValues.reverse[section],
    "ques": ques,
    "positive_mark": positiveMark,
    "negative_mark": negativeMark,
    "answers": answers.toJson(),
  };
}

class Answers {
  Answers({
    required this.the0,
    required this.the1,
    required this.the2,
    required this.the3,
    required this.the4,
    required this.correctOpt,
  });

  The0 the0;
  The0 the1;
  The0 the2;
  The0 the3;
  The0 the4;
  CorrectOpt correctOpt;

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
    the0: The0.fromJson(json["0"]),
    the1: The0.fromJson(json["1"]),
    the2: The0.fromJson(json["2"]),
    the3: The0.fromJson(json["3"]),
    the4: The0.fromJson(json["4"]),
    correctOpt: correctOptValues.map[json["correct_opt"]]!,
  );

  Map<String, dynamic> toJson() => {
    "0": the0.toJson(),
    "1": the1.toJson(),
    "2": the2.toJson(),
    "3": the3.toJson(),
    "4": the4.toJson(),
    "correct_opt": correctOptValues.reverse[correctOpt],
  };
}

enum CorrectOpt { A, B, C, D, E }

final correctOptValues = EnumValues({
  "A": CorrectOpt.A,
  "B": CorrectOpt.B,
  "C": CorrectOpt.C,
  "D": CorrectOpt.D,
  "E": CorrectOpt.E
});

class The0 {
  The0({
    required this.identifier,
    required this.answer,
  });

  CorrectOpt identifier;
  String answer;

  factory The0.fromJson(Map<String, dynamic> json) => The0(
    identifier: correctOptValues.map[json["identifier"]]!,
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": correctOptValues.reverse[identifier],
    "answer": answer,
  };
}

enum SectionEnum { ENGLISH, REASONING, QUANTITATIVE_APTITUDE }

final sectionEnumValues = EnumValues({
  "english": SectionEnum.ENGLISH,
  "Quantitative Aptitude": SectionEnum.QUANTITATIVE_APTITUDE,
  "reasoning": SectionEnum.REASONING
});

class SectionElement {
  SectionElement({
    required this.sectionName,
  });

  SectionEnum sectionName;

  factory SectionElement.fromJson(Map<String, dynamic> json) => SectionElement(
    sectionName: sectionEnumValues.map[json["section_name"]]!,
  );

  Map<String, dynamic> toJson() => {
    "section_name": sectionEnumValues.reverse[sectionName],
  };
}

class Test {
  Test({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.instruction,
    required this.description,
    required this.timeSeconds,
  });

  String id;
  String title;
  String imageUrl;
  String instruction;
  String description;
  String timeSeconds;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    id: json["id"],
    title: json["title"],
    imageUrl: json["image_url"],
    instruction: json["instruction"],
    description: json["description"],
    timeSeconds: json["time_seconds"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image_url": imageUrl,
    "instruction": instruction,
    "description": description,
    "time_seconds": timeSeconds,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
