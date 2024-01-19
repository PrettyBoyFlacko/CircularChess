import 'package:circular_chess/models/user.dart';
import 'package:circular_chess/screens/authenticate/authenticate.dart';
import 'package:circular_chess/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';

class Wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<myUser?>(context);

    // return home or authenticate screen.
    if(user == null){
      return const Authenticate();
    }
    else {
      return  Home();
    }
  }
}
