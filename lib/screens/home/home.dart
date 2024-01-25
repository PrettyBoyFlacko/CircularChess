import 'package:circular_chess/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:circular_chess/services/auth.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  ChessBoardController controller = ChessBoardController();

  @override
  void initState(){
    controller.addListener(() {
      if(controller.isGameOver()){
        print('game over');
      }
    });
  }

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
      body: Center(
        child: ChessBoard(
          controller: controller,
          boardColor: BoardColor.darkBrown,
          boardOrientation: PlayerColor.white,
        )
      ),
    );
  }
}
