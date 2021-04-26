import 'package:cloud_firestore/cloud_firestore.dart';

class EtrePropritaireServices {
  //refernce de categorie
  final CollectionReference _appartementCollectionRef =
      FirebaseFirestore.instance.collection('Appartement');

  Future<List<QueryDocumentSnapshot>> getAppartement() async {
    var value = await _appartementCollectionRef.get();
    return value.docs;
  }
}
