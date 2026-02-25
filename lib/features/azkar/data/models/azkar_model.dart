import 'package:sadaqa_app/features/azkar/domin/entites/azkar_entity.dart';

class AzkarCategoryModel extends AzkarCategoryEntity {
  AzkarCategoryModel({required super.name, required super.azkarList});

  factory AzkarCategoryModel.fromJson(Map<String, dynamic> json) {
    return AzkarCategoryModel(
      name: json['category'] as String,
      azkarList:
          (json['azkar'] as List).map((e) => AzkarModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': name,
      'azkar': azkarList.map((e) => AzkarModel.fromEntity(e).toJson()).toList(),
    };
  }
}

class AzkarModel extends AzkarEntity {
  AzkarModel({
    required super.title,
    required super.description,
    required super.content,
    required super.count,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      title: json['content'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      count: int.tryParse(json['count'].toString()) ?? 1,
    );
  }
  factory AzkarModel.fromEntity(AzkarEntity entity) {
    return AzkarModel(
      title: entity.title,
      description: entity.description,
      content: entity.content,
      count: entity.count,
    );
  }
  toJson() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'count': count,
    };
  }
}
