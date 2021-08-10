import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/api/api.dart';
import 'package:test_app/data/database.dart';
import 'package:test_app/data/models/user_data.dart';

class UsersService extends ChangeNotifier {
  bool _isLoadingUsersData = false;
  bool get isLoadingUsersData => _isLoadingUsersData;
  List<UserData> get allUsers => db.userData.values.toList();

  set isLoadingUsersData(bool value) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _isLoadingUsersData = value;
      notifyListeners();
    });
  }

  Future getUsers() {
    isLoadingUsersData = true;
    return api.getUsers().then((response) {
      print(response);
      if (response.data != null)
        _saveUserData(response.data);
      else
        Fluttertoast.showToast(
            msg: response.data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      isLoadingUsersData = false;
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
      isLoadingUsersData = false;
    });
  }

  void _saveUserData(data) async {
    await db.userData.clear();
    List<UserData> users =
        data.map<UserData>((element) => UserData.fromMap(element)).toList();
    db.userData.addAll(users);
  }
}

var usersService = UsersService();
