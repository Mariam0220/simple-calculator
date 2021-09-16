



import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

main() {
  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  //stless
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Calculator', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = '0';
  String result = '0';
  String expression = '0';


buttonPressed(buttonText){
 // print(buttonText);
  setState(() {
    if(buttonText== 'C'){
      equation = '0';
      result ='0';



    }else if (buttonText == '=') {
      expression=equation;
      expression=expression.replaceAll('X','*');

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm=ContextModel();
        result ='${exp.evaluate(EvaluationType.REAL, cm)}';

      }catch (e) {
        result = 'Error';
      }

    }else if (buttonText == '⌫') {
      var oldEquation = equation;
      //print(oldEquation.length);
      equation = oldEquation.substring(0, oldEquation.length-1);
      if (oldEquation == '') {
        equation ='0';
      }
      

    }else{
      equation = equation + buttonText;
      
      
        
    
      }
    }
  );
}

  Widget keyPadButton(buttonText, buttonColour) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(15),
        backgroundColor: buttonColour,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      
      onPressed: () {
        buttonPressed(buttonText);
      },
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }Widget operatorButton(buttonText) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(15),
        backgroundColor: Colors.blue,
        shape: CircleBorder()),
      onPressed: () {
        buttonPressed(buttonText);
      },
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  
  Widget deleteButton(buttonText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child:TextButton(
        style:TextButton.styleFrom(
          padding:EdgeInsets.all(15),
          backgroundColor: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),

          ),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(
         buttonText,
         style: TextStyle(color: Colors.white), 
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 38, 53, 1),
      body: SafeArea(
        //right-click here to rearrange (format document)
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  result,
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  equation,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Spacer(),
                Column(
                  children: 
                  [ 
                    Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        keyPadButton('=',Colors.cyan),
                        keyPadButton('C',Colors.cyan),
                        
                        deleteButton('⌫')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),












                    Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        keyPadButton('7',Color.fromRGBO(40, 51, 73, 1)),
                        keyPadButton('8',Color.fromRGBO(40, 51, 73, 1)),
                        keyPadButton('9',Color.fromRGBO(40, 51, 73, 1)),
                        operatorButton('+')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        keyPadButton('4',Color.fromRGBO(40, 51, 73, 1)),
                        keyPadButton('5',Color.fromRGBO(40, 51, 73, 1)),
                        keyPadButton('6',Color.fromRGBO(40, 51, 73, 1)),
                        operatorButton('-')
                     ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                         keyPadButton('1',Color.fromRGBO(40, 51, 73, 1)),
                        keyPadButton('2',Color.fromRGBO(40, 51, 73, 1)),
                        keyPadButton('3',Color.fromRGBO(40, 51, 73, 1)),
                        operatorButton('x')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        keyPadButton('0',Color.fromRGBO(40, 51, 73, 1)),
                        keyPadButton('00',Color.fromRGBO(40, 51, 73, 1)),
                        keyPadButton('.',Color.fromRGBO(40, 51, 73, 1)),
                        operatorButton('/')


                        
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
