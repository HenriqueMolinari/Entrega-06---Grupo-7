class Leitura {
  //atributos
  int id;
  DateTime timestamp;
  double distancia_cm;
  double nivel_cm;
  double porcentagem;
  String status_tanque;
  bool display_piscando;

  //metodo construtor
  Leitura(
    this.id,
    this.timestamp,
    this.distancia_cm,
    this.nivel_cm,
    this.porcentagem,
    this.status_tanque,
    this.display_piscando,
  );

  //Metodo para inserir o ID
  void inserirId(int id) {
    this.id = id;
  }

  //Metodo para inserir o timestamp
  void inserirTimestamp(DateTime timestamp) {
    this.timestamp = timestamp;
  }

  //Metodo para inserir a distância
  void inserirDistancia(double distancia_cm) {
    this.distancia_cm = distancia_cm;
  }

  //Metodo para inserir o nível
  void inserirNivel(double nivel_cm) {
    this.nivel_cm = nivel_cm;
  }

  //Metodo para inserir a porcentagem
  void inserirPorcentagem(double porcentagem) {
    this.porcentagem = porcentagem;
  }

  //Metodo para inserir o status do tanque
  void inserirStatusTanque(String status_tanque) {
    this.status_tanque = status_tanque;
  }

  //Metodo para inserir o status do display
  void inserirDisplayPiscando(bool display_piscando) {
    this.display_piscando = display_piscando;
  }

  //Metodo para obter a distância
  double getDistancia() {
    return distancia_cm;
  }

  //Metodo para obter o nível
  double getNivel() {
    return nivel_cm;
  }

  //Metodo para obter a porcentagem
  double getPorcentagem() {
    return porcentagem;
  }

  //Metodo para obter o status do tanque
  String getStatusTanque() {
    return status_tanque;
  }

  //Metodo para verificar se o display está piscando
  bool isDisplayPiscando() {
    return display_piscando;
  }

  //Metodo para exibir os dados
  void exibirDados() {
    print('---- Dados da Leitura ---');
    print('ID: $id');
    print('Timestamp: ${timestamp.toString()}');
    print('Distância: ${distancia_cm.toStringAsFixed(2)} cm');
    print('Nível: ${nivel_cm.toStringAsFixed(2)} cm');
    print('Porcentagem: ${porcentagem.toStringAsFixed(1)}%');
    print('Status do Tanque: $status_tanque');
    print('Display Piscando: $display_piscando');
  }

  //Metodo para formatar dados como string
  String formatarDados() {
    return 'Leitura $id - ${timestamp.toString()} - Nível: ${nivel_cm.toStringAsFixed(1)}cm ($porcentagem%) - Status: $status_tanque';
  }
}
