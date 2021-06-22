class Avancement {
  String date;
  String idProjet;
  String description;
  String idavencement;
  Avancement({
    this.idavencement,
    this.idProjet,
    this.description,
    this.date,
  });

  Avancement.fromJson(Map<String, dynamic> json) {
    idavencement = json['idavencement'];
    idProjet = json['idProjet'];
    description = json['description'];
    date = json['date'];
  }

  Map<String, dynamic> toMap() {
    return {
      'idavencement': idavencement,
      'idProjet': idProjet,
      'date': date,
      'description': description,
    };
  }
}
