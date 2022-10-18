
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String messageError = "";
  String email = "";
  String password = "";

  void auth() async {
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.pushNamed(context, '/'))
        .catchError((error) => messageError = error);
  }

  void registration() async {
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.pushNamed(context, '/'))
        .catchError((error) => messageError = error);
  }

  @override
  void initState() {
    if(firebaseAuth.currentUser != null){
      Navigator.pushNamed(context, '/');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(messageError),
          TextField(
            onChanged: (text) {
              email = text;
            },
            decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: EdgeInsets.all(16.00)),
          TextField(
            onChanged: (text) {
              password = text;
            },
            decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: EdgeInsets.all(16.00)),
          OutlinedButton(
            onPressed: auth,
            child: const Text('Auth'),
          ),
          const Padding(padding: EdgeInsets.all(5.00)),
          OutlinedButton(
            onPressed: registration,
            child: const Text('Registration'),
          )
        ],
      ),
    );
  }
}
