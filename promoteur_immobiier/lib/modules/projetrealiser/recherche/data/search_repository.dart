import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/recherche/data/search_model.dart';

class SearchRepository {
  var db = FirebaseFirestore.instance.collection("empl");

  addEmp(SearchModel emp) {
    db.add(emp.toMap());
  }

  Future<List<SearchModel>> getEmp() async {
    var data = await db.get();
    var emps = data.docs.map((emp) => SearchModel.fromMap(emp.data())).toList();
    return emps;
  }

  Future<List<SearchModel>> findEmp(
    key,
  ) async {
    if (key.isEmpty) {
      print("helo"); // 3lech notch ken key wed brk :)
    }
    var data = await db.where('key', arrayContains: key).get();
    var data2 = await db.where('keys2', arrayContains: key).get();

    var emps = data.docs
        .map((emp) => SearchModel.fromMap(emp.data()))
        .toList(); // honi mochkl

    if (emps == "") {
      var emps =
          data2.docs.map((emp) => SearchModel.fromMap(emp.data())).toList();

      return emps;
    }
    return emps;

    //honi
  }
}
