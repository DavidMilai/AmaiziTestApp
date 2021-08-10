import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/user_data.dart';

class Database {
  Box<UserData> userData;

  _initBoxes() async {
    userData = await Hive.openBox('setupBox');
  }

  _registerAdapters() async {
    Hive.registerAdapter(UserDataAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
  }

  init() async {
    await Hive.initFlutter();
    await _registerAdapters();
    await _initBoxes();
  }
}

var db = Database();
