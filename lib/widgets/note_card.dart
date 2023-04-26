// Este widget es una tarjeta que muestra una nota. Al hacer clic en la tarjeta, se ejecuta la función onTap.
// Recibe como parámetro una función onTap y un documento de instantánea de consulta de Firebase Firestore que contiene información de la nota.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
return InkWell(
onTap: onTap,
child: Container(
padding: EdgeInsets.all(8.0),
margin: EdgeInsets.all(8.0),
decoration: BoxDecoration(
color: AppStyle.cardsColor[int.parse(doc['color_id'].toString())], // El color de la tarjeta se basa en el color_id almacenado en el documento de la nota
borderRadius: BorderRadius.circular(8.0),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(doc["note_title"], style: AppStyle.mainTittle,),SizedBox(height: 4.0,), // El título de la nota
Text(doc["creation_date"], style: AppStyle.dateTittle,),SizedBox(height: 8.0,), // La fecha de creación de la nota
Text(doc["note_content"], style: AppStyle.mainContent,overflow: TextOverflow.ellipsis,), // El contenido de la nota, con un límite de línea y puntos suspensivos en caso de que se exceda el espacio
],
),
),
);
}