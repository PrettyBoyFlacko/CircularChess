import 'package:circular_chess/models/leaderboards.dart';
import 'package:circular_chess/screens/home/leader_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class leaderList extends StatefulWidget {
  const leaderList({super.key});

  @override
  _leaderListState createState() => _leaderListState();
}

class _leaderListState extends State<leaderList> {

  @override
  Widget build(BuildContext context) {

    final leaderboard = Provider.of<List<leader_boards>>(context) ?? [];

    return ListView.builder(
      itemCount: leaderboard.length,
      itemBuilder: (context, index){
        return leaderTile(individualLeader: leaderboard[index]);
      }
    );
    }
}
