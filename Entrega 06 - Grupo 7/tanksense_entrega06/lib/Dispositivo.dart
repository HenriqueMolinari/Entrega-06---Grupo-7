class Dispositivo {
  //atributos
  int id;
  String modelo;
  String status;

  //metodo construtor
  Dispositivo(this.id, this.modelo, this.status);

  //Metodo para inserir o ID
  void inserirId(int id) {
    this.id = id;
  }

  //Metodo para inserir o modelo
  void inserirModelo(String modelo) {
    this.modelo = modelo;
  }

  //Metodo para inserir o status
  void inserirStatus(String status) {
    this.status = status;
  }

  //Metodo para ativar o dispositivo
  void ativar() {
    status = 'Ativo';
    print('Dispositivo $modelo ativado');
  }

  //Metodo para desativar o dispositivo
  void desativar() {
    status = 'Inativo';
    print('Dispositivo $modelo desativado');
  }

  //Metodo para obter o status
  String getStatus() {
    return status;
  }

  //Metodo para exibir os dados
  void exibirDados() {
    print('---- Dados do Dispositivo ---');
    print('ID: $id');
    print('Modelo: $modelo');
    print('Status: $status');
  }
}
