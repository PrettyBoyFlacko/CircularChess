import 'package:circular_chess/screens/authenticate/authenticate.dart';
import 'package:circular_chess/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    // return home or authenticate
    return Authenticate();
  }
}
