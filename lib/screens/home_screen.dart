import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:test_app/data/models/user_data.dart';
import 'package:test_app/services/users_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    usersService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          Selector<UsersService, bool>(
              selector: (context, usersService) =>
                  usersService.isLoadingUsersData,
              builder: (context, loading, _) {
                return IconButton(
                    onPressed: loading ? null : () => usersService.getUsers(),
                    icon: Icon(Icons.refresh));
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.2,
            child: Selector<UsersService, bool>(
                selector: (context, usersService) =>
                    usersService.isLoadingUsersData,
                builder: (context, loading, _) {
                  return loading
                      ? SpinKitRing(
                          color: Theme.of(context).primaryColor,
                          size: 50.0,
                        )
                      : Selector<UsersService, List<UserData>>(
                          selector: (context, usersService) =>
                              usersService.allUsers,
                          builder: (context, users, _) {
                            return ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  var user = users[index];
                                  return Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(user.name),
                                  );
                                });
                          });
                }),
          )
        ],
      ),
    );
  }
}
