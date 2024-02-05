import 'package:circular_chess/services/auth.dart';
import 'package:circular_chess/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class leaderBoard extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Chess'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.black87,),
            label: Text('Log Out',
              style: TextStyle(color: Colors.black87),),
            onPressed: () async{
              await _auth.signOut();
            },
          )
        ],
      ),

    );
  }
}
