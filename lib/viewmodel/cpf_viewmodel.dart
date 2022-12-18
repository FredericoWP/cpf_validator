import 'package:cpf_validator/models/cpf_models.dart';
import 'package:flutter/material.dart';

class CPFViewModel extends ChangeNotifier {
  final cpf = TextEditingController();
  String? result;

  void checkCPF() {
    final cpfModel = CPFModel(cpf: cpf.text);
    result = cpfModel.checkDigits();
    notifyListeners();
  }

  clean() {
    cpf.text = '';
    result = null;
    notifyListeners();
  }

  Widget suffixIcon() {
    if (cpf.text.isNotEmpty) {
      return InkWell(
        onTap: () {
          result = '';
          cpf.text = '';
          notifyListeners();
        },
        child: const Icon(Icons.refresh),
      );
    }
    return const Icon(Icons.pin);
  }
}
