import 'package:albums_demo_app/domain/entities/company.dart';

class CompanyModel extends Company {
  const CompanyModel({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json){
    return CompanyModel(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

}