import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference leaderboardCollection = FirebaseFirestore.instance.collection('LeaderBoard');

  Future updateUserData(String name, int score) async {
    return await leaderboardCollection.doc(uid).set({
      'name': name,
      'score': score,
    });
  }


  //Gets the leaderboard's stream
  Stream<QuerySnapshot> get leaderboard{
    return leaderboardCollection.snapshots();
    
  }
}