class ProductModel {
  String? article;
  String? name;
  String? category;
  String? imageUrl;
  String? oldPrice;
  String? price;
  ProductModel({
    this.article,
    this.name,
    this.category,
    this.imageUrl,
    this.oldPrice,
    this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        article: json['article'] as String,
        name: json['name'] as String,
        category: json['category']as String,
        imageUrl: json['imageUrl'] as String,
        oldPrice: json['oldPrice'] as String,
        price: json['price'] as String,
      );

  Map<String, dynamic> toJson() => {
        'article': article,
        'name': name,
        'category': category,
        'imageUrl': imageUrl,
        'oldPrice': oldPrice,
        'price': price,
      };
}
