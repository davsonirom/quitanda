import 'package:flutter/material.dart';
import 'package:quitanda/mia/home/widgets/categoria_tile.dart';
import 'package:quitanda/mia/home/widgets/item_tile.dart';
import '../config/mocado_data.dart' as app_data;

import '../config/desing.dart';

class HomePageTab extends StatefulWidget {
  const HomePageTab({Key? key}) : super(key: key);

  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab> {
  String categoriaSelecionda = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              TextSpan(
                  text: 'Quitanda ',
                  style: TextStyle(color: Desing.corPrimariaComSwacth)),
              TextSpan(
                  text: 'Hatsune',
                  style: TextStyle(color: Desing.corContraste, fontSize: 20))
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 15.0),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: Desing.corContraste,
                label: const Text(
                  '4',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Desing.corPrimariaComSwacth,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Pesquisar...',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Desing.corContraste,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoriaTile(
                    onPressed: () {
                      setState(() {
                        categoriaSelecionda = app_data.categorias[index];
                      });
                    },
                    categoria: app_data.categorias[index],
                    selecionda:
                        app_data.categorias[index] == categoriaSelecionda,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount: app_data.categorias.length),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5),
                itemCount: app_data.itens.length,
                itemBuilder: (_, index) {
                  return ItemTile(item: app_data.itens[index]);
                }),
          ),
        ],
      ),
    );
  }
}
