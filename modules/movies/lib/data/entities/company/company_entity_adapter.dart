import 'package:core/core.dart';

import 'company_entity.dart';

class CompanyAdapter extends TypeAdapter<CompanyEntity> {
  @override
  final typeId = 0;

  @override
  CompanyEntity read(BinaryReader reader) {
    return CompanyEntity.fromJson(reader.read());
  }

  @override
  void write(BinaryWriter writer, CompanyEntity obj) {
    writer.write(obj.toJson());
  }
}
