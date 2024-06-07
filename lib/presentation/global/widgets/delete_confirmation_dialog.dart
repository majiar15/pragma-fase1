import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final Function onDeleteConfirmed;

  const DeleteConfirmationDialog({Key? key, required this.onDeleteConfirmed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Eliminar elemento'),
      content:
          const Text('¿Estás seguro de que deseas eliminar este elemento?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.buttonDisableColor;
              }
              return AppColors.buttonPrimaryColor;
            }),
          ),
          onPressed: () {
            onDeleteConfirmed();
            Navigator.of(context).pop();
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
