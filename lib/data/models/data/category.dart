import 'package:task2/data/models/parents/model.dart';

/// _id : "659c11de870fb96c7a2c0057"
/// name_ar : "طب نفسي"
/// name_en : "psychiatry"
/// createdAt : "2024-01-08T15:16:46.023Z"
/// updatedAt : "2024-01-08T15:16:46.023Z"
/// __v : 0

class Category with Model {
  Category({
    String? id,
    String? nameAr,
    String? nameEn,
    String? createdAt,
    String? updatedAt,
  }) {
    this.id = id.toString();
    _nameAr = nameAr;
    _nameEn = nameEn;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Category.fromJson(dynamic json) {
    id = intFromJson(json, 'id').toString();
    _nameAr = stringFromJson(json, 'name_ar');
    _nameEn = stringFromJson(json, 'name_en');
    _createdAt = stringFromJson(json, 'createdAt');
    _updatedAt = stringFromJson(json, 'updatedAt');
  }

  String? _nameAr;
  String? _nameEn;
  String? _createdAt;
  String? _updatedAt;

  String get nameAr => _nameAr ?? '';

  String get nameEn => _nameEn ?? '';

  String get createdAt => _createdAt ?? '';

  String get updatedAt => _updatedAt ?? '';

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name_ar'] = _nameAr;
    map['name_en'] = _nameEn;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
