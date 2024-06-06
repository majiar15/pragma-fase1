import 'package:flutter/material.dart';

import 'app.dart';
import 'data/repositories_implementation/product_repository_impl.dart';
import 'domain/repositories/product_repository.dart';

void main(){
  runApp(
    Injector(
      productRepository: ProductRepositoryImpl(),
      child: const App()
    )
  );
}

class Injector extends InheritedWidget {

  const Injector({
    super.key,
    required super.child,
    required this.productRepository,
  });

  final ProductRepository productRepository;

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