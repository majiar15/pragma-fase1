import 'package:flutter/material.dart';

import 'app.dart';
import 'data/repositories_implementation/product_repository_impl.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/use_cases/products/add_product_use_case.dart';
import 'domain/use_cases/products/delete_product_use_case.dart';
import 'domain/use_cases/products/get_all_products_use_case.dart';
import 'domain/use_cases/products/update_product_use_case.dart';
import 'presentation/bloc/products_bloc.dart';

void main(){
  ProductRepository productRepository = ProductRepositoryImpl();
  runApp(
    Injector(
      productBloc: ProductBloc(
        getAllProductsUseCase: GetAllProductsUseCase(productRepository),
        addProductUseCase: AddProductUseCase(productRepository),
        deleteProductUseCase: DeleteProductUseCase(productRepository),
        updateProductUseCase: UpdateProductUseCase(productRepository),
      ),
      child: const App()
    )
  );
}

class Injector extends InheritedWidget {

  const Injector({
    super.key,
    required super.child,
    required this.productBloc
  });

  final ProductBloc productBloc;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw UnimplementedError();
  }

  static Injector of(BuildContext context){
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, "injector not found");
    return injector!;
  }

}