import 'package:circular_chess/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_chess/services/database.dart';
import 'package:provider/provider.dart';
import 'package:circular_chess/screens/home/leaderList.dart';


class leaderBoard extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: '').leaderboard,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Chess'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
        ),
        body: leaderList(),
      ),
    );
  }
}
