import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/screens/note_editor.dart';
import 'package:notes/screens/note_reader.dart';
import 'package:notes/style/app_style.dart';

import '../widgets/note_card.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Notes"),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titulo de la seccion
            Text(
              "Your recent Notes",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            SizedBox(
              height: 20.0,
            ),
            // Lista de notas
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Muestra un indicador de carga mientras se espera la respuesta de la base de datos
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    // Si hay datos muestra la lista de notas en un GridView con 2 columnas
                    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                      children: snapshot.data!.docs.map((note) => noteCard((){
                        // Si se hace tap en una nota, abre la vista de lectura de la nota correspondiente
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => 
                            NoteReader(note),
                            ));
                      },note))
                      .toList()
                    );
                  }
                  // Si no hay notas, muestra un mensaje
                  return Text(
                    "There's no Notes",
                    style: GoogleFonts.nunito(color: Colors.white),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Boton para agregar una nueva nota
      floatingActionButton: FloatingActionButton.extended(onPressed:(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditor(),));
      }, label: Text("Add New Note"),
      icon: Icon(Icons.add),
      ),
    );
  }
}
