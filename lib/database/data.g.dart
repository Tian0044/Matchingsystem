// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Doctor extends RealmObject {
  // ignore_for_file: unused_element, unused_local_variable
  Doctor._constructor() : super.constructor();
  Doctor();

  @RealmProperty(primaryKey: true)
  int get id => super['id'] as int;
  set id(int value) => super['id'] = value;

  @RealmProperty()
  String get name => super['name'] as String;
  set name(String value) => super['name'] = value;

  @RealmProperty()
  String get avatar => super['avatar'] as String;
  set avatar(String value) => super['avatar'] = value;

  @RealmProperty()
  String get phone => super['phone'] as String;
  set phone(String value) => super['phone'] = value;

  @RealmProperty()
  String get email => super['email'] as String;
  set email(String value) => super['email'] = value;

  @RealmProperty()
  String get address => super['address'] as String;
  set address(String value) => super['address'] = value;

  @RealmProperty()
  String get department => super['department'] as String;
  set department(String value) => super['department'] = value;

  static dynamic getSchema() {
    const dynamic type = _Doctor;
    return RealmObject.getSchema('Doctor', [
      SchemaProperty('id', type: 'int', primaryKey: true),
      SchemaProperty('name', type: 'string'),
      SchemaProperty('avatar', type: 'string'),
      SchemaProperty('phone', type: 'string'),
      SchemaProperty('email', type: 'string'),
      SchemaProperty('address', type: 'string'),
      SchemaProperty('department', type: 'string'),
    ]);
  }
}

class Department extends RealmObject {
  // ignore_for_file: unused_element, unused_local_variable
  Department._constructor() : super.constructor();
  Department();

  @RealmProperty(primaryKey: true)
  int get id => super['id'] as int;
  set id(int value) => super['id'] = value;

  @RealmProperty()
  String get name => super['name'] as String;
  set name(String value) => super['name'] = value;

  @RealmProperty()
  String get diseases => super['diseases'] as String;
  set diseases(String value) => super['diseases'] = value;

  static dynamic getSchema() {
    const dynamic type = _Department;
    return RealmObject.getSchema('Department', [
      SchemaProperty('id', type: 'int', primaryKey: true),
      SchemaProperty('name', type: 'string'),
      SchemaProperty('diseases', type: 'string'),
    ]);
  }
}
