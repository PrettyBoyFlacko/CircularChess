import 'package:circular_chess/models/leaderboards.dart';
import 'package:circular_chess/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_chess/services/database.dart';
import 'package:provider/provider.dart';
import 'package:circular_chess/screens/home/leaderList.dart';
import 'package:circular_chess/models/leaderboards.dart';


class leaderBoard extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<leader_boards>>.value(
      value: DatabaseService(uid: '').leaderboard,
      initialData: [],
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
