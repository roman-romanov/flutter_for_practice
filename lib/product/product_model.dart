class ProductModel {
  String? id;
  String? name;
  String? category;
  String? imageUrl;
  String? oldPrice;
  String? price;
  ProductModel({
    this.id,
    this.name,
    this.category,
    this.imageUrl,
    this.oldPrice,
    this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        imageUrl: json['imageUrl'],
        oldPrice: json['oldPrice'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'imageUrl': imageUrl,
        'oldPrice': oldPrice,
        'price': price,
      };
}
