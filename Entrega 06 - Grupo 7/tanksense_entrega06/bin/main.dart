import 'package:tanksense_entrega06/Empresa.dart' as tanksense_entrega06;
import 'dart:io';

// Para rodar coloque o código abaixo no terminal:
// cd bin
// dart run main.dart

class Empresa {
  int id;
  String nome;
  String cnpj;
  Empresa(this.id, this.nome, this.cnpj);
  void inserirId(int id) {
    this.id = id;
  }

  void inserirNome(String nome) {
    this.nome = nome;
  }

  void inserirCNPJ(String cnpj) {
    this.cnpj = cnpj;
  }

  void exibirDados() {
    print('---- Dados da Empresa ---');
    print('ID: $id');
    print('Nome: $nome');
    print('CNPJ: $cnpj');
  }
}

class Local {
  int id;
  String nome;
  String endereco;
  Local(this.id, this.nome, this.endereco);
  void inserirId(int id) {
    this.id = id;
  }

  void inserirNome(String nome) {
    this.nome = nome;
  }

  void inserirEndereco(String endereco) {
    this.endereco = endereco;
  }

  String getNome() {
    return nome;
  }

  String getEndereco() {
    return endereco;
  }

  void exibirDados() {
    print('---- Dados do Local ---');
    print('ID: $id');
    print('Nome: $nome');
    print('Endereço: $endereco');
  }
}

class Tanque {
  int id;
  double altura;
  double volumeMax;
  double volumeAtual;
  Tanque(this.id, this.altura, this.volumeMax, this.volumeAtual);
  void inserirId(int id) {
    this.id = id;
  }

  void inserirAltura(double altura) {
    this.altura = altura;
  }

  void inserirVolumeMax(double volumeMax) {
    this.volumeMax = volumeMax;
  }

  void inserirVolumeAtual(double volumeAtual) {
    this.volumeAtual = volumeAtual;
  }

  double calcularVolumeAtual(double nivel) {
    double areaBase = volumeMax / altura;
    volumeAtual = areaBase * nivel;
    if (volumeAtual > volumeMax) {
      volumeAtual = volumeMax;
    }
    return volumeAtual;
  }

  double getVolumeAtual() {
    return volumeAtual;
  }

  void exibirDados() {
    print('---- Dados do Tanque ---');
    print('ID: $id');
    print('Altura: $altura m');
    print('Volume Máximo: $volumeMax m³');
    print('Volume Atual: $volumeAtual m³');
    print('Capacidade: ${(volumeAtual / volumeMax * 100).toStringAsFixed(1)}%');
  }
}

class Dispositivo {
  int id;
  String modelo;
  String status;
  Dispositivo(this.id, this.modelo, this.status);
  void inserirId(int id) {
    this.id = id;
  }

  void inserirModelo(String modelo) {
    this.modelo = modelo;
  }

  void inserirStatus(String status) {
    this.status = status;
  }

  void ativar() {
    status = 'Ativo';
    print('Dispositivo $modelo ativado');
  }

  void desativar() {
    status = 'Inativo';
    print('Dispositivo $modelo desativado');
  }

  String getStatus() {
    return status;
  }

  void exibirDados() {
    print('---- Dados do Dispositivo ---');
    print('ID: $id');
    print('Modelo: $modelo');
    print('Status: $status');
  }
}

abstract class Sensor {
  int id;
  String tipo;
  String unidadeMedida;
  Sensor(this.id, this.tipo, this.unidadeMedida);
  void inserirId(int id) {
    this.id = id;
  }

  void inserirTipo(String tipo) {
    this.tipo = tipo;
  }

  void inserirUnidadeMedida(String unidadeMedida) {
    this.unidadeMedida = unidadeMedida;
  }

  double coletarDado();
  String getTipo() {
    return tipo;
  }

  String getUnidadeMedida() {
    return unidadeMedida;
  }

  void exibirDados() {
    print('---- Dados do Sensor ---');
    print('ID: $id');
    print('Tipo: $tipo');
    print('Unidade de Medida: $unidadeMedida');
  }
}

class SensorUltrassonico extends Sensor {
  SensorUltrassonico(int id, String tipo, String unidadeMedida)
    : super(id, tipo, unidadeMedida);

  @override
  double coletarDado() {
    double distancia = 50.0 + (DateTime.now().millisecond % 350).toDouble();
    print('Coletando dado do sensor ultrassônico: $distancia $unidadeMedida');
    return distancia;
  }
}

class Leitura {
  int id;
  DateTime timestamp;
  double distancia_cm;
  double nivel_cm;
  double porcentagem;
  String status_tanque;
  bool display_piscando;
  Leitura(
    this.id,
    this.timestamp,
    this.distancia_cm,
    this.nivel_cm,
    this.porcentagem,
    this.status_tanque,
    this.display_piscando,
  );
  void inserirId(int id) {
    this.id = id;
  }

  void inserirTimestamp(DateTime timestamp) {
    this.timestamp = timestamp;
  }

  void inserirDistancia(double distancia_cm) {
    this.distancia_cm = distancia_cm;
  }

  void inserirNivel(double nivel_cm) {
    this.nivel_cm = nivel_cm;
  }

  void inserirPorcentagem(double porcentagem) {
    this.porcentagem = porcentagem;
  }

  void inserirStatusTanque(String status_tanque) {
    this.status_tanque = status_tanque;
  }

  void inserirDisplayPiscando(bool display_piscando) {
    this.display_piscando = display_piscando;
  }

  double getDistancia() {
    return distancia_cm;
  }

  double getNivel() {
    return nivel_cm;
  }

  double getPorcentagem() {
    return porcentagem;
  }

  String getStatusTanque() {
    return status_tanque;
  }

  bool isDisplayPiscando() {
    return display_piscando;
  }

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
}

class Producao {
  int id;
  double quantidade;
  DateTime timestamp;
  Producao(this.id, this.quantidade, this.timestamp);
  void inserirId(int id) {
    this.id = id;
  }

  void inserirQuantidade(double quantidade) {
    this.quantidade = quantidade;
  }

  void inserirTimestamp(DateTime timestamp) {
    this.timestamp = timestamp;
  }

  double getQuantidade() {
    return quantidade;
  }

  DateTime getTimestamp() {
    return timestamp;
  }

  void exibirDados() {
    print('---- Dados da Produção ---');
    print('ID: $id');
    print('Quantidade: $quantidade');
    print('Timestamp: ${timestamp.toString()}');
    print('Data Formatada: ${_formatarData(timestamp)}');
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year} ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
  }

  String formatarDados() {
    return 'Produção $id - ${_formatarData(timestamp)} - Quantidade: $quantidade';
  }
}

// Listas para armazenar os dados
List<Empresa> empresas = [];
List<Local> locais = [];
List<Tanque> tanques = [];
List<Dispositivo> dispositivos = [];
List<SensorUltrassonico> sensores = [];
List<Leitura> leituras = [];
List<Producao> producoes = [];

// Funções auxiliares
String _calcularStatusTanque(double nivel) {
  if (nivel >= 150) return "Cheio";
  if (nivel >= 50) return "Médio";
  return "Crítico";
}

String _formatarData(DateTime data) {
  return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year} ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
}

// Funções do Menu
void mostrarMenu() {
  print('\n=== SISTEMA DE MONITORAMENTO ===');
  print('1. Cadastrar Empresa');
  print('2. Cadastrar Local');
  print('3. Cadastrar Tanque');
  print('4. Cadastrar Dispositivo');
  print('5. Cadastrar Sensor');
  print('6. Registrar Leitura');
  print('7. Registrar Produção');
  print('8. Listar Todos os Dados');
  print('9. Simular Sistema');
  print('0. Sair');
  print('--------------------------------');
  stdout.write('Escolha uma opção: ');
}

void cadastrarEmpresa() {
  print('\n--- CADASTRAR EMPRESA ---');
  stdout.write('ID: ');
  int id = int.parse(stdin.readLineSync()!);
  stdout.write('Nome: ');
  String nome = stdin.readLineSync()!;
  stdout.write('CNPJ: ');
  String cnpj = stdin.readLineSync()!;

  empresas.add(Empresa(id, nome, cnpj));
  print('✅ Empresa cadastrada com sucesso!');
}

void cadastrarLocal() {
  print('\n--- CADASTRAR LOCAL ---');
  stdout.write('ID: ');
  int id = int.parse(stdin.readLineSync()!);
  stdout.write('Nome: ');
  String nome = stdin.readLineSync()!;
  stdout.write('Endereço: ');
  String endereco = stdin.readLineSync()!;

  locais.add(Local(id, nome, endereco));
  print('✅ Local cadastrado com sucesso!');
}

void cadastrarTanque() {
  print('\n--- CADASTRAR TANQUE ---');
  stdout.write('ID: ');
  int id = int.parse(stdin.readLineSync()!);
  stdout.write('Altura (metros): ');
  double altura = double.parse(stdin.readLineSync()!);
  stdout.write('Volume Máximo (m³): ');
  double volumeMax = double.parse(stdin.readLineSync()!);
  stdout.write('Volume Atual (m³): ');
  double volumeAtual = double.parse(stdin.readLineSync()!);

  tanques.add(Tanque(id, altura, volumeMax, volumeAtual));
  print('✅ Tanque cadastrado com sucesso!');
}

void cadastrarDispositivo() {
  print('\n--- CADASTRAR DISPOSITIVO ---');
  stdout.write('ID: ');
  int id = int.parse(stdin.readLineSync()!);
  stdout.write('Modelo: ');
  String modelo = stdin.readLineSync()!;
  stdout.write('Status (Ativo/Inativo): ');
  String status = stdin.readLineSync()!;

  dispositivos.add(Dispositivo(id, modelo, status));
  print('✅ Dispositivo cadastrado com sucesso!');
}

void cadastrarSensor() {
  print('\n--- CADASTRAR SENSOR ---');
  stdout.write('ID: ');
  int id = int.parse(stdin.readLineSync()!);
  stdout.write('Tipo: ');
  String tipo = stdin.readLineSync()!;
  stdout.write('Unidade de Medida: ');
  String unidadeMedida = stdin.readLineSync()!;

  sensores.add(SensorUltrassonico(id, tipo, unidadeMedida));
  print('✅ Sensor cadastrado com sucesso!');
}

void registrarLeitura() {
  print('\n--- REGISTRAR LEITURA ---');
  stdout.write('ID: ');
  int id = int.parse(stdin.readLineSync()!);

  DateTime timestamp = DateTime.now();

  stdout.write('Distância (cm): ');
  double distancia = double.parse(stdin.readLineSync()!);

  stdout.write('Nível (cm): ');
  double nivel = double.parse(stdin.readLineSync()!);

  stdout.write('Porcentagem (%): ');
  double porcentagem = double.parse(stdin.readLineSync()!);

  stdout.write('Status do Tanque (Cheio/Médio/Crítico): ');
  String status = stdin.readLineSync()!;

  stdout.write('Display Piscando (true/false): ');
  bool display = stdin.readLineSync()!.toLowerCase() == 'true';

  leituras.add(
    Leitura(id, timestamp, distancia, nivel, porcentagem, status, display),
  );
  print('✅ Leitura registrada com sucesso!');
}

void registrarProducao() {
  print('\n--- REGISTRAR PRODUÇÃO ---');
  stdout.write('ID: ');
  int id = int.parse(stdin.readLineSync()!);
  stdout.write('Quantidade: ');
  double quantidade = double.parse(stdin.readLineSync()!);

  DateTime timestamp = DateTime.now();

  producoes.add(Producao(id, quantidade, timestamp));
  print('✅ Produção registrada com sucesso!');
}

void listarTodosDados() {
  print('\n=== LISTAGEM COMPLETA ===');

  print('\n--- EMPRESAS ---');
  if (empresas.isEmpty) {
    print('Nenhuma empresa cadastrada');
  } else {
    for (var empresa in empresas) {
      empresa.exibirDados();
    }
  }

  print('\n--- LOCAIS ---');
  if (locais.isEmpty) {
    print('Nenhum local cadastrado');
  } else {
    for (var local in locais) {
      local.exibirDados();
    }
  }

  print('\n--- TANQUES ---');
  if (tanques.isEmpty) {
    print('Nenhum tanque cadastrado');
  } else {
    for (var tanque in tanques) {
      tanque.exibirDados();
    }
  }

  print('\n--- DISPOSITIVOS ---');
  if (dispositivos.isEmpty) {
    print('Nenhum dispositivo cadastrado');
  } else {
    for (var dispositivo in dispositivos) {
      dispositivo.exibirDados();
    }
  }

  print('\n--- SENSORES ---');
  if (sensores.isEmpty) {
    print('Nenhum sensor cadastrado');
  } else {
    for (var sensor in sensores) {
      sensor.exibirDados();
    }
  }

  print('\n--- LEITURAS ---');
  if (leituras.isEmpty) {
    print('Nenhuma leitura registrada');
  } else {
    for (var leitura in leituras) {
      leitura.exibirDados();
    }
  }

  print('\n--- PRODUÇÕES ---');
  if (producoes.isEmpty) {
    print('Nenhuma produção registrada');
  } else {
    for (var producao in producoes) {
      producao.exibirDados();
    }
  }
}

void simularSistema() {
  print('\n=== SIMULAÇÃO DO SISTEMA ===');

  if (tanques.isEmpty || sensores.isEmpty) {
    print(
      '⚠️  É necessário cadastrar pelo menos um tanque e um sensor para simular',
    );
    return;
  }

  print('Simulando 3 leituras automáticas...');

  for (int i = 1; i <= 3; i++) {
    print('\nLeitura $i:');

    // Usa o primeiro sensor cadastrado
    double distancia = sensores.first.coletarDado();
    double nivel = 200 - distancia;
    double porcentagem = (nivel / 200) * 100;

    var leitura = Leitura(
      leituras.length + 1,
      DateTime.now().add(Duration(seconds: i * 5)),
      distancia,
      nivel,
      porcentagem,
      _calcularStatusTanque(nivel),
      nivel < 30,
    );

    leituras.add(leitura);
    leitura.exibirDados();

    if (leitura.isDisplayPiscando()) {
      print('⚠️  ALERTA: Nível crítico detectado!');
    }
  }

  print('\n✅ Simulação concluída!');
}

// void main() por último
void main() {
  print('=== SISTEMA DE MONITORAMENTO DE TANQUES ===');

  bool executando = true;

  while (executando) {
    mostrarMenu();
    String opcao = stdin.readLineSync()!;

    switch (opcao) {
      case '1':
        cadastrarEmpresa();
        break;
      case '2':
        cadastrarLocal();
        break;
      case '3':
        cadastrarTanque();
        break;
      case '4':
        cadastrarDispositivo();
        break;
      case '5':
        cadastrarSensor();
        break;
      case '6':
        registrarLeitura();
        break;
      case '7':
        registrarProducao();
        break;
      case '8':
        listarTodosDados();
        break;
      case '9':
        simularSistema();
        break;
      case '0':
        executando = false;
        print('Saindo do sistema...');
        break;
      default:
        print('❌ Opção inválida!');
    }
  }

  print('=== SISTEMA ENCERRADO ===');
}
