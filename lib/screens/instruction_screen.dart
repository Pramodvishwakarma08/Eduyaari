import 'package:eduyaari02/screens/paper_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/paper_controller.dart';
import '../res/app_colors.dart';

class InstructinScreen extends StatefulWidget {
  InstructinScreen({Key? key}) : super(key: key);

  @override
  State<InstructinScreen> createState() => _InstructinScreenState();
}

class _InstructinScreenState extends State<InstructinScreen> {
  PaperController paperController = Get.put(PaperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mycolor.primary2,
        appBar: AppBar(
          elevation: 0,
          title: Text("INSTRUCTIONS"),
          leadingWidth: 0,
          leading: Container(),
          // backgroundColor: Colors.transparent,
        ),
        body: Obx(() => Column(
          children: [
            Expanded(
              child:  paperController.isloading.value ? CircularProgressIndicator() : ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                itemCount: paperController.getdata!.data.test[0].instruction.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      // var name= examlistController.homeModel!.data[index].name;
                      // go(context, name);
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        child: Text(paperController.getdata!.data!.test[index].instruction,
                          style: TextStyle(
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(

                    child: Container(
                      height: 35,width: 120,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          border: Border.all(
                              color: Colors.black)
                      ),
                      child: Center(child: Text("EXIT")),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>PaperScreen()));
                    },
                    child: Container(
                      height: 35,width: 120,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          border: Border.all(
                              color: Colors.black)
                      ),
                      child: Center(child: Text("NEXT")),),
                  ),

                ],
              ),
            )
          ],
        ))
    );
  }
}




