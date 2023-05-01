class CityModel {
  final CoordinatiesModel coordinaties;
  final String district;
  final String name;
  final int population;
  final String subject;

  CityModel({
    required this.coordinaties,
    required this.district,
    required this.name,
    required this.population,
    required this.subject,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        coordinaties: CoordinatiesModel.fromJson(json['coords']),
        district: json['district'],
        name: json['name'],
        population: json['population'],
        subject: json['subject'],
      );
}

class CoordinatiesModel {
  final String lat;
  final String lon;

  CoordinatiesModel({
    required this.lat,
    required this.lon,
  });

  factory CoordinatiesModel.fromJson(Map<String, dynamic> json) =>
      CoordinatiesModel(
        lat: json['lat'] as String,
        lon: json['lon'] as String,
      );
}
