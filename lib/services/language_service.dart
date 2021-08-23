import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/api/api.dart';
import 'package:test_app/data/database.dart';
import 'package:test_app/data/models/language.dart';
import 'package:test_app/data/models/user_data.dart';

class LanguageService extends ChangeNotifier {
  bool _isLoadingLanguages = false;
  bool get isLoadingLanguages => _isLoadingLanguages;
  List<UserData> get allUsers => db.userData.values.toList();

  set isLoadingLanguages(bool value) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _isLoadingLanguages = value;
      notifyListeners();
    });
  }

  Future getLanguages() {
    isLoadingLanguages = true;
    return api.getLanguages().then((response) {
      if (response.data != null)
        _saveLanguages(response.data);
      else
        Fluttertoast.showToast(
            msg: response.data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      isLoadingLanguages = false;
      return response;
    }).catchError((error) {
      if (error is DioError) {
        if ((error.message).contains('Failed host lookup')) {
          Fluttertoast.showToast(
              msg: 'Check your internet connection',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.amber,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: 'Something went wrong',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
      isLoadingLanguages = false;
    });
  }

  void _saveLanguages(data) async {
    await db.languages.clear();
    List<Language> languages =
        data.map<Language>((element) => Language.fromMap(element)).toList();
    db.languages.addAll(languages);
  }
}

var languageService = LanguageService();
