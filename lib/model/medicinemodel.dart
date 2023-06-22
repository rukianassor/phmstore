class MedicineModel {
  String med_id;
  String medname;
  String medprice;
  String medlogo;

  MedicineModel({
    required this.med_id,
    required this.medname,
    required this.medprice,
    required this.medlogo,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      med_id: json['med_id'] as String,
      medname: json['medname'] as String,
      medprice: json['medprice'] as String,
      medlogo: json['medlogo'] as String,
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "med_id": med_id,
      "medname": medname,
      "medprice": medprice,
      "medlogo": medlogo,
    };
  }
}
