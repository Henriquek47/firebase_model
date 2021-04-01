import 'package:cloud_firestore/cloud_firestore.dart';

class TodoRepository{

  final FirebaseFirestore firestore;

  CollectionReference firebase =
      FirebaseFirestore.instance.collection('colecao');

  TodoRepository(this.firestore);

      collection() => firebase;

  Future<String> addFirebase(String title, String name) async {
    //adicionar o objecto em forma de json para a coleção de minions
    return await firebase
        .add({
          title : name,
        })
        .then((value) => "Mais um minion adicionado à família")
        .catchError((error) =>
            "Parece que teve problemas com o último minion:\n $error");
    }

  Future<QuerySnapshot> queryCollection(queryString) async {
    //retorna o snapshot equivalente aos objectos json onde
    // o nome é igual ao passado como argumento
    return await firebase.where('title', isEqualTo: queryString).get();
  }

  Future updateUser(nome) {
    //com base na coleção pegamos todos os dados que nela existem, que retorna
    //QuerySnapshot e usando o mesmo para iterar pelos documentos dentro dele
    return firebase.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        //verificar se o dcumento tem como atributo nome igual ao pretendido alterar
          firebase
              .doc(doc.id) //pegar o id do documento que se pretende actualizar
              .update({'title': nome})
              .then((value) => "Minion com nome actualizado")
              .catchError((error) =>
                  "Oops, parece que não deu pra actualizar:\n $error");
      });
    });
  }

  }