class Product {

  final String? id;
  final String name;
  final double price;
  final String url;
  final String description;

  const Product({
    this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.url
  });
}