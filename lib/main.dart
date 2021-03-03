import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var number_str = "0";
  var number_result=0;

  void numbers_function(var number) {
    setState(() {
      if (number_str == "0") {
        if (number == "00") {
          number_str = "0";
        } else {
          number_str = number;
        }
      } else {
        number_str = number_str + number;
      }
    });
  }

  void math_operators_function(var operators){
    setState(() {

      var operator_list = [".","x","+","-","/"];
      bool operator=false;
      for(var i=0; i<operator_list.length; i++){
        if(number_str.substring(number_str.length-1)==operator_list[i]){
          operator=true;
        }
      }
      if(operator==false){
        number_str=number_str+operators;
      }
      else{
        number_str=number_str.substring(0,number_str.length-1)+operators;
      }
    });
  }

  void delete_function() {
    setState(() {
      number_str = "0";
    });
  }

  void backspace_function() {
    setState(() {
      if (number_str.length > 1) {
        number_str = number_str.toString().substring(0, number_str.length - 1);
      } else {
        number_str = "0";
      }
    });
  }

  void equal_function() {
    setState(() {
      var operator_list = ["x","+","-","/"];
      var numbers_list = new List();
      var numbers_operator_list = new List();
      var count=0;
      for(var i=0; i<number_str.length; i++){
        for(var j=0; j<operator_list.length; j++){
          if(number_str[i]==operator_list[j]){
            numbers_list.add(number_str.substring(count,i));
            numbers_operator_list.add(number_str.substring(i,i+1));
            count=i+1;
          }
        }

        if(number_str.length-1==i){
          numbers_list.add(number_str.substring(count,i+1));
        }
      }

      for(var i=0; i<numbers_list.length; i++){
        for(var j=0; j<numbers_operator_list.length; j++){

        }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              //white screen
              Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    child: Text(number_str,
                        style: TextStyle(fontSize: 60, color: Colors.black)),
                  ),
                ),
                width: double.infinity,
                height: 150,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 5),
              ),
              //buttons
              Container(
                width: double.infinity,
                height: 80,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    //Delete
                    RaisedButton(
                      onPressed: delete_function,
                      child: const Text('C', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF509406),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF509406),
                    ),
                    //backspace
                    RaisedButton(
                      onPressed: backspace_function,
                      child: const Text('<', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF509406),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF509406),
                    ),
                    //mod
                    RaisedButton(
                      child: const Text('%', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF509406),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF509406),
                    ),
                    //split
                    RaisedButton(
                      onPressed: () {
                        math_operators_function("/");
                      },
                      child: const Text('/', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF509406),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF509406),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    //seven
                    RaisedButton(
                      onPressed: () {
                        numbers_function("7");
                      },
                      child: const Text('7', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),
                    //eight
                    RaisedButton(
                      onPressed: () {
                        numbers_function("8");
                      },
                      child: const Text('8', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),
                    //nine
                    RaisedButton(
                      onPressed: () {
                        numbers_function("9");
                      },
                      child: const Text('9', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),

                    //multiplied
                    RaisedButton(
                      onPressed: () {
                        math_operators_function("x");
                      },
                      child: const Text('x', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF509406),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF89E02B),
                    ),
                    /*
                    *
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Color(0xFF1F3670),
                        shape: CircleBorder(),
                      ),
                      padding: EdgeInsets.all(20.0),
                      child: IconButton(
                        icon: Icon(Icons.add,size: 20,),
                        color: Colors.white,
                        splashColor: Color(0xFF355BBD),
                        onPressed: () {},
                      ),
                    ),*/
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    //four
                    RaisedButton(
                      onPressed: () {
                        numbers_function("4");
                      },
                      child: const Text('4', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),
                    //five
                    RaisedButton(
                      onPressed: () {
                        numbers_function("5");
                      },
                      child: const Text('5', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),
                    //six
                    RaisedButton(
                      onPressed: () {
                        numbers_function("6");
                      },
                      child: const Text('6', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),
                    //minus
                    RaisedButton(
                      onPressed: () {
                        math_operators_function("-");
                      },
                      child: const Text('-', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF509406),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF89E02B),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    //one
                    RaisedButton(
                      onPressed: () {
                        numbers_function("1");
                      },
                      child: const Text('1', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),
                    //two
                    RaisedButton(
                      onPressed: () {
                        numbers_function("2");
                      },
                      child: const Text('2', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),
                    //three
                    RaisedButton(
                      onPressed: () {
                        numbers_function("3");
                      },
                      child: const Text('3', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),
                    //add
                    RaisedButton(
                      onPressed: () {
                        math_operators_function("+");
                      },
                      child: const Text('+', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF509406),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF89E02B),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    //zero
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          numbers_function("0");
                        },
                        child: const Text('0', style: TextStyle(fontSize: 21)),
                        color: Color(0xFF1F3670),
                        padding: EdgeInsets.all(22.0),
                        shape: CircleBorder(),
                        splashColor: Color(0xFF355BBD),
                      ),
                    ),
                    //double_zero
                    RaisedButton(
                      onPressed: () {
                        numbers_function("00");
                      },
                      child: const Text('00', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),
                    //comma
                    RaisedButton(
                      onPressed: () {
                        math_operators_function(".");
                      },
                      child: const Text('.', style: TextStyle(fontSize: 21)),
                      color: Color(0xFF1F3670),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFF355BBD),
                    ),
                    //equal
                    RaisedButton(
                      onPressed: equal_function,
                      child: const Text('=', style: TextStyle(fontSize: 21)),
                      color: Color(0xFFBD0D00),
                      padding: EdgeInsets.all(22.0),
                      shape: CircleBorder(),
                      splashColor: Color(0xFFF00F00),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
