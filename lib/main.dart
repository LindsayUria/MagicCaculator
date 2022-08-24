import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.dark

      ),
      home: SimpleCalculator(),

    );
  }
}

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
      if(buttonText == "C"){
        equation = "0";
        result = "0";
      }

      else if(buttonText == "⌫"){
        equation = equation.substring(0, equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
      }

      else if(buttonText == "="){

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

      }

      else{
        if(equation == "0"){
          equation = buttonText;
        }else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
          color: Colors.deepPurple.shade100,
          shape: CircleBorder(
              side: BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.none
              )
          ),
          padding: EdgeInsets.all(16.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.blueGrey.shade700
            ),
          )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title:
      Center(
         child: Text('MAGIC CALCULATOR'),

      )
      ),
      body: Column(
        children: <Widget>[


          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize, color: Colors.deepPurple.shade100) ,
            ),
          ),


          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(
                fontSize: resultFontSize,
                color: Colors.deepPurple.shade50
            ),),
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
                          buildButton("C", 1, Colors.transparent),
                          buildButton("⌫", 1, Colors.transparent),
                          buildButton("÷", 1, Colors.transparent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.transparent),
                          buildButton("8", 1, Colors.transparent),
                          buildButton("9", 1, Colors.transparent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.transparent),
                          buildButton("5", 1, Colors.transparent),
                          buildButton("6", 1, Colors.transparent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.transparent),
                          buildButton("2", 1, Colors.transparent),
                          buildButton("3", 1, Colors.transparent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.transparent),
                          buildButton("0", 1, Colors.transparent),
                          buildButton("00", 1, Colors.transparent),
                        ]
                    ),
                  ],
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("×", 1, Colors.transparent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("-", 1, Colors.transparent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("+", 1, Colors.transparent),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("=", 1, Colors.transparent),
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}