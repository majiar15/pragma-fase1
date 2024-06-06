import '../../common/utils/uuid_util.dart';
import '../../domain/models/product.dart';

class ProductDataSource {

  static final ProductDataSource _instance = ProductDataSource._internal();

  ProductDataSource._internal();

  factory ProductDataSource() {
    return _instance;
  }

  final List<Product> _products = [];

  List<Product> getAllProducts() {
    return _products;
  }

  void addProduct(Product product) {
    final newProduct = Product(
        id: UUIDUtils.generate(),
        name: product.name,
        price: product.price,
        description: product.description,
        url: product.url
    );
    _products.add(newProduct);
  }

  void removeProduct(String id) {
    _products.removeWhere((product) => product.id == id);
  }

  void updateProduct(Product updatedProduct) {
    final index =
        _products.indexWhere((product) => product.id == updatedProduct.id);
    if (index != -1) {
      _products[index] = updatedProduct;
    }
  }
}
