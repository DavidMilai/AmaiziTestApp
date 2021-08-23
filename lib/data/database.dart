import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/language.dart';
import 'models/user_data.dart';

class Database {
  Box<UserData> userData; //type id: 3
  Box<Language> languages; //type id: 4

  _initBoxes() async {
    userData = await Hive.openBox('setupBox');
    languages = await Hive.openBox('languages');
  }

  _registerAdapters() async {
    Hive.registerAdapter(UserDataAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
    Hive.registerAdapter(LanguageAdapter());
  }

  init() async {
    await Hive.initFlutter();
    await _registerAdapters();
    await _initBoxes();
  }
}

var db = Database();
