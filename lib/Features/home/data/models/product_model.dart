class ProductModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;
  final String description;

  ProductModel( 
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.image,
     required this.description
      });
  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
      description: json['description'],
    );
  }
}
