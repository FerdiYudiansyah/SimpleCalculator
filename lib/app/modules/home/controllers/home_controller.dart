import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var num1controller = TextEditingController();
  var num2controller = TextEditingController();
  var resultcontroller = TextEditingController();
  var numoperator = "".obs;
  var result = 0.0.obs;

  var num1 = 0.0.obs;
  var num2 = 0.0.obs;

  var selectnum="num1".obs;
  @override
  void onInit() {
    super.onInit();
    num1controller.addListener(() {
      try{
        num1.value = double.parse(num1controller.text);
      }
      catch(e){
      }
    });
    num2controller.addListener(() {
      try{
        num2.value = double.parse(num2controller.text);
      }
      catch(e){
      }
    });
  }
  addnum(a,b) => a+b;
  minnum(a,b) => a-b;
  timenum(a,b) => a*b;
  divnum(a,b) => a/b;

  setNumOperator(op){
    numoperator.value = op;
    if (selectnum.value=="num1"){
      selectnum.value=="num2";
    }
  }

  void addnum1(character){
    num1controller.text += character;
  }

  void addnum2(character){
    num2controller.text += character;
  }
  void reset(){
    num1controller.clear();
    num1.value=0;
    num2controller.clear();
    num2.value=0;
    numoperator.value="";
    result.value=0;
  }
  void addnumprompt(character){
    if (selectnum.value=="num1"){
      addnum1(character);
    }
    else if (selectnum.value=="num2"){
      addnum2(character);
    }
  }
  calculate(){
    try{
      if (numoperator.string=="+"){
        result.value = addnum(double.parse(num1controller.text), double.parse(num2controller.text));
      }
      else if (numoperator.string=="-"){
        result.value = minnum(double.parse(num1controller.text), double.parse(num2controller.text));
      }
      else if (numoperator.string=="x"){
        result.value = timenum(double.parse(num1controller.text), double.parse(num2controller.text));
      }
      else if (numoperator.string=="÷"){
        result.value = divnum(double.parse(num1controller.text), double.parse(num2controller.text));
      }
      resultcontroller.text=result.value.toString();
    }
    catch(e){
      print(e.toString());
    }
  }
}
