class Company {
  final int id;
  final String? logo_path;
  final String? name;
  final String? origin_country;

  Company({
    required this.id,
    required this.logo_path,
    required this.name,
    required this.origin_country,
  });

  factory Company.fromJson(Map<dynamic, dynamic> json) => Company(
        id: json['id'],
        logo_path: json['logo_path'],
        name: json['name'],
        origin_country: json['origin_country'],
      );

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'logo_path': logo_path,
        'name': name,
        'origin_country': origin_country,
      };

  static List<Company> fromArray(dynamic json) {
    final List<Company> companies = [];
    for (var c in json) {
      companies.add(Company.fromJson(c));
    }
    return companies;
  }
}
