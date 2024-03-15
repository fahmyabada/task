import 'package:task2/data/models/parents/model.dart';

/// name_ar : "الموضة للنساء"
/// id : 18

class Category with Model {
  Category({
    String? nameAr,
    int? id,
  }) {
    _nameAr = nameAr;
    this.id = id.toString();
  }

  Category.fromJson(dynamic json) {
    id = intFromJson(json, 'id').toString();
    _nameAr = stringFromJson(json, 'name_ar');
  }

  String? _nameAr;

  String get nameAr => _nameAr??'';

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name_ar'] = _nameAr;
    map['id'] = id;
    return map;
  }
}
