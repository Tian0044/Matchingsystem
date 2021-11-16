import 'dart:convert';

import 'package:realm/realm.dart';

part 'data.g.dart';


///医生的数据类
class _Doctor {
  @RealmProperty(primaryKey: true)
  int id;

  @RealmProperty()
  String name;

  @RealmProperty()
  String avatar;

  @RealmProperty()
  String phone;

  @RealmProperty()
  String email;

  @RealmProperty()
  String address;

  @RealmProperty()
  String department;
}


class DoctorModel {
  Realm realm;

  ///构造中往数据库插入原始数据
  DoctorModel() {
    var config = Configuration();
    config.schema.add(Doctor);

    realm = Realm(config);
    var objects = realm.objects<Doctor>();
    if (objects.length == 0) {
      realm.write(() {
        realm.create(Doctor()
          ..id = 0
          ..name = "kris Tian"
          ..avatar =
              "https://pics3.baidu.com/feed/d1a20cf431adcbefcd583dbea06c18dba2cc9f67.jpeg?token=2d5cf20111c7aa7f10201c742e0a3788&s=3393588762204CBC740C44CE0300F017"
          ..address = "Emergency of Ottawa"
          ..phone = "13888888888"
          ..email = "111@gmail.com"
          ..department = "respiratory medicine department ");

        realm.create(Doctor()
          ..id = 1
          ..name = "jack"
          ..avatar =
              "https://pics3.baidu.com/feed/d1a20cf431adcbefcd583dbea06c18dba2cc9f67.jpeg?token=2d5cf20111c7aa7f10201c742e0a3788&s=3393588762204CBC740C44CE0300F017"
          ..address = "The First Affiliated Hospital of Beijing Medical University"
          ..phone = "13888888888"
          ..email = "222@gmail.com"
          ..department = "GI Medicine");
      });
    }
  }

  /// seeking for doctor by department
  List<Doctor> findDoctor(String department) {
    Results<Doctor> doctors = realm.objects<Doctor>().where("department == '$department'");
    return doctors.asList();
  }
}


///department class
class _Department {
  @RealmProperty(primaryKey: true)
  int id;

  @RealmProperty()
  String name;

  @RealmProperty()
  String diseases;
}



class DeparmentModel {
  Realm realm;


  ///original data
  DeparmentModel() {
    var config = Configuration();
    config.schema.add(Department);

    String dis = "[\"cough\",\"Emphysema\",\"lung infection\",\"bronchitis\",\"asthma\",\"fever\",\"pneumonia\"]";

    String dis2 = "[\"running nose\",\"enteritis\",\"constipation\",\"esophagitis\",\"Irritable bowel syndrome\",\"diarrhea\",\"vomit\"]";

    realm = Realm(config);
    var objects = realm.objects<Department>();
    if (objects.length == 0) {
      realm.write(() {
        realm.create(Department()
          ..id = 0
          ..name = "Respiratory medicine"
          ..diseases = dis);

        realm.create(Department()
          ..id = 1
          ..name = "GI Medicine"
          ..diseases = dis2);
      });
    }
  }


  ///根据病症查找科室
  Department findDeparment(String diseas) {
    var objects = realm.objects<Department>();
    for (int i = 0; i < objects.length; i++) {
      var deparment = objects[i];
      var list = json.decode(deparment.diseases);
      for (var value in list) {
        if (diseas.contains(value) || value.contains(diseas)) {
          return deparment;
        }
      }
    }
    return null;
  }
}



class DoctorManager {

  ///根据病症查找医生
  List<Doctor> findDoctor(String diseas) {
    try {
      var deparmentModel = DeparmentModel();
      var deparment = deparmentModel.findDeparment(diseas);
      if (deparment != null) {
        var doctorModel = DoctorModel();
        var doctors = doctorModel.findDoctor(deparment.name);
        return doctors;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
