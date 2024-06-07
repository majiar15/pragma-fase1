import '../../domain/models/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasouce/product_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource = ProductDataSource();


  @override
  List<Product> getAllProducts() {
    List<Product> products = productDataSource.getAllProducts();
    return products;
  }

  @override
  void addProduct(Product product) {
    productDataSource.addProduct(product);
  }

  @override
  void removeProduct(String id) {
    productDataSource.removeProduct(id);
  }

  @override
  void updateProduct(Product updatedProduct) {
    productDataSource.updateProduct(updatedProduct);
  }
}
