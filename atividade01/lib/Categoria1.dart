import 'package:flutter/material.dart';

class Categoria1 extends StatefulWidget {
  const Categoria1({super.key});

  @override
  State<StatefulWidget> createState() {
    return Estrutura();
  }
}

class Estrutura extends State<Categoria1> {
  List<int> hoveredIndices =
      List<int>.generate(imagensComDescricoes.length, (index) => -1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200.0,
        backgroundColor: Colors.grey[100],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, usuário',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'O que está procurando hoje?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Digite aqui para buscar',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/imagens.jpeg',
                width: 200.0,
                height: 100.0,
              ),
            ),
            Container(
              color: Colors.grey[400],
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                alignment: WrapAlignment.center,
                children: List.generate(imagensComDescricoes.length, (index) {
                  return buildImageCard(
                    imagensComDescricoes[index][0], // Primeiro item é a imagem
                    imagensComDescricoes[index]
                        [1], // Segundo item é a descrição
                    index,
                  );
                }),
              ),
            ),
            SizedBox(height: 100.0), // Espaço extra para permitir a rolagem
          ],
        ),
      ),
    );
  }

  Widget buildImageCard(String imagem, String descricao, int index) {
    return Card(
      elevation: hoveredIndices[index] != -1 ? 8.0 : 2.0,
      child: SizedBox(
        width: 200.0,
        height: 300.0,
        child: Column(
          children: [
            MouseRegion(
              onEnter: (_) => setState(() => hoveredIndices[index] = index),
              onExit: (_) => setState(() => hoveredIndices[index] = -1),
              child: Image.asset(
                imagem,
                fit: BoxFit.contain,
                width: 100.0,
                height: 150.0,
              ),
            ),
            SizedBox(height: 10),
            Text(
              descricao,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // adicionarAoCarrinho(produto);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                side: BorderSide(color: Colors.pink, width: 2.0),
              ),
              child: Text('Adicionar ao Carrinho'),
            ),
          ],
        ),
      ),
    );
  }
}

List<List<String>> imagensComDescricoes = [
  ['imagens/produto1.jpeg', 'Descrição do Produto 1'],
  ['imagens/mikrotik01.jpeg', 'Descrição do Mikrotik 01'],
  ['imagens/mikrotik02.jpeg', 'Descrição do Mikrotik 02'],
  ['imagens/mini.jpeg', 'Descrição do Mini 1'],
  ['imagens/mini01.jpeg', 'Descrição do Mini 01'],
  ['imagens/mini02.jpeg', 'Descrição do Mini 02'],
  ['imagens/repetidor.jpeg', 'Descrição do Repetidor'],
  ['imagens/repetidor01.jpeg', 'Descrição do Repetidor 01'],
  ['imagens/repetidor02.jpeg', 'Descrição do Repetidor 02'],
  ['imagens/switch.jpeg', 'Descrição do Switch'],
  ['imagens/switch01.jpeg', 'Descrição do Switch 01'],
  ['imagens/switch02.jpeg', 'Descrição do Switch 02'],
  ['imagens/usb.jpeg', 'Descrição do USB'],
  ['imagens/usb01.jpeg', 'Descrição do USB 01'],
  ['imagens/usb02.jpeg', 'Descrição do USB 02'],
];
List<List<String>> descricoes = [
  [
    'Roteador Mikrotik Hex Router Board RB750GR3 R\$439,00',
    'Mikrotik Rb450g Routerboard R\$696,00',
    'Access Point - Mikrotik RB941-2n R\$209,21'
  ],
  [
    'Mini Adaptador Wifi Nano 2.4 Ghz R\$24,90',
    'Adaptador USB wireless dual band R\$149,48',
    'Adaptador Wireless 300MBPS R\$68,90'
  ],
  [
    'D-Link Repetidor Wireless R\$149,81',
    'Homesen Amplif sinal WiFi 300M R\$62,00',
    'Repetidor TP-Link Wire 300Mbps R\$ 123,41'
  ],
  [
    'TP-Link TL-SG108 Switch Ggbit 8 P R\$360,28',
    'Switch TP-Link 5 Portas TL- R\$85,41',
    'Switch TP-Link 8 Portas, Gigabit, 2 R\$768,90'
  ],
  [
    'Extensões Mini Hub USB, Expansor R\$28,00',
    'Hub Usb 7 Portas 2.0 Hd Extensor R\$29,90',
    'Bright HUB USB 4 PORTAS 3.0 R\$55,30'
  ],
];
