import '../sub_category.dart';

class ProductModel {
  int? id;
  String? name;
  SubCategory? subCategory;
  String? image;
  int? price;
  int? evaluation;
  int? discount;

  ProductModel({
    this.id,
    this.name,
    this.subCategory,
    this.image,
    this.price,
    this.evaluation,
    this.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        subCategory: json['sub-category'] == null
            ? null
            : SubCategory.fromJson(
                json['sub-category'] as Map<String, dynamic>),
        image: json['image'] as String?,
        price: json['price'] as int?,
        evaluation: json['evaluation'] as int?,
        discount: json['discount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'sub-category': subCategory?.toJson(),
        'image': image,
        'price': price,
        'evaluation': evaluation,
        'discount': discount,
      };
}
