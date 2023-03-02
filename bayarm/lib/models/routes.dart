class BestRoute {
  final double distance;
  final List<String> path;

  BestRoute({required this.distance, required this.path});

  factory BestRoute.fromJson(dynamic json) {
    return BestRoute(
        distance: json['distance'] as double,
        path: json['path'] as List<String>);
  }

  static BestRoute recipesFromSnapshotSingle(snapshot) {
    return snapshot.map((data) => BestRoute.fromJson(data));
  }

  @override
  String toString() {
    return 'La distance minimum est: $distance';
  }
}
