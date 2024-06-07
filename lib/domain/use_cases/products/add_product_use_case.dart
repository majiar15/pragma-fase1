import '../../models/product.dart';
import '../../repositories/product_repository.dart';

class AddProductUseCase {
  final ProductRepository repository;

  AddProductUseCase(this.repository);

  void call(Product product) {
    repository.addProduct(product);
  }
}
