abstract class Sensor {
  //atributos
  int id;
  String tipo;
  String unidadeMedida;

  //metodo construtor
  Sensor(this.id, this.tipo, this.unidadeMedida);

  //Metodo para inserir o ID
  void inserirId(int id) {
    this.id = id;
  }

  //Metodo para inserir o tipo
  void inserirTipo(String tipo) {
    this.tipo = tipo;
  }

  //Metodo para inserir a unidade de medida
  void inserirUnidadeMedida(String unidadeMedida) {
    this.unidadeMedida = unidadeMedida;
  }

  //Metodo abstrato para coletar dado - deve ser implementado nas subclasses
  double coletarDado();

  //Metodo para obter o tipo
  String getTipo() {
    return tipo;
  }

  //Metodo para obter a unidade de medida
  String getUnidadeMedida() {
    return unidadeMedida;
  }

  //Metodo para exibir os dados
  void exibirDados() {
    print('---- Dados do Sensor ---');
    print('ID: $id');
    print('Tipo: $tipo');
    print('Unidade de Medida: $unidadeMedida');
  }
}
