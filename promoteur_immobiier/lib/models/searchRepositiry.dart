import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';

class SearchRepository {
  var db = FirebaseFirestore.instance.collection("Projet");
/*
  addEmp(ProjetModel emp){
    db.add(emp.toMap());
  }*/

//lhen bech Y5arj kol wed wa7do
  Future<List<ProjetModel>> getEmp() async {
    var data = await db.get();
    var emps =
        data.docs.map((emp) => ProjetModel.fromJson(emp.data())).toList();
    return emps;
  }

  Future<List<ProjetModel>> findEmp(key) async {
    var data = await db.where('key', arrayContains: key).get();
    var emps =
        data.docs.map((emp) => ProjetModel.fromJson(emp.data())).toList();
    return emps;
  }
}
