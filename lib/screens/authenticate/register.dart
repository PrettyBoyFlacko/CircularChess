import 'package:circular_chess/shared/constants.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../../shared/loading.dart';

class Register extends StatefulWidget {

  final toggleView;
  const Register({Key? key, this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;

  var email = '';
  var password = '';
  var error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign-up to Chess',
            style: TextStyle(color: Colors.black87)),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.black87),
            label: Text('Sign-In',
              style: TextStyle(color: Colors.black87),),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),

      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Text box for the email.
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val!.isEmpty ? 'Enter a valid email' : null,
                  onChanged: (val){
                    setState(() => email = val);
                  },
                ),

                // Text box for the password.
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val!.length < 8 ? 'Enter a password longer than 8 characters' : null,
                  onChanged: (val){
                    setState(() => password = val);

                  },
                ),
                SizedBox(height: 20.0),


                //Sign up button
                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmail(email, password);
                      if(result == null){
                        setState((){
                          error = 'Must be a valid email';
                          loading = false;
                        });
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green[900]!),
                  ),
                  child: const Text(
                    "Sign-Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          )
      ),
    );
  }
}
