import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phmstore/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Colors.lightBlue,
      ),
      home: Load(),
    );
  }
}


class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:9), () {
      Navigator.push(
          context, MaterialPageRoute( builder: (context) => Cindex(), )
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                  padding: EdgeInsets.only(top: 140.0, left: 70),
                    child: Image.asset('assets/dr.png',height: 250,
                    width: 250),
              ),
               Padding(
                padding: EdgeInsets.only(top: 15.0, left: 20.0),
                child:  LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 25.0,
                  animationDuration: 6000,
                  percent: 1.0,
                  center: Text("Please Wait...", style: TextStyle(fontWeight: FontWeight.w800),),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.blueAccent,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 140),
                child : Text("Pharmacies @2023")
              ),

            ],
          ),
        ),
      ),
    );
  }
}



