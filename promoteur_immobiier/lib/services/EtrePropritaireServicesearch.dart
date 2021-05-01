import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promoteur_immobiier/view/screen/EtrePropritaire.dart';

class EtrePropritaireServicesSearch {
  //refernce de categorie
  final CollectionReference _appartementCollectionRef =
      FirebaseFirestore.instance.collection('Appartement');

  Future<List<QueryDocumentSnapshot>> getAppartementS() async {
    var value = await _appartementCollectionRef.get();
    // _allResult = value.docs;
    return value.docs;
  }
}
