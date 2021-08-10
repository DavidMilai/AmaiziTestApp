import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/routes.dart';
import 'package:test_app/services/users_service.dart';

import 'data/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await db.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: usersService),
        ],
        child: MaterialApp(
          initialRoute: RouteConfig.defaultRoute,
          routes: routes,
          debugShowCheckedModeBanner: false,
        ));
  }
}
