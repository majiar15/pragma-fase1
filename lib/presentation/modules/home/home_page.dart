import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../../../main.dart';
import '../../global/colors/app_colors.dart';
import '../../global/widgets/appbar_custom.dart';
import '../../routes/routes.dart';
import 'widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _init();
    });
  }

  _init() async {
    final productBloc = Injector.of(context).productBloc;

    const newProduct = Product(
        name: "Perro",
        price: 1200,
        description: "description",
        url:
            "https://user-images.githubusercontent.com/25193983/112195232-b8665d80-8c2f-11eb-83cb-e362b8bff420.png");
    productBloc.addNewProduct(newProduct);
    const newProduct2 = Product(
      name: 'Perro Caliente Deluxe',
      price: 4.99,
      description:
          '¡El perro caliente definitivo! Con todos los ingredientes que amas: salchicha de alta calidad, pan recién horneado, cebolla caramelizada, jalapeños picantes, queso derretido y una deliciosa salsa especial.',
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdMUMtR0GavWYtId0SRbOi7ALClfYolyzSJw&s',
    );
    productBloc.addNewProduct(newProduct2);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    final productBloc = Injector.of(context).productBloc;
    return Scaffold(
      appBar: appBarCustom(
        context: context,
        title: const Text(
          "Productos",
          style: TextStyle(fontSize: 25),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        controller: scrollController,
        child: StreamBuilder<List<Product>>(
          stream: productBloc.productsStream,
          initialData: const [],
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardProduct(product: snapshot.data![index]);
                },
              );
            } else {
              return const Center(
                child: Text(
                  "No hay Productos agregados :c",
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.buttonPrimaryColor,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, Routes.form);
          }),
    );
  }
}
