
import 'package:flutter/material.dart';

import '../data/firebase/dataStore/note-data-store.dart';
import '../data/firebase/model/note_entity.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {

  final NoteDataStore noteDataStore = NoteDataStore();

  String title = "";
  String desc = "";

  void addNote() {

    noteDataStore.addNote(
        noteEntity: NoteEntity(
            id: "id",
            title: title,
            description: desc
        )
    ).then((value) => {
      value.update({'id': value.id})
      .then((value) => {
        Navigator.pushNamed(context, '/')
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create note"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (text) {
              title = text;
            },
            decoration: const InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: EdgeInsets.all(16.00)),
          TextField(
            onChanged: (text) {
              desc = text;
            },
            decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: EdgeInsets.all(16.0)),
          OutlinedButton(
            onPressed: addNote,
            child: const Text('Add note'),
          )
        ],
      ),
    );
  }
}
