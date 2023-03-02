class Salle {
  final String numero;
  final String id_batiment;
  final String numero_etage;

  Salle(
      {required this.numero,
      required this.id_batiment,
      required this.numero_etage});

  factory Salle.fromJson(dynamic json) {
    return Salle(
        numero: json['numero'],
        id_batiment: json['id_batiment'],
        numero_etage: json['numero_etage']);
  }

  static Salle recipesFromSnapshotSingle(snapshot) {
    return snapshot.map((data) => Salle.fromJson(data));
  }

  static List<Salle> recipesFromSnapshot(List snapshot){
    return snapshot.map((data) => Salle.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'La distance minimum est: $numero';
  }
}
