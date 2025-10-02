import 'dart:io';
import 'package:powerkeeper_entrega06/Empresa.dart';
import 'package:powerkeeper_entrega06/Local.dart';
import 'package:powerkeeper_entrega06/PowerKeeper.dart';
import 'package:powerkeeper_entrega06/SensorCorrente.dart';
import 'package:powerkeeper_entrega06/Leitura.dart';

void main() {
  print('''
╔═══════════════════════╗
║     🔋 POWER KEEPER   ║
╚═══════════════════════╝
  ''');
  menuPrincipal();
}

void menuPrincipal() {
  List<Empresa> empresas = [];
  List<Local> locais = [];
  List<PowerKeeper> powerKeepers = [];
  List<Leitura> leituras = [];

  while (true) {
    print('\n' + '═' * 30);
    print('🔧 MENU PRINCIPAL');
    print('═' * 30);
    print('1. 🏢 Empresas (${empresas.length})');
    print('2. 🏠 Locais (${locais.length})');
    print('3. 🔌 PowerKeepers (${powerKeepers.length})');
    print('4. 📊 Coletar Dados');
    print('5. 📈 Ver Leituras');
    print('0. ❌ Sair');
    print('─' * 30);

    stdout.write('👉 Escolha: ');
    var opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        menuEmpresas(empresas);
        break;
      case '2':
        menuLocais(locais);
        break;
      case '3':
        menuPowerKeepers(powerKeepers);
        break;
      case '4':
        coletarDados(powerKeepers, leituras);
        break;
      case '5':
        verLeituras(leituras);
        break;
      case '0':
        print('\n👋 Até logo!');
        return;
      default:
        print('❌ Opção inválida!');
    }
  }
}

void menuEmpresas(List<Empresa> empresas) {
  while (true) {
    print('\n🏢 GERENCIAR EMPRESAS');
    print('─' * 25);
    print('1. ➕ Nova Empresa');
    print('2. 📋 Listar Empresas');
    print('3. ↩️ Voltar');

    stdout.write('👉 Escolha: ');
    var opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print('\n📝 Nova Empresa:');
        stdout.write('ID: ');
        var id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write('Nome: ');
        var nome = stdin.readLineSync() ?? '';
        stdout.write('CNPJ: ');
        var cnpj = stdin.readLineSync() ?? '';

        empresas.add(Empresa(id: id, nome: nome, cnpj: cnpj));
        print('✅ Empresa criada!');
        break;
      case '2':
        print('\n📋 Empresas:');
        if (empresas.isEmpty) {
          print('📭 Nenhuma empresa cadastrada');
        } else {
          empresas.forEach((empresa) {
            print(
                '${empresa.id} | ${empresa.getNome()} | ${empresa.getCNPJ()}');
          });
        }
        break;
      case '3':
        return;
      default:
        print('❌ Opção inválida!');
    }
  }
}

void menuLocais(List<Local> locais) {
  while (true) {
    print('\n🏠 GERENCIAR LOCAIS');
    print('─' * 25);
    print('1. ➕ Novo Local');
    print('2. 📋 Listar Locais');
    print('3. ↩️ Voltar');

    stdout.write('👉 Escolha: ');
    var opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print('\n📝 Novo Local:');
        stdout.write('ID: ');
        var id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write('Nome: ');
        var nome = stdin.readLineSync() ?? '';
        stdout.write('Endereço: ');
        var endereco = stdin.readLineSync() ?? '';

        locais.add(Local(id: id, nome: nome, endereco: endereco));
        print('✅ Local criado!');
        break;
      case '2':
        print('\n📋 Locais:');
        if (locais.isEmpty) {
          print('📭 Nenhum local cadastrado');
        } else {
          locais.forEach((local) {
            print('${local.id} | ${local.getNome()} | ${local.getEndereco()}');
          });
        }
        break;
      case '3':
        return;
      default:
        print('❌ Opção inválida!');
    }
  }
}

void menuPowerKeepers(List<PowerKeeper> powerKeepers) {
  while (true) {
    print('\n🔌 GERENCIAR POWER KEEPERS');
    print('─' * 25);
    print('1. ➕ Novo PowerKeeper');
    print('2. 📋 Listar PowerKeepers');
    print('3. 📶 Conectar WiFi');
    print('4. ☁️ Conectar Firebase');
    print('5. ↩️ Voltar');

    stdout.write('👉 Escolha: ');
    var opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print('\n📝 Novo PowerKeeper:');
        stdout.write('ID: ');
        var id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write('Modelo: ');
        var modelo = stdin.readLineSync() ?? '';

        var sensor = SensorCorrente(id: id);
        powerKeepers.add(PowerKeeper(id: id, modelo: modelo, sensor: sensor));
        print('✅ PowerKeeper criado!');
        break;
      case '2':
        print('\n📋 PowerKeepers:');
        if (powerKeepers.isEmpty) {
          print('📭 Nenhum PowerKeeper cadastrado');
        } else {
          powerKeepers.forEach((pk) {
            print(
                '${pk.id} | ${pk.modelo} | WiFi: ${pk.statusWiFi} | Firebase: ${pk.statusFirebase}');
          });
        }
        break;
      case '3':
        if (powerKeepers.isEmpty) {
          print('❌ Nenhum PowerKeeper cadastrado');
        } else {
          powerKeepers.first.conectarWiFi();
        }
        break;
      case '4':
        if (powerKeepers.isEmpty) {
          print('❌ Nenhum PowerKeeper cadastrado');
        } else {
          powerKeepers.first.conectarFirebase();
        }
        break;
      case '5':
        return;
      default:
        print('❌ Opção inválida!');
    }
  }
}

void coletarDados(List<PowerKeeper> powerKeepers, List<Leitura> leituras) {
  if (powerKeepers.isEmpty) {
    print('❌ Cadastre um PowerKeeper primeiro!');
    return;
  }

  print('\n⚡ COLETANDO DADOS...');
  var powerKeeper = powerKeepers.first;
  var leitura = powerKeeper.coletarDados();
  leituras.add(leitura);

  print('✅ Dados coletados:');
  print('   ⏰ ${leitura.timestamp}');
  print('   ⚡ ${leitura.getPotencia().toStringAsFixed(1)} W');
  print('   💰 R\$${leitura.getCusto().toStringAsFixed(4)}');

  if (powerKeeper.statusFirebase == 'Conectado') {
    powerKeeper.enviarDadosFirebase();
  }
}

void verLeituras(List<Leitura> leituras) {
  print('\n📈 ÚLTIMAS LEITURAS');
  print('─' * 40);

  if (leituras.isEmpty) {
    print('📭 Nenhuma leitura registrada');
  } else {
    for (var i = 0; i < leituras.length; i++) {
      var leitura = leituras[i];
      print('Leitura ${i + 1}:');
      print('   ⚡ ${leitura.getPotencia().toStringAsFixed(1)}W');
      print('   🔋 ${leitura.getEnergia().toStringAsFixed(1)}Wh');
      print('   💰 R\$${leitura.getCusto().toStringAsFixed(4)}');
      print('   ⏰ ${leitura.timestamp.hour}:${leitura.timestamp.minute}');
      if (i < leituras.length - 1) print('   ───────────────────');
    }
  }
}
