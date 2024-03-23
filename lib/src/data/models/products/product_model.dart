import 'package:coffee_house/src/data/models/categories/category_model.dart';

class ProductModel {
  int? id;
  String? name;
  String? description;
  CategoryModel? category;
  String? imageUrl;
  List<PriceModel>? prices;

  ProductModel(this.id, this.name, this.description, this.category,
      this.imageUrl, this.prices);

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    category =  json['category'] != null ? CategoryModel.fromJson(json['category']) : null;
    imageUrl = json['imageUrl'];
    prices =  (json['prices'] as List).map((e) => PriceModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category'] = category;
    data['imageUrl'] = imageUrl;
    data['prices'] = prices;
    return data;
  }
}

class PriceModel {
  String? value;
  String? currency;

  PriceModel(this.value, this.currency);

  PriceModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['currency'] = currency;
    return data;
  }
}
