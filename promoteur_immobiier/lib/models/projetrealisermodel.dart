import 'package:flutter/cupertino.dart';

class ProjetModel {
  List<String> favories;
  List<String> key;
  String apartire;
  String porcentage;
  String nomProjet;
  String nbAppartement;
  String nbEtage;
  String photo;
  String description;
  String plan;
  String etat;
  String id;
  String livreson;
  Color color;
  ProjetModel({
    this.apartire,
    this.key,
    this.livreson,
    this.porcentage,
    this.favories,
    this.nomProjet,
    this.nbAppartement,
    this.nbEtage,
    this.photo,
    this.description,
    this.plan,
    this.etat,
    this.id,
  });

  ProjetModel.fromJson(Map<String, dynamic> json) {
    apartire = json['apartire'];
    livreson = json['livreson'];
    porcentage = json['porcentage'];
    nomProjet = json['NomProjet'];
    nbAppartement = json['NbAppartement'];
    nbEtage = json['NbEtage'];
    photo = json['Photo'];
    description = json['description'];
    plan = json['plan'];
    etat = json['Etat'];
    id = json['uIdProjet'];
    favories = json["favories"] == null
        ? []
        : json["favories"].map<String>((i) => i as String).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'apartire': apartire,
      'livreson': livreson,
      'porcentage': porcentage,
      'NomProjet': nomProjet,
      'NbAppartement': nbAppartement,
      'NbEtage': nbEtage,
      'Photo': photo,
      'description': description,
      'plan': plan,
      'Etat': etat,
      'uIdProjet': id,
      "favories": favories,
      'key': key,
    };
  }
}
