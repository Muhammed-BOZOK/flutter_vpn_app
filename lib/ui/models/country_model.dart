class Country {
  final String name;
  final String flag;
  final String city;
  final int locationCount;
  final int strength;
  bool isSelected;

  Country({
    required this.name,
    required this.flag,
    required this.city,
    required this.locationCount,
    required this.strength,
    this.isSelected = false
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      flag: json['flag'],
      city: json['city'] ?? '',
      locationCount: json['locationCount'] ?? 0,
      strength: json['strength'] ?? 0,
      isSelected: json['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'flag': flag,
      'city': city,
      'locationCount': locationCount,
      'strength': strength,
      'isSelected': isSelected,
    };
  }
  
}