import 'package:quitanda/mia/model/item_modelo.dart';

import '../model/sacola_modelo.dart';

ItemModelo maca = ItemModelo(
  nome: 'Maçã',
  image:
      'https://trimais.vteximg.com.br/arquivos/ids/1042806-1000-1000/foto_original.jpg?v=638096377475430000',
  unidade: 'kg',
  preco: 2.30,
  descricao:
      'A maçã é o pseudofruto pomáceo da macieira, árvore da família Rosaceae. É um dos pseudofrutos de árvore mais cultivados, e o mais conhecido dos muitos membros do género Malus que são usados ​​pelos seres humanos',
);
ItemModelo uva = ItemModelo(
  nome: 'Uva',
  image:
      'https://superprix.vteximg.com.br/arquivos/ids/179168-600-600/Uva-Vitoria-Bandeja-773417.png?v=636970945188000000',
  unidade: 'cx',
  preco: 10.0,
  descricao:
      'A uva é o fruto da videira, uma planta da família das Vitaceae. É utilizada frequentemente para produzir sumo, doce, vinho e passas, podendo também ser consumida ao natural. Entre as espécies de videiras podemos referir: Vitis vinifera, o tipo de videira mais frequente na produção do vinho, na Europa;',
);
ItemModelo banana = ItemModelo(
  nome: 'Banana',
  image:
      'https://frutasbrasilsul.com.br/wp-content/uploads/banana-nanica-600x599.png',
  unidade: 'kg',
  preco: 4.50,
  descricao:
      'Banana, pacoba ou pacova é uma pseudobaga da bananeira, uma planta herbácea vivaz acaule da família Musaceae. São cultivadas em 130 países. Originárias do sudeste da Ásia são atualmente cultivadas em praticamente todas as regiões tropicais do planeta.',
);
ItemModelo abacaxi = ItemModelo(
  nome: 'Abacaxi',
  image:
      'https://muffatosupermercados.vteximg.com.br/arquivos/ids/277374-400-400/0000000100076.png?v=637372407875030000',
  unidade: 'un',
  preco: 2.30,
  descricao:
      'O ananás ou abacaxi é uma infrutescência tropical produzida pela planta de mesmo nome, caracterizada como uma planta monocotiledônea da família das bromeliáceas da subfamília Bromelioideae. É um símbolo das regiões tropicais e subtropicais.',
);
ItemModelo pera = ItemModelo(
  nome: 'Pera',
  image:
      'https://trimais.vteximg.com.br/arquivos/ids/1041412-1000-1000/foto_original.jpg?v=638052459170700000',
  unidade: 'kg',
  preco: 2.30,
  descricao:
      'Pêra é o fruto da pereira, árvore originária da Europa e da Ásia. A fruta é rica em magnésio, fósforo, selênio, fibras, vitaminas A, C e do complexo B.',
);
ItemModelo manga = ItemModelo(
  nome: 'Manga',
  image:
      'https://www.pngall.com/wp-content/uploads/2016/04/Mango-PNG-Picture.png',
  unidade: 'un',
  preco: 1.90,
  descricao:
      'A manga é uma das frutas mais consumidas no Brasil, por ser refrescante e por causa do clima Tropical do país. Também é atraente ao mercado internacional, ficando somente atrás da banana, do abacaxi e do abacate na exportação de frutas.',
);
ItemModelo morango = ItemModelo(
  nome: 'Morango',
  image:
      'https://www.pngplay.com/wp-content/uploads/1/Strawberry-PNG-Background.png',
  unidade: 'cx',
  preco: 9.00,
  descricao:
      'O morango é uma fruta carnosa e suculenta de coloração vermelha com sabor agridoce que chama muito a atenção, porém é um fruto muito delicado',
);
ItemModelo ameixa = ItemModelo(
  nome: 'Ameixa',
  image:
      'https://us-southeast-1.linodeobjects.com/storage/comercial-supermercado-genesio/media/uploads/produto/ameixa_rubimel_kg_38c292ff-8fab-4e1a-ace4-61450476934e.png',
  unidade: 'kg',
  preco: 15.00,
  descricao:
      'Uma ameixa é o fruto de polpa firme das variedades de Prunus domestica que têm um alto teor de sólidos solúveis e não fermentam durante a secagem',
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
  ameixa
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

List<SacolaModelo> sacolaCheia = [
  SacolaModelo(item: maca, quant: 3),
  SacolaModelo(item: abacaxi, quant: 4),
  SacolaModelo(item: morango, quant: 2),
  SacolaModelo(item: ameixa, quant: 1),
  SacolaModelo(item: manga, quant: 5),
  SacolaModelo(item: pera, quant: 3),
];
