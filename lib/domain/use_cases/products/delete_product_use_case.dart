
import '../../repositories/product_repository.dart';

class DeleteProductUseCase {
  final ProductRepository repository;

  DeleteProductUseCase(this.repository);

  void call(String productId) {
    repository.removeProduct(productId);
  }
}
