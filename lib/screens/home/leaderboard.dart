import 'package:circular_chess/services/auth.dart';
import 'package:circular_chess/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class leaderBoard extends StatelessWidget {
  const leaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService(uid: '').leaderboard, initialData: null,

    )
  }
}
