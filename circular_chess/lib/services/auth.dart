import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // A method to sign in anonymously.

  Future signInAnon() async{
    try{

      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // A method to sing in with email.

  // A method to register with an email.

  // sign out.
}
