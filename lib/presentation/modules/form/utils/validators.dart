String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor ingrese el nombre del producto';
  }
  return null;
}

String? validatePrice(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor ingrese el precio del producto';
  }
  if (double.tryParse(value) == null) {
    return 'Ingrese un valor numérico válido';
  }
  return null;
}

String? validateImageUrl(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor ingrese la URL de la imagen del producto';
  }
  if (!Uri.parse(value).isAbsolute) {
    return 'Por favor ingrese una URL válida';
  }
  return null;
}

String? validateDescription(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor ingrese la descripción del producto';
  }
  return null;
}
