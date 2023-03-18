import 'dart:convert';
import 'package:eduyaari02/const.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../res/app_colors.dart';
import '../screens/dashboard_page.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool loading = false.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void loginWithtemail() async {
    loading.value = true;
    try {
      final response = await http.post(
        Uri.parse(AppUrl.loginApi),
        body: {
          'email_id': emailController.value.text,
          'password': passwordController.value.text,
          "app_hash": apphashcode
        },
      );
      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);
      String loginnn = data['status'];
      int login = int.parse(loginnn);
      if (login == 1) {
        emailController.value.clear();
        passwordController.value.clear();
        Get.off(() => LandingPage());
        loading.value = false;
        Get.snackbar("Login successful ", "Login successful",
            backgroundColor: mycolor.primary
        );
      } else {
        loading.value = false;
        Get.snackbar("Login Faild", "Invalid Username or Password",
            backgroundColor: mycolor.primary
        );
      }
    } catch (e) {
      loading.value = false;
      print(e.toString());
    }
  }
}
