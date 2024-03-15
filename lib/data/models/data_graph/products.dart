import 'package:task2/data/models/parents/model.dart';

import 'category.dart';

/// id : 6235
/// name_ar : "اندومي نودلز بنكهة الدجاج - 70 جرام\r\n"
/// name_en : "Indomie Noodles Chicken Flavour - 70 grams\r\n"
/// admin_comment : ""
/// attributes : null
/// category : {"name_ar":"الموضة للنساء","id":18}

class Products with Model {
  Products({
    int? id,
    String? nameAr,
    String? nameEn,
    String? adminComment,
    Category? category,
  }) {
    this.id = id.toString();
    _nameAr = nameAr;
    _nameEn = nameEn;
    _adminComment = adminComment;
    _category = category;
  }

  Products.fromJson(dynamic json) {
    id = intFromJson(json, 'id').toString();
    _nameAr = stringFromJson(json, 'name_ar');
    _nameEn = stringFromJson(json, 'name_en');
    _adminComment = json['admin_comment'];
    _category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  String? _nameAr;
  String? _nameEn;
  String? _adminComment;
  Category? _category;

  String get nameAr => _nameAr ?? '';

  String get nameEn => _nameEn ?? '';

  String get adminComment => _adminComment ?? '';

  Category? get category => _category;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_ar'] = _nameAr;
    map['name_en'] = _nameEn;
    map['admin_comment'] = _adminComment;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }
}
