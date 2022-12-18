import 'package:cpf_validator/views/mvc_page.dart';
import 'package:cpf_validator/views/mvp_page.dart';
import 'package:cpf_validator/views/mvvm_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  int indexPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  _onSelect(int value) {
    setState(() {
      indexPage = value;
      pageController.jumpToPage(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Playground",
              style: TextStyle(fontSize: 12),
            ),
            Text("Design Patterns"),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onSelect,
        children: const [
          MVCPage(),
          MVPPage(),
          MVVMPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: indexPage,
          onDestinationSelected: _onSelect,
          backgroundColor: Colors.grey[50],
          elevation: 1,
          destinations: const [
            NavigationDestination(icon: Text("MVC"), label: ""),
            NavigationDestination(icon: Text("MVP"), label: ""),
            NavigationDestination(icon: Text("MVVM"), label: "")
          ]),
    );
  }
}
