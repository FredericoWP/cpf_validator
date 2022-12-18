import 'package:cpf_validator/presenters/cpf_presenters.dart';
import 'package:flutter/material.dart';

class MVPPage extends StatefulWidget {
  const MVPPage({super.key});

  @override
  State<MVPPage> createState() => _MVPPageState();
}

class _MVPPageState extends State<MVPPage> implements CPFView {
  late CPFPresenter presenter;
  String? msgResult;

  @override
  void initState() {
    super.initState();
    presenter = CPFPresenter(view: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "MVP",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              controller: presenter.cpf,
              onChanged: presenter.onChange,
              decoration: InputDecoration(
                labelText: 'Nº CPF',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: presenter.suffixIcon(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  presenter.checkCPF();
                },
                child: const Text("Verificar CPF"),
              ),
            ),
            Text(presenter.result ?? ''),
          ],
        ),
      ),
    );
  }

  @override
  void update() {
    setState(() {});
  }
}
