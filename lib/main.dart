import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Aplicativo principal que inicia o app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Inicial do Nubank',
      home: HomeScreen(),
    );
  }
}

// Tela inicial do aplicativo
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obter as dimensões da tela para responsividade
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8A05BE), // Cor roxa sólida
        // Leading com fundo roxo claro e ícone de pessoa
        leading: Container(
          color: Color(0xFFBA4DE3), // Cor roxa mais clara em torno do leading
          child: IconButton(
            icon: Icon(Icons.person_outline),
            color: Color(0xFFF5F5F5), // Cor dos ícones do AppBar
            onPressed: () {},
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.visibility_outlined),
            color: Color(0xFFF5F5F5), // Cor dos ícones do AppBar
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.help_outline), // Ícone de ajuda
            color: Color(0xFFF5F5F5), // Cor dos ícones do AppBar
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.mail_outline), // Ícone de mensagem
            color: Color(0xFFF5F5F5), // Cor dos ícones do AppBar
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Margem de 16px em todas as direções
        child: ListView(
          children: [
            _buildAccountSection(),
            // Divisor com padding de 30px no topo e na parte inferior
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Divider(
                color: Colors.grey,
                height: 1,
              ),
            ),
            _buildCreditCardSection(),
            // Divisor com padding de 30px no topo e na parte inferior
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Divider(
                color: Colors.grey,
                height: 1,
              ),
            ),
            _buildLoanSection(),
            // Divisor com padding de 30px no topo e na parte inferior
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Divider(
                color: Colors.grey,
                height: 1,
              ),
            ),
            _buildDiscoverMoreSection(),
          ],
        ),
      ),
    );
  }

  // Simulação de carregamento assíncrono usando Future
  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 2));
  }

  // Seção de Saldo da Conta
  Widget _buildAccountSection() {
    return FutureBuilder(
      future: _loadData(), // Simulando o carregamento de dados
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Exibe um indicador de carregamento enquanto os dados são carregados
          return Center(child: CircularProgressIndicator());
        } else {
          // Exibição dos detalhes da conta após o carregamento
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Texto 'Conta'
              Text(
                'Conta',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Espaçamento de 10px entre 'Conta' e o saldo
              // Saldo da conta
              Text(
                'R\$1000,00',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30), // Espaçamento de 30px entre o saldo e os botões
              // Linha de ícones de ações relacionadas à conta
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconButton(Icons.send_outlined, 'Área Pix'), // Ícone para Pix
                  _buildIconButton(Icons.receipt_outlined, 'Pagamentos'), // Ícone para pagamentos
                  _buildIconButton(Icons.qr_code_outlined, 'QRCode'), // Ícone para QR Code
                  _buildIconButton(Icons.swap_horiz_outlined, 'Transferir'), // Ícone para transferência
                ],
              ),
            ],
          );
        }
      },
    );
  }

  // Seção do Cartão de Crédito
  Widget _buildCreditCardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Texto 'Cartão de Crédito'
        Text(
          'Cartão de Crédito',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 10), // Espaçamento de 10px
        // Texto 'Fatura Fechada'
        Text(
          'Fatura Fechada',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        SizedBox(height: 10), // Espaçamento de 10px
        // Valor da fatura
        Text(
          'R\$2.123,39',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 15), // Espaçamento de 15px
        // Texto 'Vencimento dia 15'
        Text(
          'Vencimento dia 15',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        SizedBox(height: 15), // Espaçamento de 15px
        // Botão 'Renegociar'
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF8A05BE), // Cor de fundo do botão
          ),
          child: Text(
            'Renegociar',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ],
    );
  }

  // Seção do Empréstimo
  Widget _buildLoanSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Texto 'Empréstimo'
        Text(
          'Empréstimo',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 10), // Espaçamento de 10px
        // Texto informativo sobre o empréstimo
        Text(
          'Tudo certo! Você está em dia',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  // Seção 'Descubra Mais'
  Widget _buildDiscoverMoreSection() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding interno do card
          Padding(
            padding: const EdgeInsets.all(10.0), // Padding de 10px em todas as direções
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Texto 'Seguro de Vida' com padding vertical de 5px
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Seguro de Vida',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Texto descritivo com padding vertical de 5px
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Cuide bem de quem você ama de um jeito simples',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ),
                // Espaçamento de 10px
                SizedBox(height: 10),
                // Botão 'Conhecer' com padding no bottom de 10px e top de 5px
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8A05BE), // Cor de fundo do botão
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 5),
                    child: Text(
                      'Conhecer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Imagem ilustrativa
          Image.asset('assets/images/seguro-de-vida-imagem.png'),
        ],
      ),
    );
  }

  // Método auxiliar para construir botões com ícones e textos
  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          color: Colors.black,
          iconSize: 32,
          onPressed: () {},
        ),
        SizedBox(height: 5), // Espaçamento de 5px
        Text(label),
      ],
    );
  }
}
