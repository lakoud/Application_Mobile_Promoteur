class CordonnerModel {
  String numphone;
  String lienyoutube;
  String lieninstgrame;
  String ville;
  String pays;
  String rue;
  String llienfb;
  String lienmap;
  String residence;

  CordonnerModel(
      {this.lieninstgrame,
      this.residence,
      this.lienmap,
      this.lienyoutube,
      this.llienfb,
      this.numphone,
      this.pays,
      this.rue,
      this.ville});

  CordonnerModel.fromJson(Map<String, dynamic> json) {
    residence = json['residence'];

    lieninstgrame = json['lieninstgrame'];
    lienmap = json['lienmap'];
    lienyoutube = json['lienyoutube'];
    llienfb = json['llienfb'];
    numphone = json['numphone'];
    pays = json['pays'];
    rue = json['rue'];
    ville = json['ville'];
  }

  Map<String, dynamic> toMap() {
    return {
      'lieninstgrame': lieninstgrame,
      'lienmap': lienmap,
      'lienyoutube': lienyoutube,
      'llienfb': llienfb,
      'numphone': numphone,
      'pays': pays,
      'rue': rue,
      'ville': ville,
      'residence': residence,
    };
  }
}
