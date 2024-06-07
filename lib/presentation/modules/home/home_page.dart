import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../../../main.dart';
import '../../global/colors/app_colors.dart';
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
    const newProduct = Product(name: "Perro", price: 1200, description: "description", url: "https://user-images.githubusercontent.com/25193983/112195232-b8665d80-8c2f-11eb-83cb-e362b8bff420.png");
    productBloc.addNewProduct(newProduct);
    await Future.delayed(const Duration(seconds: 2));
    const newProduct2 = Product(name: "Perro 2", price: 1200, description: "description", url: "url");
    productBloc.addNewProduct(newProduct2);
    await Future.delayed(const Duration(seconds: 2));
    const newProduct3 = Product(name: "Perro 3", price: 1200, description: "description", url: "url");
    productBloc.addNewProduct(newProduct3);
  }

   @override
  Widget build(BuildContext context) {

  ScrollController scrollController = ScrollController();
  

    final productBloc = Injector.of(context).productBloc;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const Text(
                "Lista de Productos",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              StreamBuilder<List<Product>>(
                stream: productBloc.productsStream,
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.data!.isNotEmpty) {
                    return  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardProduct(
                          product: snapshot.data![index]
                        );
                      },

                    );
                  }else{
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.buttonPrimaryColor,
          child: const Icon(Icons.add),
          onPressed: (){

          }
        ),
      ),
    );
  }
}