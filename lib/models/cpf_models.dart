// ignore_for_file: public_member_api_docs, sort_constructors_first
class CPFModel {
  String cpf;

  CPFModel({
    required this.cpf,
  });

  checkDigits() {
    final nbrCpf = _onlyNumber(cpf);
    final dig1 = _calc1(nbrCpf);
    final dig2 = _calc2(nbrCpf);

    if ("$dig1$dig2" == nbrCpf.substring(9)) {
      return " O número de CPF: ${_cpfFormat(nbrCpf)} é válido!";
    } else {
      return " O número de CPF: ${_cpfFormat(nbrCpf)} não é válido!";
    }
  }

  String _onlyNumber(String cpf) {
    String validChars = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    return validChars.padLeft(11, '0');
  }

  _calc1(String cpf) {
    int ttSoma = 0;
    int result = 0;
    for (var i = 0; i < 9; i++) {
      ttSoma += int.parse(cpf[i]) * (10 - i);
    }
    result = ((ttSoma * 10) % 11);

    return result == 10 ? 0 : result;
  }

  _calc2(String cpf) {
    int ttSoma = 0;
    int result = 0;
    for (var i = 0; i < 10; i++) {
      ttSoma += int.parse(cpf[i]) * (11 - i);
    }
    result = ((ttSoma * 10) % 11);

    return result == 10 ? 0 : result;
  }

  String _cpfFormat(String nbrCPF) {
    return "${nbrCPF.substring(0, 3)}.${nbrCPF.substring(3, 6)}.${nbrCPF.substring(6, 9)}-${nbrCPF.substring(9)}";
  }
}
