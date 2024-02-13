import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circular_chess/models/leaderboards.dart';

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

// Leaderboard list from snapshot
  List<leader_boards> _leaderListFromSnapShot(QuerySnapshot snapshot){

    return snapshot.docs.map((doc) {
      return leader_boards(
          name: doc.get('name') ?? '',
          score: doc.get('score') ?? 0
      );
    }).toList();
  }

  //Gets the leaderboard's stream
  Stream<List<leader_boards>> get leaderboard{
    return leaderboardCollection.snapshots()
      .map(_leaderListFromSnapShot);
  }
}