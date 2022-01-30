import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int firsangka;
  int nextangka;
  String texttodisplay="";
  String hasil;
  String operation;

  void btnclicked(String val){
      if(val=="C"){
        firsangka=0;
        nextangka=0;
        texttodisplay="";
        hasil="";
      }else if(val=="+" || val=="-" || val=="x" || val=="/"){
        firsangka = int.parse(texttodisplay);
        hasil="";
        operation=val;
      }else if(val=="="){
        nextangka = int.parse(texttodisplay);
        if(operation=="+"){
          hasil=(firsangka+nextangka).toString();
        }
        if(operation=="-"){
          hasil=(firsangka-nextangka).toString();
        }
        if(operation=="x"){
          hasil=(firsangka*nextangka).toString();
        }
        if(operation=="/"){
          hasil=(firsangka/nextangka).toString();
        }
      }else{
        hasil=int.parse(texttodisplay+val).toString();
      }  

      setState(() {
        texttodisplay=hasil;
      });

    }

    Widget custombuttom(String angka){
      return Expanded(
                  child: OutlineButton(
                    padding: EdgeInsets.all(25.0),
                    child: Text("$angka",
                    style: TextStyle(
                      fontSize: 20.0
                    )),
                    onPressed: () => btnclicked(angka),
                  ),
                );
    }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text("$texttodisplay",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),),
              ),
            ),
            Row(
              children: <Widget>[
                custombuttom("9"),
                custombuttom("8"),
                custombuttom("7"),
                custombuttom("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombuttom("6"),
                custombuttom("5"),
                custombuttom("4"),
                custombuttom("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombuttom("3"),
                custombuttom("2"),
                custombuttom("1"),
                custombuttom("x"),
              ],
            ),
             Row(
              children: <Widget>[
                custombuttom("C"),
                custombuttom("0"),
                custombuttom("="),
                custombuttom("/"),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}