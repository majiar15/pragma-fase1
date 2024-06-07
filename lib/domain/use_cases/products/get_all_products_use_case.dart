import '../../models/product.dart';
import '../../repositories/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository repository;

  GetAllProductsUseCase(this.repository);

  List<Product> call() {
    return repository.getAllProducts();
  }
}
