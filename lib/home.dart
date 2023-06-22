import 'package:flutter/material.dart';
import 'package:phmstore/medicine.dart';
import 'package:phmstore/pharmacies.dart';

class Cindex extends StatefulWidget {
  @override
  _CindexState createState() => _CindexState();
}

class _CindexState extends State<Cindex> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.greenAccent,
      // drawer: NavBar(),
      // appBar: AppBar(
      //
      // ),
      body: ListView(
        children: [

          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/phl.png',height: 80,
                    width: 80),
                Text(
                  'PHARMACIES ONLINE \n           SERVICES ',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0),
                ),

                  Image.asset('assets/dr.png',height: 70,
                      width: 80),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: 180.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
            Padding(
            padding: EdgeInsets.only(left: 15.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Medicine()));
                  },
                  child: Container(
                      height: 170,
                      width: 175,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0), color: Colors.lightBlueAccent),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 15.0),
                            Text(
                              "MEDICINES",
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                            ),
                            Hero(
                              tag: "channelName",
                              child: Container(
                                height: 85.0,
                                width: 85.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,shape: BoxShape.circle),
                                child: Center(
                                    child: Image.asset('assets/med.png',
                                        height: 52.0, width: 70.0,
                                        fit:BoxFit.cover)),

                              ),
                            ),

                          ])))),

                Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: InkWell(
                        onTap: () {},
                        child: Container(
                            height: 170,
                            width: 175,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0), color: Colors.lightBlueAccent),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 15.0),
                                  Text(
                                    "COSMETICS",
                                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                                  ),
                                  Hero(
                                    tag: "channelName",
                                    child: Container(
                                      height: 85.0,
                                      width: 85.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white, shape: BoxShape.circle),
                                      child: Center(
                                          child: Image.asset('assets/cor.jpg',
                                              height: 60.0, width: 60.0)),
                                    ),
                                  ),

                                ])))),


                      ]
                    ),
                  ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              "MAP LOCATION",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
            ),),
          Padding(
              padding: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
                  },
                  child: Container(
                      height: 250,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0), color: Colors.amber),
                      child: Center(
                          child: Image.asset('assets/mp.jpeg',
                              height: 250.0, width: 400.0,
                              fit:BoxFit.cover)),
                  )
              )
          ),
              ]
            ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) =>Pharmacies())));
        },
        child: Icon(Icons.local_pharmacy),
      ),
    );
  }
}
