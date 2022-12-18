import 'package:cpf_validator/controllers/cpf_controller.dart';
import 'package:flutter/material.dart';

class MVCPage extends StatefulWidget {
  const MVCPage({super.key});

  @override
  State<MVCPage> createState() => _MVCPageState();
}

class _MVCPageState extends State<MVCPage> {
  final controller = CPFController();
  String? msgResult;

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
                "MVC",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              controller: controller.cpf,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Nº CPF',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        msgResult = '';
                        controller.cpf.text = '';
                      });
                    },
                    child: controller.suffixIcon()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    msgResult = controller.CheckCPF();
                  });
                },
                child: const Text("Verificar CPF"),
              ),
            ),
            Text(msgResult ?? ''),
          ],
        ),
      ),
    );
  }
}
