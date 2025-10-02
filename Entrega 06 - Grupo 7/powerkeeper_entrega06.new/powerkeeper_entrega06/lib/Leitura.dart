class Leitura {
  int id;
  DateTime timestamp;
  int tensao;
  double corrente;
  double potencia;
  double energia_Wh;
  double custo;

  Leitura({
    required this.id,
    required this.timestamp,
    required this.tensao,
    required this.corrente,
    required this.potencia,
    required this.energia_Wh,
    required this.custo,
  });

  double getPotencia() {
    return potencia;
  }

  double getEnergia() {
    return energia_Wh;
  }

  double getCusto() {
    return custo;
  }
}
