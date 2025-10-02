import 'SensorCorrente.dart';
import 'Leitura.dart';

class PowerKeeper {
  int id;
  String modelo;
  String statusWiFi;
  String statusFirebase;
  final SensorCorrente sensor;

  PowerKeeper({
    required this.id,
    required this.modelo,
    this.statusWiFi = 'Desconectado',
    this.statusFirebase = 'Desconectado',
    required this.sensor,
  });

  void conectarWiFi() {
    statusWiFi = 'Conectado';
    print('PowerKeeper $id: WiFi conectado');
  }

  void conectarFirebase() {
    statusFirebase = 'Conectado';
    print('PowerKeeper $id: Firebase conectado');
  }

  void alternarTensao() {
    print('PowerKeeper $id: Tensão alternada');
  }

  void atualizarLEDs() {
    print('PowerKeeper $id: LEDs atualizados');
  }

  void enviarDadosFirebase() {
    if (statusFirebase == 'Conectado') {
      final leitura = sensor.coletarDado();
      print('PowerKeeper $id: Dados enviados para Firebase - ${leitura.potencia}W');
    } else {
      print('PowerKeeper $id: Firebase não conectado');
    }
  }

  Leitura coletarDados() {
    return sensor.coletarDado();
  }
}
