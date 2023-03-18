import 'package:eduyaari02/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/exam_list_controller.dart';
import '../controllers/exam_list_controller.dart';
import '../res/app_colors.dart';
import 'demo.dart';

class ExamlistSCreen extends StatelessWidget {
  ExamlistSCreen({Key? key}) : super(key: key);

  ExamlistController examlistController = Get.put(ExamlistController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  go(BuildContext context ,String title){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>Demo(title: title,)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: mycolor.primary2,
        appBar: AppBar(
          elevation: 0,
          title: Text("Exams"),

        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => examlistController.isloading.value? Expanded(child: Center(child: CircularProgressIndicator(),)):
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                itemCount:examlistController.examlListModel!.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      // var name= examlistController.homeModel!.data[index].name;
                      // go(context, name);
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(examlistController.examlListModel!.data[index].examName,style: TextStyle(
                                fontSize: 18,color: mycolor.primary,fontWeight: FontWeight.bold
                            ),),
                            Icon(Icons.arrow_forward_ios,color: mycolor.primary,weight: 50,)
                          ],
                        ),
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




