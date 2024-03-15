import 'products.dart';

/// products : [{"id":6235,"name_ar":"اندومي نودلز بنكهة الدجاج - 70 جرام\r\n","name_en":"Indomie Noodles Chicken Flavour - 70 grams\r\n","admin_comment":"","attributes":null,"category":{"name_ar":"الموضة للنساء","id":18}},{"id":6237,"name_ar":"مسحوق الكاسترد من كوكس - 300 جرام\r\n","name_en":"Cook's Custard Powder - 300 grams\r\n","admin_comment":"","attributes":null,"category":{"name_ar":"الموضة للنساء","id":18}}]

class Data {
  Data({
      List<Products>? products,}){
    _products = products;
}

  Data.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  List<Products>? _products;

  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}