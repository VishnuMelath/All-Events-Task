class CategoryModel {
  final String category;
  final String url;
  final String image;
  CategoryModel({
    required this.category,
    required this.url,
    required this.image,
  });

  static Map<String, String> images = {
    'all': 'assets/images/othe.jpg',
    'music': 'assets/images/music.jpg',
    'business': 'assets/images/business.jpg',
    'workshops': 'assets/images/workshop.jpg',
    'sports': 'assets/images/sports.jpg',
  };

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(
      category: data['category'],
      url: (data['data'] as String).split('/').last,
      image: images[data['category']] ?? 'assets/images/othe.jpg',
    );
  }
}
