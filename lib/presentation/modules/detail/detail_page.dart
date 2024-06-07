import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../../global/colors/app_colors.dart';
import '../../global/widgets/appbar_custom.dart';
import '../../routes/routes.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: appBarCustom(
        context: context,
        title: const Text(
          "Detalle",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Acción de eliminar producto
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              product.name,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 300,
            child: FadeInImage(
              image: NetworkImage(product.url),
              placeholder: const AssetImage('assets/images/loading.gif'),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/loading.gif',
                    fit: BoxFit.cover);
              },
            ),
          ),
          Text(
            product.description,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.buttonPrimaryColor,
          child: const Icon(Icons.edit),
          onPressed: () {
            Navigator.pushNamed(context, Routes.detail);
          }),
    );
  }
}
