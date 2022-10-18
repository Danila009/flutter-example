
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/screens/auth.dart';
import 'package:flutter_example/screens/create_note.dart';

import 'firebase_options.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    initialRoute: '/auth',
    routes: {
        '/': (context) => const HomeScreen(),
        '/create_note': (context) => const CreateNoteScreen(),
        '/auth': (context) => const AuthScreen()
    },
  ));
}