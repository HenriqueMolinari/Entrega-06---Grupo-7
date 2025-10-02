# 🚀 Projetos Integradores - POO Aplicada

## 📋 Sobre os Projetos

Este repositório contém **dois sistemas completos** desenvolvidos como parte das atividades do **Projeto Integrador (PI)** sob orientação do **Prof. Nivaldo**, referente à entrega do dia 26/09/2025.

### 🔋 PowerKeeper - Sistema de Monitoramento Energético
Sistema de monitoramento energético que simula a coleta e análise de dados de consumo elétrico em tempo real.

### 🛢️ TankSense - Sistema de Monitoramento de Tanques  
Sistema para monitoramento e gerenciamento de tanques de armazenamento com controle de nível e volume.

---

# 🔋 PowerKeeper - Sistema de Monitoramento Energético

## 🎯 Objetivos da Entrega

### ✅ Requisitos Atendidos
- **Modelagem correta das classes** com atributos, construtores e métodos
- **Aplicação dos princípios de POO**: encapsulamento, herança e polimorfismo
- **Separação entre lógica de negócio e persistência de dados**
- **Uso adequado de classes abstratas e concretas**
- **Implementação de sistema modular e escalável**

## 🏗️ Arquitetura do Sistema

### 📁 Estrutura do Projeto
```
powerkeeper_entrega06/
├── bin/
│   └── main.dart              # Aplicação principal com menu interativo
├── lib/
│   ├── Empresa.dart           # Classe Empresa
│   ├── Local.dart             # Classe Local
│   ├── PowerKeeper.dart       # Classe PowerKeeper (dispositivo)
│   ├── Sensor.dart            # Classe abstrata Sensor
│   ├── SensorCorrente.dart    # Classe concreta SensorCorrente
│   └── Leitura.dart           # Classe Leitura (dados coletados)
├── pubspec.yaml               # Configurações do projeto Dart
└── README.md                  # Este arquivo
```

### 🧩 Diagrama de Classes
```
Empresa → Local → PowerKeeper → SensorCorrente → Leitura
                              ↑
Sensor (classe abstrata) ─────┘
```

## 🔧 Classes Implementadas

### 1. 🏢 **Empresa** (`lib/Empresa.dart`)
- **Atributos**: `id`, `nome`, `cnpj`
- **Métodos**: `getNome()`, `getCNPJ()`
- **Responsabilidade**: Representar empresas clientes do sistema

### 2. 🏠 **Local** (`lib/Local.dart`)
- **Atributos**: `id`, `nome`, `endereco`
- **Métodos**: `getNome()`, `getEndereco()`
- **Responsabilidade**: Representar locais de instalação dos dispositivos

### 3. 🔌 **PowerKeeper** (`lib/PowerKeeper.dart`)
- **Atributos**: `id`, `modelo`, `statusWiFi`, `statusFirebase`, `sensor`
- **Métodos**: `conectarWiFi()`, `conectarFirebase()`, `coletarDados()`, `enviarDadosFirebase()`
- **Responsabilidade**: Gerenciar o dispositivo de monitoramento

### 4. 📊 **Sensor** (`lib/Sensor.dart`) - **Classe Abstrata**
- **Atributos**: `id`, `tipo`, `unidadeMedida`
- **Método abstrato**: `coletarDado()`
- **Responsabilidade**: Definir interface comum para todos os sensores

### 5. ⚡ **SensorCorrente** (`lib/SensorCorrente.dart`) - **Classe Concreta**
- **Herda de**: `Sensor`
- **Método implementado**: `coletarDado()`
- **Responsabilidade**: Implementar coleta específica de dados de corrente elétrica
- **Aplicação de polimorfismo**: Sobrescreve método da classe abstrata

### 6. 📈 **Leitura** (`lib/Leitura.dart`)
- **Atributos**: `id`, `timestamp`, `tensao`, `corrente`, `potencia`, `energia_Wh`, `custo`
- **Métodos**: `getPotencia()`, `getEnergia()`, `getCusto()`
- **Responsabilidade**: Armazenar e calcular métricas energéticas

## 💻 Como Executar o PowerKeeper

### 🚀 **Pré-requisitos**
- Dart SDK instalado (versão 3.0.0 ou superior)
- Terminal/Command Prompt

### 📥 **Passos para Execução**

1. **Navegue até o diretório do projeto**:
   ```bash
   cd powerkeeper_entrega06
   ```

2. **Baixe as dependências**:
   ```bash
   dart pub get
   ```

3. **Execute a aplicação**:
   ```bash
   dart run bin/main.dart
   ```

### 🎮 **Uso do Sistema via Terminal**

Ao executar o comando `dart run bin/main.dart`, você terá acesso a um **menu interativo** no terminal:

```
╔═══════════════════════╗
║     🔋 POWER KEEPER   ║
╚═══════════════════════╝

══════════════════════════
🔧 MENU PRINCIPAL
══════════════════════════
1. 🏢 Empresas (0)
2. 🏠 Locais (0)
3. 🔌 PowerKeepers (0)
4. 📊 Coletar Dados
5. 📈 Ver Leituras
0. ❌ Sair
──────────────────────
👉 Escolha: 
```

### 🔄 **Fluxo de Uso Recomendado**

1. **Cadastre uma Empresa** (Opção 1)
2. **Cadastre um Local** (Opção 2) 
3. **Configure um PowerKeeper** (Opção 3)
4. **Conecte o PowerKeeper** (WiFi e Firebase)
5. **Colete dados** (Opção 4)
6. **Visualize as leituras** (Opção 5)

---

# 🛢️ TankSense - Sistema de Monitoramento de Tanques

## 🎯 Objetivo da Entrega
Sistema desenvolvido para monitoramento e gerenciamento de tanques de armazenamento, aplicando os princípios de Programação Orientada a Objetos.

## 🏗️ Arquitetura do Sistema

### 📁 Estrutura de Classes
```
tanksense/
├── lib/
│   ├── empresa.dart          # Classe Empresa
│   ├── local.dart            # Classe Local
│   ├── tanque.dart           # Classe Tanque
│   ├── dispositivo.dart      # Classe Dispositivo
│   ├── sensor.dart           # Classe Abstrata Sensor
│   ├── sensor_ultrassonico.dart # Sensor Ultrassônico
│   ├── leitura.dart          # Classe Leitura
│   └── producao.dart         # Classe Produção
├── bin/
│   └── main.dart             # Aplicação principal
└── pubspec.yaml              # Configuração do projeto
```

### 🧩 Diagrama de Classes Simplificado
```
Empresa → Local → Tanque → SensorUltrassonico → Leitura
    ↓
Produção
    ↓
Dispositivo
```

## 🔧 Classes Implementadas

### 1. **Empresa**
- **Atributos**: `id`, `nome`, `cnpj`
- **Métodos**: `getNome()`, `getCNPJ()`, `exibirDados()`

### 2. **Local**
- **Atributos**: `id`, `nome`, `endereco`
- **Métodos**: `getNome()`, `getEndereco()`, `exibirDados()`

### 3. **Tanque**
- **Atributos**: `id`, `altura`, `volumeMax`, `volumeAtual`
- **Métodos**: `calcularVolumeAtual()`, `getVolumeAtual()`, `exibirDados()`

### 4. **Dispositivo**
- **Atributos**: `id`, `modelo`, `status`
- **Métodos**: `ativar()`, `desativar()`, `getStatus()`, `exibirDados()`

### 5. **Sensor** (Classe Abstrata)
- **Atributos**: `id`, `tipo`, `unidadeMedida`
- **Métodos**: `coletarDado() [abstrato]`, `exibirDados()`

### 6. **SensorUltrassonico**
- **Herda de**: `Sensor`
- **Métodos**: `coletarDado() [sobrescrito]`

### 7. **Leitura**
- **Atributos**: `id`, `timestamp`, `distancia_cm`, `nivel_cm`, `porcentagem`, `status_tanque`, `display_piscando`
- **Métodos**: `getDistancia()`, `getNivel()`, `getPorcentagem()`, `getStatusTanque()`, `isDisplayPiscando()`

### 8. **Produção**
- **Atributos**: `id`, `quantidade`, `timestamp`
- **Métodos**: `getQuantidade()`, `getTimestamp()`, `exibirDados()`

## 🚀 Como Executar o TankSense

### 📥 **Passos para Execução**

1. **Navegue até o diretório do projeto**:
   ```bash
   cd tanksense
   ```

2. **Restaura as dependências**:
   ```bash
   dart pub get
   ```

3. **Execute a aplicação**:
   ```bash
   dart run bin/main.dart
   ```

### 🖥️ **Uso do Terminal**

Ao executar o programa, você terá acesso a um menu interativo:

```
=== SISTEMA DE MONITORAMENTO DE TANQUES ===

1. Cadastrar Empresa
2. Cadastrar Local  
3. Cadastrar Tanque
4. Cadastrar Dispositivo
5. Cadastrar Sensor Ultrassônico
6. Registrar Leitura
7. Registrar Produção
8. Listar Todos os Dados
9. Simular Sistema
0. Sair
--------------------------------
Escolha uma opção:
```

### 📝 **Fluxo de Uso Recomendado**

1. Cadastre primeiro a **Empresa** e **Local**
2. Configure o **Tanque** com suas especificações
3. Adicione **Dispositivos** e **Sensores**
4. Registre **Leituras** do sensor ultrassônico
5. Monitore a **Produção**
6. Use a **simulação** para testar o sistema

---

# 🎯 Princípios de POO Aplicados em Ambos os Projetos

## 1. ✅ **Encapsulamento**
- Atributos privados com métodos getters e setters
- Controle de acesso aos dados internos das classes
- Métodos específicos para operações

## 2. ✅ **Herança**
- Classes abstratas como base (`Sensor`)
- Classes concretas herdam e especializam comportamento
- Reutilização de código e estrutura comum

## 3. ✅ **Polimorfismo**
- Métodos sobrescritos nas subclasses
- Interface comum para diferentes tipos de sensores
- Flexibilidade para extensão futura

## 4. ✅ **Abstração**
- Classes como contratos abstratos
- Separação entre interface e implementação
- Foco no essencial de cada entidade

## 5. ✅ **Separação de Responsabilidades**
- **Lógica de negócio**: Cálculos, regras e validações
- **Persistência**: Armazenamento em estruturas de dados
- **Apresentação**: Interface de usuário via terminal
- **Domínio**: Entidades do negócio bem definidas

---

# 🔧 Funcionalidades dos Sistemas

## 🔋 **PowerKeeper - Funcionalidades**
- ✅ Monitoramento de consumo energético em tempo real
- ✅ Cálculos automáticos de potência, energia e custos
- ✅ Simulação de conexão com serviços (WiFi, Firebase)
- ✅ Histórico de leituras com timestamps
- ✅ Gestão completa de empresas, locais e dispositivos

## 🛢️ **TankSense - Funcionalidades**
- ✅ Monitoramento em tempo real de nível dos tanques
- ✅ Cálculo automático de volume e porcentagem
- ✅ Alertas visuais quando o nível está crítico
- ✅ Gestão de múltiplos tanques e locais
- ✅ Histórico de leituras e produções
- ✅ Simulação de cenários realistas

---

# 🎓 Competências Demonstradas

## ✅ **Aspectos Técnicos**
- Modelagem correta de classes
- Aplicação de construtores adequados
- Uso de métodos e atributos coerentes
- Implementação de polimorfismo e herança
- Encapsulamento adequado

## ✅ **Arquitetura e Organização**
- Separação entre lógica e persistência
- Desenvolvimento de interface amigável
- Documentação clara do código
- Estrutura modular e escalável
- Preparação para integrações futuras

## ✅ **Aderência aos Requisitos**
- Entrega do código-fonte das classes modeladas
- Uso adequado de construtores, métodos e atributos
- Aplicação correta dos princípios da POO
- Separação entre lógica de negócio e persistência
- Sistema funcional e testável

---

# 🔮 Possíveis Melhorias Futuras

## **Para Ambos os Sistemas**
- Integração com banco de dados
- Interface gráfica (GUI)
- API REST para integração
- Relatórios e analytics
- Sistema de alertas (e-mail/SMS)
- Histórico de tendências

---

**Desenvolvido por:** SYNATEC (Equipe N° 7) Henrique de O. Molinari, Luiz Gustavo P. Diniz, Matteo Bonvento e Nicolas Buciolli   
**Orientação:** Prof. Nivaldo  
**Data de Entrega:** 26/09/2025  
**Disciplina:** Projeto Integrado de Modelagem e Desenvolvimento de Sistemas

---

## 📞 Contato
Para dúvidas ou mais informações sobre a implementação dos projetos, entre em contato através dos canais institucionais.
