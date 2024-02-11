import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class leaderList extends StatefulWidget {
  const leaderList({super.key});

  @override
  State<leaderList> createState() => _leaderListState();
}

class _leaderListState extends State<leaderList> {

  @override
  Widget build(BuildContext context) {

    final leader = Provider.of<QuerySnapshot>(context);

    if(leader != null) {
      
      for (var doc in leader.docs) {
        print(doc.data);
      }
    }
    }
}
