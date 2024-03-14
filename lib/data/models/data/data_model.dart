import 'data.dart';

/// data : [{"_id":"65ad62a5c4d5a2a836c61002","email":"hossamxp33@gmail.com","password":"123456","first_name":"waleed","last_name":"altahlawy","mobile":"01141087755","nationalId":"123xds123","dateOfBirth":"2025-01-04T20:00:00.000Z","gender":"male","address":"15 abd allah selim","price":400,"biography":"دكتور القلب والاوعية الدموية","category":[{"_id":"659c11de870fb96c7a2c0057","name_ar":"طب نفسي","name_en":"psychiatry","createdAt":"2024-01-08T15:16:46.023Z","updatedAt":"2024-01-08T15:16:46.023Z","__v":0}],"cities":"65ad623ec4d5a2a836c60ff6","createdAt":"2024-01-21T18:29:57.963Z","updatedAt":"2024-01-21T18:29:57.963Z","__v":0,"schedules":[]},{"_id":"65ad62bac4d5a2a836c61006","email":"hossamxp33@gmail.com","password":"123456","first_name":"waleed","last_name":"altahlawy","mobile":"01141087755","nationalId":"123xds123","dateOfBirth":"2025-01-04T20:00:00.000Z","gender":"male","address":"15 abd allah selim","price":400,"biography":"دكتور القلب والاوعية الدموية","category":[{"_id":"659c11de870fb96c7a2c0057","name_ar":"طب نفسي","name_en":"psychiatry","createdAt":"2024-01-08T15:16:46.023Z","updatedAt":"2024-01-08T15:16:46.023Z","__v":0}],"cities":"65ad623ec4d5a2a836c60ff6","createdAt":"2024-01-21T18:30:18.858Z","updatedAt":"2024-01-21T18:30:18.858Z","__v":0,"schedules":[]}]

class DataModel {
  DataModel({
      List<Data>? data,}){
    _data = data;
}

  DataModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}