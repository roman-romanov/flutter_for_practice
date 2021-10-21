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
        article: json['article'],
        name: json['name'],
        category: json['category'],
        imageUrl: json['imageUrl'],
        oldPrice: json['oldPrice'],
        price: json['price'],
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
