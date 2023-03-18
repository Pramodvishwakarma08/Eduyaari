import 'package:eduyaari02/controllers/home_controller.dart';
import 'package:eduyaari02/screens/exam_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../res/app_colors.dart';
import 'demo.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


   go(BuildContext context ,String title){
     Navigator.push(context, MaterialPageRoute(builder: (_)=>ExamlistSCreen()));
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolor.primary2,
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        // backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.all(10.w),
            child: Text("Hello, Pramod Vishwkarma",style: TextStyle(
                color: mycolor.primary,fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          Obx(() => homeController.isloading.value? Expanded(child: Center(child: CircularProgressIndicator(),)):
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(12.h),
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                   var name= homeController.homeModel!.data[index].name;
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>ExamlistSCreen()));

                  },
                  child: Card(
                    child: Center(
                        child: Column(
                          children: [
                            Image.network(homeController.homeModel!.data[index].url, height: 100.h, width: 100.h,),
                            Text("${homeController.homeModel!.data[index].name}",style: TextStyle(
                                fontSize: 18,color: mycolor.primary,fontWeight: FontWeight.bold
                            ),),
                          ],
                        )
                    ),
                  ),
                );
              },
            ),
          )
          ),
        ],
      )
    );
  }
}




