import 'package:cpf_validator/models/cpf_models.dart';
import 'package:flutter/material.dart';

class CPFController {
  TextEditingController cpf = TextEditingController();

  String CheckCPF() {
    final cpfModel = CPFModel(cpf: cpf.text);
    return cpfModel.checkDigits();
  }

  Widget suffixIcon() {
    if (cpf.text.isNotEmpty) {
      return const Icon(Icons.refresh);
    }
    return const Icon(Icons.pin);
  }
}
