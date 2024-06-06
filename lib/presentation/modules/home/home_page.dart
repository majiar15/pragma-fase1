import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../../../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productRepository = Injector.of(context).productRepository;
    if (kDebugMode) {
      const product = Product(name: "Perro Caliente", price: 12000, description: "description", url: "url");
      productRepository.addProduct(product);
      print(productRepository.getAllProducts());
    }
    return Container();
  }
}