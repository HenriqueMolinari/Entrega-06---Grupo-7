import 'Sensor.dart';
import 'Leitura.dart';

class SensorCorrente extends Sensor {
  SensorCorrente({
    required int id,
    String tipo = 'Corrente',
    String unidadeMedida = 'A',
  }) : super(
          id: id,
          tipo: tipo,
          unidadeMedida: unidadeMedida,
        );

  @override
  Leitura coletarDado() {
    final agora = DateTime.now();
    
    final tensao = 220;
    final corrente = _simularLeituraCorrente();
    final potencia = tensao * corrente;
    final energia = potencia * 0.001;
    final custo = energia * 0.75 / 1000;

    return Leitura(
      id: DateTime.now().millisecondsSinceEpoch,
      timestamp: agora,
      tensao: tensao,
      corrente: corrente,
      potencia: potencia,
      energia_Wh: energia,
      custo: custo,
    );
  }

  double _simularLeituraCorrente() {
    return (0.1 + (DateTime.now().millisecond % 150) / 10).toDouble();
  }
}
