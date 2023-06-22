
import 'package:flutter/material.dart';
import 'package:phmstore/model/medicinemodel.dart';
import 'package:phmstore/service/medicineservice.dart';


class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  List medicines = [];
  late List<MedicineModel> medicineList = [];
  bool loading = true;

  getAllMedicine() async {
    var res = await MedicineService().getMedicine();

    setState(() {
      medicineList = res;
      loading = false;
    });
    print("THE RESULT FOUND: " + medicineList.toString());
  }

  @override
  void initState() {
    super.initState();
    getAllMedicine();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(" All "),
        centerTitle: true,
        // actions: [
        //   Center(
        //     child: Badge(
        //       badgeContent: Text("0", style: TextStyle(color: Colors.white),),
        //       animationDuration: Duration(milliseconds: 300),
        //       child: Icon(Icons.shopping_bag_outlined),
        //     ),
        //   ),
        // ],
      ),
      body: getBody(),
    );
  }
  Widget getBody() {
    return loading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
        itemCount: medicineList.length,
        itemBuilder: (context, index) {
          return getCard(index);
        });
  }
  Widget getCard(index) {
    MedicineModel medicine = medicineList[index];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              // Container(
              //   width: 60,
              //   height: 60,
              //   decoration: BoxDecoration(
              //     color: Colors.amberAccent,
              //     borderRadius: BorderRadius.circular(60 / 2),
              //     image: DecorationImage(
              //       image: NetworkImage(host+":8483/MySpace/images/"+chupa.chupapicture),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    medicine.medname.toUpperCase(),
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    medicine.medprice.toUpperCase(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
