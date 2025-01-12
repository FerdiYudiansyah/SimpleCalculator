import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../widgets/calculatebutton.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff001F3F)
        ),
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Obx((){
                  return Text("${controller.num1.string+" "+controller.numoperator.string+" "+controller.num2.string} =",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 184, 111, 0)),);
                }),
              )
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx((){
                  return Text(controller.result.value.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 244, 146, 0)),);
                }),
              )
            ),
            Flexible(
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (text){
                          controller.calculate();
                        },
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 119, 196, 255,)),
                        onTap: () {
                          controller.selectnum.value = "num1";
                        },
                        decoration: InputDecoration(
                          hintText: "Num1",
                          hintStyle: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 70, 115, 149)),
                        ),
                        controller: controller.num1controller,
                      ),
                    ),
                    Obx((){
                      return Text(controller.numoperator.string,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 119, 196, 255)),);
                    }),
                    Expanded(
                      child: TextField(
                        onChanged: (text){
                          controller.calculate();
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 119, 196, 255)),
                        onTap: () {
                          controller.selectnum.value= "num2";
                        },
                        decoration: InputDecoration(
                          hintText: "Num2",
                          hintStyle: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 70, 115, 149)),
                        ),
                        controller: controller.num2controller,
                      ),
                    ),
                  ],
                ),
            ),
            SizedBox(
              height: 550,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  Calculatebutton(onPressed: (){controller.addnumprompt("7");}, text:"7",),
                  Calculatebutton(onPressed: (){controller.addnumprompt("8");}, text:"8",),
                  Calculatebutton(onPressed: (){controller.addnumprompt("9");}, text:"9",),
                  Calculatebutton(onPressed: (){controller.setNumOperator("x");}, text:"x",),
                  Calculatebutton(onPressed: (){controller.addnumprompt("4");}, text:"4",),
                  Calculatebutton(onPressed: (){controller.addnumprompt("5");}, text:"5",),
                  Calculatebutton(onPressed: (){controller.addnumprompt("6");}, text:"6",),
                  Calculatebutton(onPressed: (){controller.setNumOperator("÷");}, text:"÷",),
                  Calculatebutton(onPressed: (){controller.addnumprompt("1");}, text:"1",),
                  Calculatebutton(onPressed: (){controller.addnumprompt("2");}, text:"2",),
                  Calculatebutton(onPressed: (){controller.addnumprompt("3");}, text:"3",),
                  Calculatebutton(onPressed: (){controller.setNumOperator("+");}, text:"+",),
                  Calculatebutton(onPressed: (){controller.addnumprompt("0");}, text:"0",),
                  Calculatebutton(onPressed: (){controller.addnumprompt(".");}, text:".",),
                  Calculatebutton(onPressed: (){controller.reset();}, text:"C",),
                  Calculatebutton(onPressed: (){controller.setNumOperator("-");}, text:"-",),
                  Text(""),
                  Text(""),
                  Text(""),
                  equalsbutton(onPressed: (){
                    try{
                      controller.calculate();
                    }
                    catch(e){
                      print(e.toString());
                      var snackBar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      };
                  },
                    text:"=",
                  ),
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}
