import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/style/app_style.dart';

class NoteReader extends StatefulWidget {
  NoteReader(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<NoteReader> createState() => _NoteReaderState();
}

class _NoteReaderState extends State<NoteReader> {
  @override
  Widget build(BuildContext context) {
    // Parseamos el valor de 'color_id' como un entero para poder usarlo en el índice de la lista 'AppStyle.cardsColor'
    int color_id = int.parse(widget.doc['color_id'].toString());

    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mostramos el título de la nota con el estilo definido en 'AppStyle'
            Text(widget.doc["note_title"], style: AppStyle.mainTittle,),
            SizedBox(height: 4.0,),
            // Mostramos la fecha de creación de la nota con el estilo definido en 'AppStyle'
            Text(widget.doc["creation_date"], style: AppStyle.dateTittle,),
            SizedBox(height: 18.0,),
            // Mostramos el contenido de la nota con el estilo definido en 'AppStyle'. Usamos 'TextOverflow.ellipsis' para que el texto se recorte si es muy largo
            Text(widget.doc["note_content"], style: AppStyle.mainContent, overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}
