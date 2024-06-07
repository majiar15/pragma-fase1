import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../domain/models/product.dart';
import '../../../global/colors/app_colors.dart';

class CardProduct extends StatelessWidget {
  final Product product;

  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: product);
      },
      child: Container(
        height: 350,
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width,
                height: 200,
                child: FadeInImage(
                  image: NetworkImage(product.url),
                  placeholder:
                      const AssetImage('assets/images/loading.gif'),
                  imageErrorBuilder: (context, error, stackTrace) {
                    log("Fallo el cargar la imagen: ${error.toString()}");

                    return Image.asset('assets/images/loading.gif',
                        fit: BoxFit.cover);
                  },
                ),
              ),
              Text(
                product.name,
                style: const TextStyle(
                  color: AppColors.primaryColorDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                "\$ ${product.price}",
                style: const TextStyle(
                    color: AppColors.primaryColorDark, fontSize: 20),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.buttonPrimaryColor,
                  side: const BorderSide(
                      color: AppColors.buttonPrimaryColor), // Color del borde
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Cambia la forma del botón
                  ),
                ),
                child: const Text('Ver más'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
