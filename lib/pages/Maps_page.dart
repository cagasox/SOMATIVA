import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para widgets e temas.
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Importa o Google Maps para Flutter.
import 'package:custom_info_window/custom_info_window.dart'; // Importa a biblioteca para janelas de informações personalizadas.
import 'package:ongmaps/pages/Descricacao_page.dart'; // Não se esqueça de importar as páginas de descrição.

class GoogleMapsFlutter extends StatefulWidget {
  const GoogleMapsFlutter({super.key}); // Construtor da classe GoogleMapsFlutter.

  @override
  State<GoogleMapsFlutter> createState() => _GoogleMapsFlutterState(); // Cria o estado para o widget.
}

class _GoogleMapsFlutterState extends State<GoogleMapsFlutter> {
  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController(); // Controlador da janela.
  Set<Marker> markers = {}; // Marcadores.

  final List<LatLng> latlongPoint = [
    const LatLng(-22.858249818019033, -47.04822860807837), // RISCO
    const LatLng(-22.900747199053033, -47.061201838471305), // MODERADO
    const LatLng(-22.901745780740747, -47.243443985235665),//RISCO
  ];

  final List<String> locationNames = ["ALTO RISCO", "MEDIO RICO", "BAIXO RISCO"];
  final List<Widget> locationDescriptions = [const DISCRIPTION_ALTO_RISCO(), const DISCRIPTION_MEDIO_RISCO(),const DISCRIPTION_BAIXO_RISCO() ]; // Atualização para usar widgets

  final List<String> locationImages = [
    "https://imgs.search.brave.com/A8nkOw435mldms797E3g6pWoiBQChH_jcQyHl02zuoQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y29sb3JoZXhhLmNv/bS9mZjI4MDAucG5n",
    "https://www.colorhexa.com/ffa856.png",
    "https://imgs.search.brave.com/aLcS9WbGiNe9M24Fbcg_RwgQ3vgjLzRrrLp62qDwQSk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y29sb3Jjb21ib3Mu/Y29tL2ltYWdlcy9j/b2xvcnMvaGV4L0ZG/RkYwMC5wbmc"
  ];

  @override
  void initState() {
    super.initState();
    displayInfo(); // Inicializa e exibe os marcadores com janelas de informações personalizadas.
  }

  void displayInfo() {
    for (int i = 0; i < latlongPoint.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: latlongPoint[i],
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              _buildInfoWindow(locationNames[i], locationImages[i], i),
              latlongPoint[i],
            );
          },
        ),
      );
    }
    setState(() {}); // Atualiza a interface.
  }

  // Função para construir a janela de informações com um botão
  Widget _buildInfoWindow(String name, String imageUrl, int index) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.network(
              imageUrl,
              height: 125,
              width: 250,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text(
                    'Erro ao carregar imagem',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Espaçamento entre o texto e o botão
                ElevatedButton(
                  onPressed: () {
                    // Use o índice para acessar a descrição correta
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => locationDescriptions[index]), // Navegar para a página correta
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Cor de fundo do botão
                    side: const BorderSide(color: Colors.black), // Cor da borda
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Bordas arredondadas
                    ),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.black), // Ícone da seta
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ATTC",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Fonte em negrito
            color: Colors.white, // Cor branca
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Cor de fundo escura e levemente transparente
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(-22.912847283240453, -47.041346547261014),
              zoom: 12,
            ),
            markers: markers,
            onTap: (LatLng position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 190,
            width: 250,
            offset: 35,
          ),
        ],
      ),
    );
  }
}
