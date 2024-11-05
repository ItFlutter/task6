import 'category_model.dart';

class SubCategory {
  int? id;
  String? name;
  CategoryModel? category;

  SubCategory({this.id, this.name, this.category});

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json['id'] as int?,
        name: json['name'] as String?,
        category: json['category'] == null
            ? null
            : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category?.toJson(),
      };
}
