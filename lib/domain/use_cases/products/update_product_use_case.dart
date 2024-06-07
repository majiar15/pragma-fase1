
import '../../models/product.dart';
import '../../repositories/product_repository.dart';

class UpdateProductUseCase {
  final ProductRepository repository;

  UpdateProductUseCase(this.repository);

  void call(Product product) {
    repository.updateProduct(product);
  }
}
