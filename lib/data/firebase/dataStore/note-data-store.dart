
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_example/data/firebase/firebase-constants.dart';

import '../model/note_entity.dart';

class NoteDataStore {

  final FirebaseConstants constants = FirebaseConstants();
  final FirebaseAuth auth = FirebaseAuth.instance;

  DocumentReference<Map<String, dynamic>> notes = FirebaseFirestore.instance
      .collection('notes').doc("user");

  List<NoteEntity> getNotes(){

    List<NoteEntity> notesEntity = [];

    if(auth.currentUser?.uid == null) {
      return notesEntity;
    }

    notes.collection(auth.currentUser!.uid).get()
        .then((QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            notesEntity.add(
                NoteEntity(
                    id: doc['id'],
                    title: doc['title'],
                    description: doc['description']
                )
            );
          }
          return notesEntity;
        });

    return notesEntity;
  }

  Future<DocumentReference<Map<String, dynamic>>> addNote(
      {required NoteEntity noteEntity}
  ){
    if(auth.currentUser?.uid == null) {
      return Future.error(Error);
    }

    return notes.collection(auth.currentUser!.uid).add({
      'id':noteEntity.id,
      'title':noteEntity.title,
      'description':noteEntity.description
    });
  }
}