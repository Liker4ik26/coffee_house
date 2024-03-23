class CategoryModel {
  int? id;
  String? slug;

  CategoryModel(this.id, this.slug);

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    return data;
  }
}
