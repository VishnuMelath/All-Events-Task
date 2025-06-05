class CategoryModel {
  final String category;
  final String url;

  CategoryModel({required this.category, required this.url});

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(
      category: data['category'],
      url: (data['data'] as String).split('/').last,
    );
  }
}
