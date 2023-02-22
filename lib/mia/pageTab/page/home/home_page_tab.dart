import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/mia/config/utilidades.dart';
import 'package:quitanda/mia/pageTab/page/home/widgets/categoria_tile.dart';
import 'package:quitanda/mia/pageTab/page/home/widgets/item_tile.dart';
import 'package:quitanda/mia/pageTab/page/sacola/sacola_page_tab.dart';
import 'package:shimmer/shimmer.dart';

import '../../../config/mocado_data.dart' as app_data;

import '../../../config/desing.dart';

class HomePageTab extends StatefulWidget {
  const HomePageTab({Key? key}) : super(key: key);

  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab> {
  String categoriaSelecionda = 'Frutas';
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = 0;

  final Utilidades utilidades = Utilidades();

  void itemSelectCartAnimations(GlobalKey gkImage) async {
    await runAddToCartAnimation(gkImage);
    ++_cartQuantityItems;
    cartKey.currentState!.runCartAnimation(_cartQuantityItems.toString());
    utilidades.exibirToast('Item colocado na sacola!!');
  }

  bool carregando = true;

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
          IconButton(
            icon: Icon(
              Icons.cleaning_services,
              color: Desing.corContraste,
            ),
            onPressed: () {
              _cartQuantityItems = 0;
              cartKey.currentState!.runClearCartAnimation();
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SacolaPageTab();
              }));
            },
            child: SizedBox(
              width: 50,
              child: AddToCartIcon(
                key: cartKey,
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Desing.corPrimariaComSwacth,
                ),
                badgeOptions: BadgeOptions(
                  active: true,
                  backgroundColor: Desing.corContraste,
                ),
              ),
            ),
          ),
        ],
      ),
      body: AddToCartAnimation(
        cartKey: cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(
          rotation: false,
        ),
        jumpAnimation: const JumpAnimationOptions(),
        createAddToCartAnimation: (runAddToCartAnimation) {
          this.runAddToCartAnimation = runAddToCartAnimation;
        },
        child: Column(
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
              child: carregando
                  ? GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                      ),
                      itemCount: app_data.itens.length,
                      itemBuilder: (_, index) {
                        return ItemTile(
                          item: app_data.itens[index],
                          cartAnimationMethod: itemSelectCartAnimations,
                        );
                      },
                    )
                  : Shimmer.fromColors(
                      baseColor: Desing.corPrimariaComSwacth.shade100,
                      highlightColor: Desing.corContraste.withAlpha(30),
                      child: GridView.count(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                        children: List.generate(
                          10,
                          (index) => Card(
                              elevation: 2,
                              color: Colors.white.withAlpha(245),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                height: 200,
                                width: 100,
                              )),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
