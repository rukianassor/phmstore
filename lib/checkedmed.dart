import 'package:flutter/material.dart';
import 'package:phmstore/checkoutmed.dart';
import 'package:phmstore/medicine.dart';

class Checkedmed extends StatefulWidget {
  @override
  _CheckedmedState createState() => _CheckedmedState();
}

class _CheckedmedState extends State<Checkedmed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child:  Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/phl.png',height: 50,
                    width: 50),
                Text(
                  'PHARMACY CART',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0, color: Colors.black),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Medicine()));
                    },
                    child: Icon( Icons.add, color: Colors.black,)
                ),
              ],
            ),
          ),
        ),

      ),
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[createSubTitle(), createCartList(), footer(context)],
          );
        },
      ),
    );
  }

  footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "\$299.00" ),
              ),
            ],
          ),
          SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => CheckOutmed()));
            },
            child: Text(
              "Checkout",
            ),
          ),
         SizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  // createHeader() {
  //   return Container(
  //     alignment: Alignment.topLeft,
  //     child: Text(
  //       "SHOPPING CART",
  //      ),
  //     margin: EdgeInsets.only(left: 12, top: 12),
  //   );
  // }

  createSubTitle() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Total (5) Items",
      style: TextStyle(fontWeight: FontWeight.w800),
      ),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }

  createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createCartListItem();
      },
      itemCount: 5,
    );
  }

  createCartListItem() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(image: AssetImage("assets/med.png"))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          "Panadol",
                          maxLines: 2,
                          softWrap: true, ),
                      ),
                     SizedBox(height: 6),
                      Text(
                        "Box", ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "\TZS 299.00",),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(bottom: 2, right: 12, left: 12),
                                    child: Text(
                                      "1",),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 20,
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: Colors.green),
          ),
        )
      ],
    );
  }
}
