import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phmstore/home.dart';

class Pharmacies extends StatefulWidget {
  const Pharmacies({Key? key}) : super(key: key);

  @override
  State<Pharmacies> createState() => _PharmaciesState();
}

class _PharmaciesState extends State<Pharmacies> {

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child:  Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/phl.png',height: 50,
                    width: 50),
                Text(
                  'ZAN PHARMACIES ',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0, color: Colors.black),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset('assets/dr.png',height: 50,
                      width: 50),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(10, (index) {
          return Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: InkWell(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text('Confirm'),
                          content: Text('Are you sure you want to lock all channels....?'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text('YES'),
                              isDestructiveAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('NO'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                      height: 100,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 15.0),

                            Hero(
                              tag: "channelName",
                              child: Container(
                                height: 85.0,
                                width: 85.0,
                                decoration: BoxDecoration(
                                    color: Colors.white, shape: BoxShape.circle),
                                child: Center(
                                    child: Image.asset('assets/ph.jpg',
                                        )),
                              ),
                            ),
                            Text(
                              "PH Name",
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                            ),

                          ]))));
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) =>Cindex())));
        },
        child: Icon(Icons.home),
      ),
    ),
  );
}
}
