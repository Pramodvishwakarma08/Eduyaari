// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    required this.data,
    required this.status,
    required this.msg,
  });

  List<Datum> data;
  String status;
  String msg;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
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
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
