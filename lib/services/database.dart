import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final CollectionReference leaderboard = FirebaseFirestore.instance.collection('LeaderBoard');



}