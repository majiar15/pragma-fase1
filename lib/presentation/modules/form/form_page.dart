import 'package:flutter/material.dart';

import './utils/validators.dart';
import '../../../domain/models/product.dart';
import '../../../main.dart';
import '../../global/colors/app_colors.dart';
import '../../global/widgets/appbar_custom.dart';
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;

  late TextEditingController _priceController;

  late TextEditingController _urlController;

  late TextEditingController _descriptionController;
  Product? product;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _urlController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)?.settings.arguments as Product?;

    final productBloc = Injector.of(context).productBloc;
    _nameController = TextEditingController(text: product?.name ?? '');
    _priceController =
        TextEditingController(text: product?.price.toString() ?? '');
    _urlController = TextEditingController(text: product?.url ?? '');
    _descriptionController =
        TextEditingController(text: product?.description ?? '');

    return Scaffold(
      appBar: appBarCustom(
        context: context,
        title: Text(product != null ? 'Editar Producto' : 'Agregar Producto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: validateName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: validatePrice,

              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _urlController,
                decoration: const InputDecoration(labelText: 'URL de la Imagen'),
                validator: validateImageUrl,

              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: validateDescription,
                maxLines: null,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return AppColors.buttonDisableColor; 
                    }
                    return AppColors.buttonPrimaryColor; // Color predeterminado del botón
                  }),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final editedProduct = Product(
                      id: product?.id,
                      name: _nameController.text,
                      price: double.parse(_priceController.text),
                      url: _urlController.text,
                      description: _descriptionController.text,
                    );
                    if (product != null) {
                      productBloc.updateExistingProduct(editedProduct);
                    } else {
                      productBloc.addNewProduct(editedProduct);
                    }
                    Navigator.pop(context, editedProduct);
                  }
                },
                child: Text(
                    product != null ? 'Guardar Cambios' : 'Agregar Producto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
