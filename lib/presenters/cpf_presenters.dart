// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/cpf_models.dart';

abstract class CPFView {
  void update();
}

class CPFPresenter {
  final CPFView view;
  final cpf = TextEditingController();
  String? result;

  CPFPresenter({
    required this.view,
  });

  void checkCPF() {
    final cpfModel = CPFModel(cpf: cpf.text);
    result = cpfModel.checkDigits();
    view.update();
  }

  onChange(String value) {
    view.update();
  }

  Widget suffixIcon() {
    if (cpf.text.isNotEmpty) {
      return InkWell(
        onTap: () {
          result = '';
          cpf.text = '';
          view.update();
        },
        child: const Icon(Icons.refresh),
      );
    }
    return const Icon(Icons.pin);
  }
}
