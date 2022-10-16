import 'package:core/core.dart';
import 'package:model/general/company.dart';

@HiveType(typeId: 0)
class CompanyEntity extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? logo_path;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String origin_country;

  CompanyEntity({
    required this.id,
    required this.logo_path,
    required this.name,
    required this.origin_country,
  });

  factory CompanyEntity.fromJson(Map<dynamic, dynamic> json) => CompanyEntity(
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

  static List<CompanyEntity> fromArray(dynamic json) {
    final List<CompanyEntity> companies = [];
    for (var c in json) {
      companies.add(CompanyEntity.fromJson(c));
    }
    return companies;
  }

  Company toAppModel() => Company(
      id: id, logo_path: logo_path, name: name, origin_country: origin_country);
}
