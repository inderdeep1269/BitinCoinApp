import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xcoin/screens/xcoin_home.dart';
import 'package:xcoin/screens/authentication/login.dart';
import 'package:xcoin/services/auth.dart';
import 'package:xcoin/widgets/square_loading.dart';

class Root extends StatefulWidget {
  const Root({ Key? key }) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {

  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().user,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active){
          if (snapshot.data?.uid == null){
            return const Login();
          }
          else{
            return const XCoinHomePage();
          }
        }
        return const Scaffold(
          body: SquareLoading()
        );
      }
    );
  }
}