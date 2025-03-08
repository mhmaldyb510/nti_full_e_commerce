class ProductModel {
  final String id;
  final String status;
  final String category;
  final String name;
  final double price;
  final String description;
  final String image;
  final List<String> images;
  final String company;
  final int countInStock;
  final int v;
  final int sales;
  final int? quantity;
  final num? totalPrice;

  ProductModel({
    required this.id,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.company,
    required this.countInStock,
    required this.v,
    required this.sales,
    this.quantity,
    this.totalPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      status: json['status'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      company: json['company'] ?? '',
      countInStock: json['countInStock'] ?? 0,
      v: json['__v'] ?? 0,
      sales: json['sales'] ?? 0,
      quantity: json['quantity'] ?? 0,
      totalPrice: json['totalPrice'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'status': status,
      'category': category,
      'name': name,
      'price': price,
      'description': description,
      'image': image,
      'images': images,
      'company': company,
      'countInStock': countInStock,
      '__v': v,
      'sales': sales,
      'quantity': quantity,
      'totalPrice': totalPrice,
    };
  }
}
