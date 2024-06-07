
import 'dart:async';

import '../../domain/models/product.dart';
import '../../domain/use_cases/products/add_product_use_case.dart';
import '../../domain/use_cases/products/delete_product_use_case.dart';
import '../../domain/use_cases/products/get_all_products_use_case.dart';
import '../../domain/use_cases/products/update_product_use_case.dart';

class ProductBloc {
  final GetAllProductsUseCase getAllProductsUseCase;
  final AddProductUseCase addProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;
  final UpdateProductUseCase updateProductUseCase;


  final _productsController = StreamController<List<Product>>();

  Stream<List<Product>> get productsStream => _productsController.stream;

  ProductBloc({
    required this.getAllProductsUseCase,
    required this.addProductUseCase,
    required this.deleteProductUseCase,
    required this.updateProductUseCase,
  }) {
    loadProducts();
  }

  void loadProducts() {
    try {
      final products = getAllProductsUseCase();
      _productsController.sink.add(products);
    } catch (e) {
      _productsController.sink.addError('Failed to load products');
    }
  }

  void addNewProduct(Product product) {
    try {
      addProductUseCase(product);
      loadProducts();
    } catch (e) {
      _productsController.sink.addError('Failed to add product');
    }
  }

  void deleteProduct(String productId) {
    try {
      deleteProductUseCase(productId);
      loadProducts();
    } catch (e) {
      _productsController.sink.addError('Failed to remove product');
    }
  }

  void updateExistingProduct(Product product) {
    try {
      updateProductUseCase(product);
      loadProducts();
    } catch (e) {
      _productsController.sink.addError('Failed to update product');
    }
  }

  void dispose() {
    _productsController.close();
  }
}
