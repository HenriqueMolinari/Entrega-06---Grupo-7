class Tanque {
  //atributos
  int id;
  double altura;
  double volumeMax;
  double volumeAtual;

  //metodo construtor
  Tanque(this.id, this.altura, this.volumeMax, this.volumeAtual);

  //Metodo para inserir o ID
  void inserirId(int id) {
    this.id = id;
  }

  //Metodo para inserir a altura
  void inserirAltura(double altura) {
    this.altura = altura;
  }

  //Metodo para inserir o volume máximo
  void inserirVolumeMax(double volumeMax) {
    this.volumeMax = volumeMax;
  }

  //Metodo para inserir o volume atual
  void inserirVolumeAtual(double volumeAtual) {
    this.volumeAtual = volumeAtual;
  }

  //Metodo para calcular o volume atual baseado no nível
  double calcularVolumeAtual(double nivel) {
    // Considerando que o tanque é cilíndrico e o nível está em metros
    // Volume = área da base × nível
    // Área da base = volumeMax / altura
    double areaBase = volumeMax / altura;
    volumeAtual = areaBase * nivel;

    // Garantir que o volume atual não ultrapasse o volume máximo
    if (volumeAtual > volumeMax) {
      volumeAtual = volumeMax;
    }

    return volumeAtual;
  }

  //Metodo para obter o volume atual
  double getVolumeAtual() {
    return volumeAtual;
  }

  //Metodo para exibir os dados
  void exibirDados() {
    print('---- Dados do Tanque ---');
    print('ID: $id');
    print('Altura: $altura m');
    print('Volume Máximo: $volumeMax m³');
    print('Volume Atual: $volumeAtual m³');
    print('Capacidade: ${(volumeAtual / volumeMax * 100).toStringAsFixed(1)}%');
  }
}
