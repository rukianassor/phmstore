import 'package:flutter/material.dart';
import 'package:phmstore/checkedmed.dart';

class CheckOutmed extends StatefulWidget {
  @override
  _CheckOutmedState createState() => _CheckOutmedState();
}

class _CheckOutmedState extends State<CheckOutmed> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "ADDRESS",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[selectedAddressSection(), standardDelivery(), checkoutItem(), priceSection()],
                  ),
                ),
                flex: 90,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: TextButton(
                    onPressed: () {
                      /*Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => OrderPlacePage()));*/
                      showThankYouBottomSheet(context);
                    },
                    child: Text(
                      "Place Order"),
                  ),
                ),
                flex: 10,
              )
            ],
          );
        }),
      ),
    );
  }

  showThankYouBottomSheet(BuildContext context) {
    return _scaffoldKey.currentState?.showBottomSheet((context) {
      return Container(
        height: 400,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200, width: 2),
            borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage("assets/ic_thank_you.png"),
                    width: 300,
                  ),
                ),
              ),
              flex: 5,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text:
                            "\n\nThank you for your purchase. Our company values each and every customer. We strive to provide state-of-the-art devices that respond to our clients’ individual needs. If you have any questions or feedback, please don’t hesitate to reach out.",
                          )
                        ])),
                    SizedBox(
                      height: 24,
                    ),
                    TextButton(
                      onPressed: () {},
                      // padding: EdgeInsets.only(left: 48, right: 48),
                      child: Text(
                        "Track Order"  ), )
                  ],
                ),
              ),
              flex: 5,
            )
          ],
        ),
      );
    },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        backgroundColor: Colors.white,
        elevation: 2);
  }

  selectedAddressSection() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)), border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Rukaiya Sharif (Default User)"  ),
                  Container(
                    padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Text(
                      "HOME"),
                  )
                ],
              ),
              createAddressText("StCode - 431, Mombasa, Azania", 16),
              createAddressText("House no. - SH/MB. No.12", 6),
              SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Mobile : ",
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: "+255 622 310 769",
                      style: TextStyle(color: Colors.black, fontSize: 12)),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),
              addressAction()
            ],
          ),
        ),
      ),
    );
  }

  createAddressText(String strAddress, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: Text(
        strAddress,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
      ),
    );
  }

  addressAction() {
    return Container(
      child: Row(
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          TextButton(
            onPressed: () {  Navigator.push(context,
                MaterialPageRoute(builder: (context) => Checkedmed()));
            },
            child: Text(
              "Change",
              style: TextStyle(fontSize: 12, color: Colors.indigo.shade700),
            ),
          ),
          Spacer(
            flex: 3,
          ),
          Container(
            height: 20,
            width: 1,
            color: Colors.grey,
          ),
          Spacer(
            flex: 3,
          ),
          TextButton(
            onPressed: () {},
            child: Text("Add New Address",
                style: TextStyle(fontSize: 12, color: Colors.indigo.shade700)),
            // splashColor: Colors.transparent,
            // highlightColor: Colors.transparent,
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  standardDelivery() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.tealAccent.withOpacity(0.4), width: 1),
          color: Colors.tealAccent.withOpacity(0.2)),
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: 1,
            onChanged: (isChecked) {},
            activeColor: Colors.tealAccent.shade400,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Standard Delivery",
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Get it within 20mins maximum | Free Delivery",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  checkoutItem() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)), border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: ListView.builder(
            itemBuilder: (context, position) {
              return checkoutListItem();
            },
            itemCount: 3,
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }

  checkoutListItem() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
            Image.asset("assets/med.png",height: 70,
                  width: 70
              ),
          SizedBox( width: 8),
          Text("Estimated Delivery : ", style: TextStyle(fontSize: 12)),
              Text("21 Jul 2019 ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
            ]
    )
    );
  }

  priceSection() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)), border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 4,
              ),
              Text(
                "PRICE DETAILS",
                style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              SizedBox( height: 8),
              Text("Total MRP",style: TextStyle(color: Colors.grey.shade700)),
              Text("Medicines discount", style: TextStyle(color: Colors.teal.shade300)),
              Text("Tax ", style: TextStyle(color: Colors.grey.shade700)),
              Text("Order Total", style: TextStyle(color: Colors.grey.shade700)),
              Text("Delievery Charges, FREE",style: TextStyle(color: Colors.teal.shade300)),
              SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    // getFormattedCurrency(2013),
                    "2013",
                    style:TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // String getFormattedCurrency(double amount) {
  //   MoneyFormatter fmf = MoneyFormatter(amount: amount);
  //   fmf.settings
  //     ..symbol = "₹"
  //     ..thousandSeparator = ","
  //     ..decimalSeparator = "."
  //     ..fractionDigits = 2;
  //   return fmf.output.symbolOnLeft;
  // }

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          ),
          Text(
            value,
            style: TextStyle(color: color, fontSize: 12),
          )
        ],
      ),
    );
  }
}
