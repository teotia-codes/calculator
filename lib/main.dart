import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorApp();
}

class _CalculatorApp extends State<CalculatorApp> {
  double fn=0.0;
  double sn=0.0;
  var inp='';
var out='';
var op='';
var hidein=false;
var outsize=34.0;
onButtonclick(value){
 if(value=="AC"){
  inp='';
  out='';
 }
 else if(value =="⌫"){
  inp=inp.substring(0,inp.length-1);
 }
 else if(value =="="){
  if(inp.isNotEmpty){
    var userInp=inp;
  Parser p = Parser();
  Expression exp = p.parse(userInp);
  ContextModel cm = ContextModel();
  var finalval=exp.evaluate(EvaluationType.REAL,cm);
  out=finalval.toString();
  if(out.endsWith(".0")){
  out = out.substring(0,out.length-2);}
 }
 inp=out;
  hidein=true;
  outsize=52;
 }
 else{
  inp=inp+value;
  hidein=false;
  outsize=34;

 }
 setState(() {
   
 });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 Text(hidein ?'':inp,
                  style:const  TextStyle(
                    fontSize: 48,
                    color: Colors.white
                  ),),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(out,
                  style: TextStyle(
                    fontSize: outsize,
                    color: Colors.white.withOpacity(0.7),
                  ),)
                ],
              ),
            ),
          ),
          const SizedBox(height: 25,),
          Row(
            children: [
              button(text: " ",buttonbgcolor: Colors.transparent),
              button(text: "AC",buttonbgcolor:sp ),
              button(text: "%",buttonbgcolor: operatorcl),
              button(text: "/",buttonbgcolor: operatorcl),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "*",buttonbgcolor: operatorcl),
            ],
          ),Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-",buttonbgcolor: operatorcl),
            ],
          ),Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+",buttonbgcolor: operatorcl),
            ],
          ),
          Row(
            children: [
              button(text: "0"),
              button(text: "."),
              button(text: "⌫"),
              button(text: "=",buttonbgcolor: operatorcl),
            ],
          ),
        ],
      ),
    );
  }
  Widget button({
    text,tcolor=Colors.white,buttonbgcolor= buttonclr
  }){
    return Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: buttonbgcolor,
                        padding: const EdgeInsets.all(25)),
                    onPressed: ()=>onButtonclick(text),
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
  }
}
