import 'package:circular_chess/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:circular_chess/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Creates a new user object based from the firebase user.
  myUser? _userFromFireBaseUser(User? user){
    return user != null ? myUser(uid: user.uid) : null;
  }

  // Auth change user stream.
  Stream<myUser?> get user{
    return _auth.authStateChanges().map((User? user) => _userFromFireBaseUser(user));
    
  }

  // A method to sign in anonymously.
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFireBaseUser(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  // A method to sign in with email.
  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFireBaseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  // A method to register with an email.
  Future registerWithEmail(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // creates a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData('New Player', 0);
      return _userFromFireBaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }

  // sign out.
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
    print(e.toString());
    return null;
    }
  }
}
