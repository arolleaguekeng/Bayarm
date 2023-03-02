class Cable {
  final int id;
  final double longr;
  final String direction_origine;
  final String id_cp_destination;
  final String id_cp_origine;

  Cable(
      {required this.id,
      required this.longr,
      required this.direction_origine,
      required this.id_cp_destination,
      required this.id_cp_origine});

  factory Cable.fromJson(dynamic json) {
    return Cable(
        id: json['id'],
        longr: json['longr'],
        direction_origine: json['direction_origine'],
        id_cp_destination: json['id_cp_destination'],
        id_cp_origine: json['id_cp_origine']);
  }

  static Cable recipesFromSnapshotSingle(snapshot) {
    return snapshot.map((data) => Cable.fromJson(data));
  }

  @override
  String toString() {
    return 'Le Cable: $id';
  }
}
