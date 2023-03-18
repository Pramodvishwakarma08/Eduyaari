import 'dart:convert';
import 'package:eduyaari02/const.dart';
import 'package:eduyaari02/models/exam_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ExamlistController extends GetxController {
  RxBool isloading = false.obs;
  ExamlListModel? examlListModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isloading(true);
      final response = await http.post(Uri.parse(AppUrl.exam_list), body: {
        "user_id": "1",
        "inst_id" : "1"
      },);
      if(response.statusCode==200){
        var result =jsonDecode(response.body);
        print(result.toString());
        examlListModel  =ExamlListModel.fromJson(result);
      }else{print("erro feching data");}
    } catch (e) {
      // print(e.toString());
      print(" Catch block run"  );
    }finally{
      isloading(false);
    }
  }
}
