import 'package:flutter/material.dart';
import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/home/home_page_tab.dart';

class BancaPage extends StatefulWidget {
  const BancaPage({Key? key}) : super(key: key);

  @override
  State<BancaPage> createState() => _BancaPageState();
}

class _BancaPageState extends State<BancaPage> {
  int pagina = 0;
  final trazerPagina = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: trazerPagina,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomePageTab(),
          Container(color: Colors.red),
          Container(color: Colors.purple),
          Container(color: Colors.blue),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: BottomNavigationBar(
          currentIndex: pagina,
          onTap: (index) {
            setState(() {
              pagina = index;
              trazerPagina.jumpToPage(pagina);
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Desing.corPrimariaComSwacth,
          selectedItemColor: Colors.white,
          unselectedItemColor: Desing.corContraste,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'Sacola'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Compras'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Perfil')
          ],
        ),
      ),
    );
  }
}
