import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/routes.dart';
import 'package:test_app/services/language_service.dart';
import 'package:test_app/services/users_service.dart';

import 'data/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await db.init();
  runApp(MyApp());
}

//TODO: flutter packages pub run build_runner build

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: usersService),
          ChangeNotifierProvider.value(value: languageService),
        ],
        child: MaterialApp(
          initialRoute: RouteConfig.defaultRoute,
          routes: routes,
          debugShowCheckedModeBanner: false,
        ));
  }
}
