
import 'dart:convert';

ExamlListModel examlListModelFromJson(String str) => ExamlListModel.fromJson(json.decode(str));

String examlListModelToJson(ExamlListModel data) => json.encode(data.toJson());

class ExamlListModel {
  ExamlListModel({
    required this.data,
    required this.status,
    required this.msg,
  });

  List<Datum> data;
  String status;
  String msg;

  factory ExamlListModel.fromJson(Map<String, dynamic> json) => ExamlListModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "msg": msg,
  };
}

class Datum {
  Datum({
    required this.examId,
    required this.examName,
  });

  String examId;
  String examName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    examId: json["exam_id"],
    examName: json["exam_name"],
  );

  Map<String, dynamic> toJson() => {
    "exam_id": examId,
    "exam_name": examName,
  };
}
