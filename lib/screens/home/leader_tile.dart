import 'package:flutter/material.dart';
import 'package:circular_chess/models/leaderboards.dart';

class leaderTile extends StatelessWidget {

  final leader_boards individualLeader;
  leaderTile({required this.individualLeader});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.green[900],
          ),
          title: Text(individualLeader.name),
          subtitle: Text('${individualLeader.score} WINS'),
        ),
      ),
    );
  }
}
