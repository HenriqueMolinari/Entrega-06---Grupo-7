import 'dart:io';

void main() {
  print('=== PREENCHENDO ARQUIVOS VAZIOS ===');

  preencherEmpresa();
  preencherLocal();
  preencherLeitura();
  preencherSensor();
  preencherSensorCorrente();
  preencherPowerKeeper();

  print('\n✓ TODOS OS ARQUIVOS FORAM PREENCHIDOS!');
  print('Agora execute: dart run bin/main.dart');
}

void preencherEmpresa() {
  var content = '''
class Empresa {
  int id;
  String nome;
  String cnpj;

  Empresa({
    required this.id,
    required this.nome,
    required this.cnpj,
  });

  String getNome() {
    return nome;
  }

  String getCNPJ() {
    return cnpj;
  }
}
''';
  File('lib/Empresa.dart').writeAsStringSync(content);
  print('✓ Empresa.dart preenchido');
}

void preencherLocal() {
  var content = '''
class Local {
  int id;
  String nome;
  String endereco;

  Local({
    required this.id,
    required this.nome,
    required this.endereco,
  });

  String getNome() {
    return nome;
  }

  String getEndereco() {
    return endereco;
  }
}
''';
  File('lib/Local.dart').writeAsStringSync(content);
  print('✓ Local.dart preenchido');
}

void preencherLeitura() {
  var content = '''
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
''';
  File('lib/Leitura.dart').writeAsStringSync(content);
  print('✓ Leitura.dart preenchido');
}

void preencherSensor() {
  var content = '''
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
''';
  File('lib/Sensor.dart').writeAsStringSync(content);
  print('✓ Sensor.dart preenchido');
}

void preencherSensorCorrente() {
  var content = '''
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
''';
  File('lib/SensorCorrente.dart').writeAsStringSync(content);
  print('✓ SensorCorrente.dart preenchido');
}

void preencherPowerKeeper() {
  var content = '''
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
    print('PowerKeeper \$id: WiFi conectado');
  }

  void conectarFirebase() {
    statusFirebase = 'Conectado';
    print('PowerKeeper \$id: Firebase conectado');
  }

  void alternarTensao() {
    print('PowerKeeper \$id: Tensão alternada');
  }

  void atualizarLEDs() {
    print('PowerKeeper \$id: LEDs atualizados');
  }

  void enviarDadosFirebase() {
    if (statusFirebase == 'Conectado') {
      final leitura = sensor.coletarDado();
      print('PowerKeeper \$id: Dados enviados para Firebase - \${leitura.potencia}W');
    } else {
      print('PowerKeeper \$id: Firebase não conectado');
    }
  }

  Leitura coletarDados() {
    return sensor.coletarDado();
  }
}
''';
  File('lib/PowerKeeper.dart').writeAsStringSync(content);
  print('✓ PowerKeeper.dart preenchido');
}
