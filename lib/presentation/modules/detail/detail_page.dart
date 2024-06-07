import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../../../main.dart';
import '../../global/colors/app_colors.dart';
import '../../global/widgets/appbar_custom.dart';
import '../../global/widgets/delete_confirmation_dialog.dart';
import '../../routes/routes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Product product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    product = ModalRoute.of(context)!.settings.arguments as Product;
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = Injector.of(context).productBloc;

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
              showDialog(
                context: context,
                builder: (context) => DeleteConfirmationDialog(
                  onDeleteConfirmed: () {
                    productBloc.deleteProduct(product.id!);
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                product.name,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: SizedBox(
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
            ),
            Text(
              product.description,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.buttonPrimaryColor,
          child: const Icon(Icons.edit),
          onPressed: () async {
            Product newProduct = await Navigator.pushNamed(context, Routes.form,
                arguments: product) as Product;
            product = newProduct;
            setState(() {});
          }),
    );
  }
}
