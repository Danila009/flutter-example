
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_example/data/firebase/firebase-constants.dart';

import '../model/note_entity.dart';

class NoteDataStore {

  final FirebaseConstants constants = FirebaseConstants();

  Stream<QuerySnapshot<Map<String, dynamic>>> notesSnapshots = FirebaseFirestore
      .instance.collection('notes').snapshots();
  CollectionReference<Map<String, dynamic>> notes = FirebaseFirestore.instance.collection('notes');

  List<NoteEntity> getNotes(){

    List<NoteEntity> notesEntity = [];

    notes.get()
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
    return notes.add({
      'id':noteEntity.id,
      'title':noteEntity.title,
      'description':noteEntity.description
    });
  }
}