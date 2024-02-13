import 'package:circular_chess/models/leaderboards.dart';
import 'package:flutter/material.dart';
import 'package:circular_chess/models/leaderboards.dart';
import 'package:provider/provider.dart';

class leaderList extends StatefulWidget {
  const leaderList({super.key});

  @override
  State<leaderList> createState() => _leaderListState();
}

class _leaderListState extends State<leaderList> {

  @override
  Widget build(BuildContext context) {

    final leader = Provider.of<List<leader_boards>>(context);

    leader.forEach((leader) {
      print(leader.name);
      print(leader.score);
    });

    return Container();
    }
}
