import 'Leitura.dart';

abstract class Sensor {
  int id;
  String tipo;
  String unidadeMedida;

  Sensor({
    required this.id,
    required this.tipo,
    required this.unidadeMedida,
  });

  Leitura coletarDado();
}
