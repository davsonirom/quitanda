import 'package:quitanda/mia/modelos/item_modelo.dart';

ItemModelo maca = ItemModelo(
  nome: 'Maçã',
  image:
      'https://fenad.org.br/wp-content/uploads/2018/05/beneficios-da-maca.jpg',
  unidade: 'kg',
  preco: 2.30,
  descricao:
      'A maçã é o pseudofruto pomáceo da macieira, árvore da família Rosaceae. É um dos pseudofrutos de árvore mais cultivados, e o mais conhecido dos muitos membros do género Malus que são usados ​​pelos seres humanos',
);
ItemModelo uva = ItemModelo(
  nome: 'Uva',
  image:
      'https://hortifrutijardins.com.br/wp-content/uploads/2020/06/uva-niagara.jpg',
  unidade: 'cx',
  preco: 10.0,
  descricao:
      'A uva é o fruto da videira, uma planta da família das Vitaceae. É utilizada frequentemente para produzir sumo, doce, vinho e passas, podendo também ser consumida ao natural. Entre as espécies de videiras podemos referir: Vitis vinifera, o tipo de videira mais frequente na produção do vinho, na Europa;',
);
ItemModelo banana = ItemModelo(
  nome: 'Banana',
  image:
      'https://www.infoescola.com/wp-content/uploads/2010/04/banana_600797891-1000x670.jpg',
  unidade: 'kg',
  preco: 4.50,
  descricao:
      'Banana, pacoba ou pacova é uma pseudobaga da bananeira, uma planta herbácea vivaz acaule da família Musaceae. São cultivadas em 130 países. Originárias do sudeste da Ásia são atualmente cultivadas em praticamente todas as regiões tropicais do planeta.',
);
ItemModelo abacaxi = ItemModelo(
  nome: 'Abacaxi',
  image:
      'https://www.minicash.com.br/image/cache/catalog/img/produtos_2021/abacaxi-un-550x550.png',
  unidade: 'Un',
  preco: 2.30,
  descricao:
      'O ananás ou abacaxi é uma infrutescência tropical produzida pela planta de mesmo nome, caracterizada como uma planta monocotiledônea da família das bromeliáceas da subfamília Bromelioideae. É um símbolo das regiões tropicais e subtropicais.',
);
ItemModelo pera = ItemModelo(
  nome: 'Pera',
  image:
      'https://ibassets.com.br/ib.item.image.big/b-dbde4b5da4054c939c15c9b2fd1ef22c.png',
  unidade: 'kg',
  preco: 2.30,
  descricao:
      'Pêra é o fruto da pereira, árvore originária da Europa e da Ásia. A fruta é rica em magnésio, fósforo, selênio, fibras, vitaminas A, C e do complexo B.',
);
ItemModelo manga = ItemModelo(
  nome: 'Manga',
  image:
      'https://static.mundoeducacao.uol.com.br/mundoeducacao/2021/05/manga.jpg',
  unidade: 'Un',
  preco: 1.90,
  descricao:
      'A manga é uma das frutas mais consumidas no Brasil, por ser refrescante e por causa do clima Tropical do país. Também é atraente ao mercado internacional, ficando somente atrás da banana, do abacaxi e do abacate na exportação de frutas.',
);
ItemModelo morango = ItemModelo(
  nome: 'Morango',
  image:
      'https://portaldoorganico.com.br/wp-content/uploads/2021/04/morango.jpg',
  unidade: 'cx',
  preco: 9.00,
  descricao:
      'O morango é uma fruta carnosa e suculenta de coloração vermelha com sabor agridoce que chama muito a atenção, porém é um fruto muito delicado',
);

//! modelos das frutas
List<ItemModelo> itens = [
  maca,
  uva,
  banana,
  abacaxi,
  pera,
  manga,
  morango,
];

//! categorias
List<String> categorias = [
  'Frutas',
  'Verduras',
  'Legumes',
  'Carnes',
  'Cereais',
  'Laticínios',
];
