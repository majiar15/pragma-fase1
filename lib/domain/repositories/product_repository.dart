import '../models/product.dart';

abstract class ProductRepository {

  List<Product> getAllProducts();
  void addProduct(Product product);
  void removeProduct(String id);
  void updateProduct(Product product);

}