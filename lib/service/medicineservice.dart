import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phmstore/global/api.dart';
import 'package:phmstore/model/medicinemodel.dart';

class MedicineService {
  // static const VIEW_URL = "";
  //The main function in which we would parse in the JSON USING

  Future<List<MedicineModel>> getMedicine() async {
    var url = Uri.parse(appurl + "viewmed.php");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<MedicineModel> list = items.map<MedicineModel>((json) {
        return MedicineModel.fromJson(json);
      }).toList();
      return list;
    } else {
      return List.empty();
    }
  }
}