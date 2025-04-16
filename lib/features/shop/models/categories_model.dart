class CategoriesModel {
  String name;
  String id;
  String image;
  String parentId;
  bool isFeatured;

  CategoriesModel({
    required this.name,
    required this.id,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  static CategoriesModel empty() =>
      CategoriesModel(name: '', id: '', image: '', isFeatured: false);
}
