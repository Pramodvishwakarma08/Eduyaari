import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/paper_model.dart';

class PaperController extends GetxController {
  RxBool isloading = false.obs;
  PaperModel? getdata;

  @override
  Future<void> onInit() async {
    super.onInit();
    question();
  }


  question() async {
    try {
      isloading.value = true;
      var request = http.Request(
          'POST', Uri.parse('https://asbadmin.in/mobile/App_ques_list_v0'));
      request.bodyFields = {'test_id': '1'};

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        final finalresponse = PaperModel.fromJson(jsonDecode(result));
        getdata = finalresponse;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
    } finally {
      isloading.value = false;
    }
  }
}
