class PlayerModel {
  final String id;
  final String name;
  final String role; // Batsman, Bowler, All-Rounder
  final String jerseyNumber;
  final String? imageUrl;
  
  // Batting Stats
  int runs;
  int balls;
  int fours;
  int sixes;
  bool isOut;
  String? outType; // Bowled, LBW, Caught, etc.
  
  // Bowling Stats
  double overs;
  int runsGiven;
  int wickets;
  int wides;
  int noBalls;
  
  PlayerModel({
    required this.id,
    required this.name,
    required this.role,
    required this.jerseyNumber,
    this.imageUrl,
    this.runs = 0,
    this.balls = 0,
    this.fours = 0,
    this.sixes = 0,
    this.isOut = false,
    this.outType,
    this.overs = 0.0,
    this.runsGiven = 0,
    this.wickets = 0,
    this.wides = 0,
    this.noBalls = 0,
  });

  // Calculate Strike Rate
  double get strikeRate {
    if (balls == 0) return 0.0;
    return (runs / balls) * 100;
  }

  // Calculate Economy Rate
  double get economyRate {
    if (overs == 0) return 0.0;
    return runsGiven / overs;
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'jerseyNumber': jerseyNumber,
      'imageUrl': imageUrl,
      'runs': runs,
      'balls': balls,
      'fours': fours,
      'sixes': sixes,
      'isOut': isOut,
      'outType': outType,
      'overs': overs,
      'runsGiven': runsGiven,
      'wickets': wickets,
      'wides': wides,
      'noBalls': noBalls,
    };
  }

  // Create from JSON
  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      jerseyNumber: json['jerseyNumber'] ?? '',
      imageUrl: json['imageUrl'],
      runs: json['runs'] ?? 0,
      balls: json['balls'] ?? 0,
      fours: json['fours'] ?? 0,
      sixes: json['sixes'] ?? 0,
      isOut: json['isOut'] ?? false,
      outType: json['outType'],
      overs: (json['overs'] ?? 0.0).toDouble(),
      runsGiven: json['runsGiven'] ?? 0,
      wickets: json['wickets'] ?? 0,
      wides: json['wides'] ?? 0,
      noBalls: json['noBalls'] ?? 0,
    );
  }

  // Copy with new values
  PlayerModel copyWith({
    String? id,
    String? name,
    String? role,
    String? jerseyNumber,
    String? imageUrl,
    int? runs,
    int? balls,
    int? fours,
    int? sixes,
    bool? isOut,
    String? outType,
    double? overs,
    int? runsGiven,
    int? wickets,
    int? wides,
    int? noBalls,
  }) {
    return PlayerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      jerseyNumber: jerseyNumber ?? this.jerseyNumber,
      imageUrl: imageUrl ?? this.imageUrl,
      runs: runs ?? this.runs,
      balls: balls ?? this.balls,
      fours: fours ?? this.fours,
      sixes: sixes ?? this.sixes,
      isOut: isOut ?? this.isOut,
      outType: outType ?? this.outType,
      overs: overs ?? this.overs,
      runsGiven: runsGiven ?? this.runsGiven,
      wickets: wickets ?? this.wickets,
      wides: wides ?? this.wides,
      noBalls: noBalls ?? this.noBalls,
    );
  }
}
