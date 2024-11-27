import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DISCRIPTION_ALTO_RISCO extends StatelessWidget {
  const DISCRIPTION_ALTO_RISCO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DESCRIÇÃO ALTO RISCO",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Fonte em negrito
            color: Colors.white, // Cor branca
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Cor de fundo escura
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Text(
              "GRANDE CONCENTRAÇÃO DE BOCAS DE FUMO, TRÁFICO DE DROGAS, DISPUTA DE TERRITORIO ENTRE GANGUES, TROCA DE TIROS, SEQUESTROS, ASSALTOS, BAIXA ILUMINAÇÃO",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center, // Título centralizado
            ),
            
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 0, 0), // Cor de fundo clara
    );
  }
}


/////////////////////////////////////////////////////IAPI/////////////////////////////////////////////////////

class DISCRIPTION_MEDIO_RISCO extends StatelessWidget {
  const DISCRIPTION_MEDIO_RISCO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " DESCRIÇÃO MEDIO RISCO",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Fonte em negrito
            color: Colors.white, // Cor branca
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Cor de fundo escura
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Text(
              "TRÁFICO DE DROGAS, MORADORES DE RUAS RAIVOSOS POR CONTA DO CONSUMO DE DROGAS, ASSALTOS, BAIXA ILUMINAÇÃO",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center, // Título centralizado
            ),
            
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 168, 86, 9), // Cor de fundo clara
    );
  }
}
 //////////////////////////////////////////////////////////////
 
 class DISCRIPTION_BAIXO_RISCO extends StatelessWidget {
  const DISCRIPTION_BAIXO_RISCO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DESCRIÇÃO BAIXO RISCO",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Fonte em negrito
            color: Colors.white, // Cor branca
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Cor de fundo escura
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Text(
              "TRÁFICO DE DROGAS, PROSTITUIÇÃO, BAIXA ILUMINAÇÃO",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center, // Título centralizado
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 207, 189, 29), // Cor de fundo clara
    );
  }
}