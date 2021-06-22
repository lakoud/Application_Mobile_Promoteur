class EqipementModel {
  String type;
  String idProjet;
  String idequipement;
  EqipementModel({this.type, this.idProjet, this.idequipement});

  EqipementModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    idProjet = json['IdProjet'];
    idequipement = json['idequipement'];
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'IdProjet': idProjet,
      'idequipement': idequipement,
    };
  }
}
