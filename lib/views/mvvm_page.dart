import 'package:cpf_validator/viewmodel/cpf_viewmodel.dart';
import 'package:flutter/material.dart';

class MVVMPage extends StatefulWidget {
  const MVVMPage({super.key});

  @override
  State<MVVMPage> createState() => _MVVMPageState();
}

class _MVVMPageState extends State<MVVMPage> {
  final viewModel = CPFViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.addListener(() => setState(() {}));
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
                "M.V.VM",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              controller: viewModel.cpf,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Nº CPF',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: viewModel.suffixIcon(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () => viewModel.checkCPF(),
                child: const Text("Verificar CPF"),
              ),
            ),
            Text(viewModel.result ?? ''),
          ],
        ),
      ),
    );
  }
}
