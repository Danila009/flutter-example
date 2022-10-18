
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/firebase/dataStore/note-data-store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final NoteDataStore noteDataStore = NoteDataStore();

  @override
  Widget build(BuildContext context) {

    if(auth.currentUser == null){
      return const Text("No Auth");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create_note'),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: noteDataStore.notes.collection(auth.currentUser!.uid).snapshots(),
        builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot
            ){
          if(snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }

          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }

          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context,index){
              return Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(16.00)),
                    Text(data.docs[index]['title']),
                    const Padding(padding: EdgeInsets.all(16.00)),
                    Text(data.docs[index]['description']),
                    const Padding(padding: EdgeInsets.all(16.00)),
                  ],
                )
              );
            },
          );
        },
      )
    );
  }
}