
// ignore_for_file: library_private_types_in_public_api, unused_local_variable, unnecessary_new, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
// ignore: use_key_in_widget_constructors
class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}
class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText){
    setState(() {
      if (buttonText == "C"){
        equation = "0";
        result = "0";
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;

      }else if (buttonText == "AC"){
        double equationFontSize = 48.0;
        double resultFontSize = 38.0;
        equation = equation.substring(0,equation.length - 1);
        if (equation == ""){
          equation = "0";
        }

      // ignore: duplicate_ignore
      }else if (buttonText == "="){
        double equationFontSize = 38.0;
        // ignore: unused_local_variable
        double resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('x','*');
        expression = expression.replaceAll('/', '/');

        try{
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL,cm)}';
        }catch(e){
          result = "Error";
        }

      }else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0"){
          equation = buttonText*0;
        }
        equation = equation + buttonText ;
      }
    });

  }
  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      // ignore: sort_child_properties_last
      child: TextButton(
        // ignore: sort_child_properties_last
        child: Text(
          buttonText,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
        style: ButtonStyle(
          
        )
        
        ),
         
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(15.0),
        


      );
  
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator UCB')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation,style: TextStyle(fontSize: equationFontSize)),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result,style: TextStyle(fontSize: resultFontSize)),
          ),

          Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          
                          buildButton("C", 1, Colors.orange),
                          buildButton("AC", 1, Colors.orange ),
                          buildButton("%", 1, Colors.orange ),


                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.white ),
                          buildButton("8", 1, Colors.white ),
                          buildButton("9", 1, Colors.white ),


                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.white ),
                          buildButton("5", 1, Colors.white ),
                          buildButton("6", 1, Colors.white ),


                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.white ),
                          buildButton("2", 1, Colors.white ),
                          buildButton("3", 1, Colors.white ),


                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.white ),
                          buildButton("0", 1, Colors.white ),
                          buildButton("00", 1, Colors.white ),


                        ]
                    )
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("*",1,Colors.orange),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("-",1,Colors.orange),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("+",1,Colors.orange),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("/",1,Colors.orange),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("=",1,Colors.orange),
                        ]
                    )
                  ],
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}