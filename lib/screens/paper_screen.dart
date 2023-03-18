import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';

import '../controllers/paper_controller.dart';
import 'answer_sheet_page.dart';


class PaperScreen extends StatefulWidget {
   PaperScreen({Key? key}) : super(key: key);

  @override
  State<PaperScreen> createState() => _PaperScreenState();
}

class _PaperScreenState extends State<PaperScreen> with SingleTickerProviderStateMixin{

   Map<int,String> selectedValues=Map();

  PaperController paperController=Get.put(PaperController());
   PageController pagecontroller = PageController(initialPage: 0);
   late CustomTimerController _controller = CustomTimerController(
       vsync: this,
       begin: Duration(seconds: 600),
       // begin: Duration(seconds: int.parse(paperController.isloading.value ? "00":paperController.getdata!.data.test[0].timeSeconds)),

       end: Duration(),
       initialState: CustomTimerState.reset,
       interval: CustomTimerInterval.milliseconds);

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _controller.start();

    });
  }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Color(0xffeef3f9),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Attemted"),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Not Answered"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                      child: Row(
                        children: [
                          Container(
                            child: Center(
                              child: Text(
                                "96",
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Not Attemted"),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            color: Colors.yellowAccent,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Solve Later"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child:  GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          pagecontroller.jumpToPage(index);
                          Navigator.pop(context);

                        },
                        child: Container(
                          child: Center(child: Text("${index + 1}")),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black87),
                          ),
                        ),
                      ),
                    );
                  },
                )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // nextQution();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff35cb64),
                        onPrimary: Colors.white,
                      ),
                      child: Text("Sumbit Test")),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green),
          backgroundColor: Color(0xffeef3f9),
          elevation: 1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  CustomTimer(
                      controller: _controller,
                      builder: (state, time) {
                        // Build the widget you want!🎉
                        return Text(
                          "${time.hours}:${time.minutes}:${time.seconds}",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        );
                      }),
                ],
              ),
              ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color(0xff35cb64),
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    "PAUSE",
                    style: TextStyle(fontSize: 12),
                  )),
              ElevatedButton(
                  onPressed: () {
                    print(selectedValues);
                    Get.off(()=> AnswerPage(title: selectedValues,));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color(0xff35cb64),
                    onPrimary: Colors.white,
                  ),
                  child: Text("Sumbit")),
            ],
          ),
        ),

        body: Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
          children: [
            Expanded(
              child: Container(
                child:paperController.isloading.value ? Center(child: CircularProgressIndicator()):
                PageView.builder(
                  controller: pagecontroller,
                  itemCount: paperController.getdata!.data!.questions.length,
                  itemBuilder: (context, index) =>
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 50,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              color: Color(0xfff2f2f2),
                            ),
                            padding: EdgeInsets.all(18),
                            width: double.infinity,
                            child: Text(
                              "Q. ${ index+ 1} /${paperController.getdata!.data!.questions.length}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:  Text(
                              "${paperController.getdata!.data!.questions[index].ques}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RadioButtonGroup(
                                margin: EdgeInsets.only(left: 12),
                                onSelected:(String selected)=>  setState(() {
                                  selectedValues[index]=selected;
                                }),
                                labels: [
                                  "${paperController.getdata!.data.questions[index].answers.the0.answer}",
                                  "${paperController.getdata!.data.questions[index].answers.the1.answer}",
                                  "${paperController.getdata!.data.questions[index].answers.the2.answer}",
                                  "${paperController.getdata!.data.questions[index].answers.the3.answer}",
                                  "${paperController.getdata!.data.questions[index].answers.the4.answer}",
                                ],
                                picked: selectedValues[index],
                                itemBuilder: (rb ,text, index){
                                  return Container(
                                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/4 ),
                                    child: Row(
                                      children: [
                                        rb,
                                        text,
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ],

                      ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  ElevatedButton(
                      onPressed: () {
                        pagecontroller.previousPage(duration: Duration(microseconds: 100), curve: Curves.easeInOutSine);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xff35cb64),
                        onPrimary: Colors.white,
                      ),
                      child: Text(
                        "Previous",
                        style: TextStyle(fontSize: 12),
                      )),
                  // ElevatedButton(
                  //     onPressed: () {
                  //
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       elevation: 0,
                  //       backgroundColor: Color(0xff35cb64),
                  //       onPrimary: Colors.white,
                  //     ),
                  //     child: Text(
                  //       "PAUSE",
                  //       style: TextStyle(fontSize: 12),
                  //     )),
                  ElevatedButton(
                      onPressed: () {
                        pagecontroller.nextPage(duration: Duration(microseconds: 100), curve: Curves.easeInOutSine);

                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xff35cb64),
                        onPrimary: Colors.white,
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 12),
                      )),

                ],
              ),
            ),

          ],
      ),
        ),
      )
    );
  }
}