class Checkpoint {
  final int id_checkpoint;
  final String image;
  final String id_batiment;
  final int id_etage;

  Checkpoint(
      {required this.id_checkpoint,
      required this.image,
      required this.id_batiment,
      required this.id_etage});

  factory Checkpoint.fromJson(dynamic json) {
    return Checkpoint(
        id_checkpoint: json['id_checkpoint'],
        image: json['image'],
        id_batiment: json['id_batiment'],
        id_etage: json['id_etage']);
  }

  static Checkpoint recipesFromSnapshotSingle(snapshot) {
    return snapshot.map((data) => Checkpoint.fromJson(data));
  }

  @override
  String toString() {
    return 'La distance minimum est: $id_checkpoint';
  }
}
