class Batiment {
  final int numero;
  final String longr;
  final String largr;

  Batiment(
      {required this.numero,
        required this.longr,
        required this.largr});

  factory Batiment.fromJson(dynamic json) {
    return Batiment(
        numero: json['numero'],
        longr: json['longr'],
        largr: json['largr']);
  }

  static Batiment recipesFromSnapshotSingle(snapshot) {
    return snapshot.map((data) => Batiment.fromJson(data));
  }

  @override
  String toString() {
    return 'Batiment: $numero';
  }
}
