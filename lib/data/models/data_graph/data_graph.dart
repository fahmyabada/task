import 'data.dart';

/// data : {"products":[{"id":6235,"name_ar":"اندومي نودلز بنكهة الدجاج - 70 جرام\r\n","name_en":"Indomie Noodles Chicken Flavour - 70 grams\r\n","admin_comment":"","attributes":null,"category":{"name_ar":"الموضة للنساء","id":18}},{"id":6237,"name_ar":"مسحوق الكاسترد من كوكس - 300 جرام\r\n","name_en":"Cook's Custard Powder - 300 grams\r\n","admin_comment":"","attributes":null,"category":{"name_ar":"الموضة للنساء","id":18}}]}

class DataGraph {
  DataGraph({
      Data? data,}){
    _data = data;
}

  DataGraph.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}