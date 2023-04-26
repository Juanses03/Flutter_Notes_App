import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/style/app_style.dart';

class NoteEditor extends StatefulWidget {
  const NoteEditor({super.key});

  @override
  State<NoteEditor> createState() => NoteEditorState();
}

class NoteEditorState extends State<NoteEditor> {
  // Se genera un número aleatorio entre 0 y la cantidad de colores disponibles en AppStyle
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  
  // Se obtiene la fecha y hora actual como un String
  String date = DateTime.now().toString();

  // Controladores para los campos de título y contenido de la nota
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add a new Note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: AppStyle.mainTittle,
            ),
            SizedBox(height: 8.0,),
            Text(date, style: AppStyle.dateTittle,),
            SizedBox(height: 28.0,),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          // Se agrega la nota a la colección "Notes" en Firestore
          FirebaseFirestore.instance.collection("Notes").add({
            "note_title" : _titleController.text,
            "creation_date" : date,
            "note_content" : _mainController.text,
            "color_id" : color_id
          }).then((value) {
            // Si la nota se agregó correctamente, se cierra la pantalla de edición y se vuelve a la pantalla principal
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("Failed to add new Note due to $error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
