import 'package:eduyaari02/screens/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import '../../res/app_colors.dart';
import '../../res/app_icons_icons.dart';
import '../../res/custom_text_styles.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);


  LoginController loginController = Get.put(LoginController());
  var isLogin = false.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100.h,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImg.splashlogo,
                      width: MediaQuery.of(context).size.width - 100,
                    ),
                    Gap(12.h),
                    const Text(" Welcome Back!", style:ktext20p,),
                    Gap(5.h),
                    const Text("  Please sign in to your account", style: TextStyle(fontSize: 17,),),
                  ],
                ),
              ),
              Gap(80.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: loginController.emailController.value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username",
                      hintText: "Username",
                    ),
                  ),
                  Gap(20.h),
                  TextField(
                    controller: loginController.passwordController.value,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "Password",
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: ktext16p,

                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 90.h,
              ),

              Obx(
                () => GestureDetector(
                  onTap: () {
                    loginController.loginWithtemail();
                  },
                  child: loginController.loading.value
                      ? Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: mycolor.primary
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: CircularProgressIndicator()))
                      : Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: mycolor.primary,
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account ?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                  TextButton(
                      onPressed: () {
                        Get.to(LandingPage());
                      },
                      child: const Text(
                        "Register Now",
                        style: TextStyle(fontSize: 14)
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
