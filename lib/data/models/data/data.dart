import 'package:task2/data/models/parents/model.dart';

import 'category.dart';

/// _id : "65ad62a5c4d5a2a836c61002"
/// email : "hossamxp33@gmail.com"
/// password : "123456"
/// first_name : "waleed"
/// last_name : "altahlawy"
/// mobile : "01141087755"
/// nationalId : "123xds123"
/// dateOfBirth : "2025-01-04T20:00:00.000Z"
/// gender : "male"
/// address : "15 abd allah selim"
/// price : 400
/// biography : "دكتور القلب والاوعية الدموية"
/// category : [{"_id":"659c11de870fb96c7a2c0057","name_ar":"طب نفسي","name_en":"psychiatry","createdAt":"2024-01-08T15:16:46.023Z","updatedAt":"2024-01-08T15:16:46.023Z","__v":0}]
/// cities : "65ad623ec4d5a2a836c60ff6"
/// createdAt : "2024-01-21T18:29:57.963Z"
/// updatedAt : "2024-01-21T18:29:57.963Z"
/// __v : 0
/// schedules : []

class Data with Model {
  Data({
    String? id,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? mobile,
    String? nationalId,
    String? dateOfBirth,
    String? gender,
    String? address,
    int? price,
    String? biography,
    List<Category>? category,
    String? cities,
    String? createdAt,
    String? updatedAt,
  }) {
    this.id = id.toString();
    _email = email;
    _password = password;
    _firstName = firstName;
    _lastName = lastName;
    _mobile = mobile;
    _nationalId = nationalId;
    _dateOfBirth = dateOfBirth;
    _gender = gender;
    _address = address;
    _price = price;
    _biography = biography;
    _category = category;
    _cities = cities;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    id = intFromJson(json, 'id').toString();
    _email = stringFromJson(json, 'email');
    _password = stringFromJson(json, 'password');
    _firstName = stringFromJson(json, 'first_name');
    _lastName = stringFromJson(json, 'last_name');
    _mobile = stringFromJson(json, 'mobile');
    _nationalId = stringFromJson(json, 'nationalId');
    _dateOfBirth = stringFromJson(json, 'dateOfBirth');
    _gender = stringFromJson(json, 'gender');
    _address = stringFromJson(json, 'address');
    _price = intFromJson(json, 'price');
    _biography = stringFromJson(json, 'biography');
    if (json['category'] != null) {
      _category = [];
      json['category'].forEach((v) {
        _category?.add(Category.fromJson(v));
      });
    }
    _cities = stringFromJson(json, 'cities');
    _createdAt = stringFromJson(json, 'createdAt');
    _updatedAt = stringFromJson(json, 'updatedAt');
  }

  String? _email;
  String? _password;
  String? _firstName;
  String? _lastName;
  String? _mobile;
  String? _nationalId;
  String? _dateOfBirth;
  String? _gender;
  String? _address;
  int? _price;
  String? _biography;
  List<Category>? _category;
  String? _cities;
  String? _createdAt;
  String? _updatedAt;

  String get email => _email ?? '';

  String get password => _password ?? '';

  String get firstName => _firstName ?? '';

  String get lastName => _lastName ?? '';

  String get mobile => _mobile ?? '';

  String get nationalId => _nationalId ?? '';

  String get dateOfBirth => _dateOfBirth ?? '';

  String get gender => _gender ?? '';

  String get address => _address ?? '';

  int get price => _price ?? 0;

  String get biography => _biography ?? '';

  List<Category> get category => _category ?? [];

  String get cities => _cities ?? '';

  String get createdAt => _createdAt ?? '';

  String get updatedAt => _updatedAt ?? '';

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = _email;
    map['password'] = _password;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['mobile'] = _mobile;
    map['nationalId'] = _nationalId;
    map['dateOfBirth'] = _dateOfBirth;
    map['gender'] = _gender;
    map['address'] = _address;
    map['price'] = _price;
    map['biography'] = _biography;
    if (_category != null) {
      map['category'] = _category?.map((v) => v.toJson()).toList();
    }
    map['cities'] = _cities;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;

    return map;
  }
}
