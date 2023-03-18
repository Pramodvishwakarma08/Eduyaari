import 'dart:convert';
import 'package:eduyaari02/const.dart';
import 'package:eduyaari02/models/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxBool isloading = false.obs;
  HomeModel? homeModel;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

 @override
  Future<void> onInit() async {
   super.onInit();
   fetchData();

 }


   fetchData() async {
    try {
      isloading(true);
      final response = await http.post(Uri.parse(AppUrl.home_elements), body: {"app_hash": apphashcode},);
      if(response.statusCode==200){
        var result =jsonDecode(response.body);
         print(result.toString());
         homeModel  =HomeModel.fromJson(result);
      }else{print("erro feching data");}
      } catch (e) {
                    print(" Catch block run  ${e.toString()}}");
     }finally{
            isloading(false);
    }
   }
  }
