import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Company extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String logo_path;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String origin_country;

  Company(this.id, this.logo_path, this.name, this.origin_country);
}
