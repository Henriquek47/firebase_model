import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_model/model/todoRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final repository = Modular.get<TodoRepository>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.white,
          child: StreamBuilder<QuerySnapshot>(
            stream: repository.firebase.snapshots(),
            builder: (context, snapshot) {
              if(snapshot.data == null){
                return Center(
                  child:CircularProgressIndicator());
              }
          return ListView.builder(
            //children: snapshot.data.docs.map((DocumentSnapshot snapshot){
            itemCount: 1,
            itemBuilder: (context, index) {  
            return Column(
              children: [
              TextField(
              onChanged: (value) {
                
              },
            ),
            Center(
              child: ListTile(
              title: Text('controller.byIndex(index).title'),
            ))
            ]);
          });
      })),),
    );
  }
}