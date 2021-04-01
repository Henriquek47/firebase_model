import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_model/model/todoRepository.dart';
import 'package:firebase_model/pages/home.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{
  
  @override
   final List <Bind> binds = [
     Bind((i) => TodoRepository(FirebaseFirestore.instance)),
   ];

  @override
   final List <ModularRoute> routes = [
     ChildRoute('/', child: (_, __) => HomePage()),
   ]; 

}