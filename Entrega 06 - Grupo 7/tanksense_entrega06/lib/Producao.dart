void main() {
  // Criando uma produção
  var Producao;
  var producao1 = Producao(
    1,
    1500.75, // quantidade
    DateTime(2024, 1, 15, 14, 30, 0), // timestamp
  );

  // Exibindo dados completos
  producao1.exibirDados();

  // Usando os métodos getters
  print('\n--- Usando Getters ---');
  print('Quantidade: ${producao1.getQuantidade()}');
  print('Timestamp: ${producao1.getTimestamp()}');

  // Formatando dados como string
  print('\n--- Dados Formatados ---');
  print(producao1.formatarDados());

  // Modificando alguns dados
  print('\n--- Após Modificação ---');
  producao1.inserirQuantidade(1800.25);
  producao1.inserirTimestamp(DateTime.now());

  producao1.exibirDados();

  // Criando uma lista de produções
  print('\n--- Lista de Produções ---');
  var producoes = [
    Producao(1, 1200.0, DateTime(2024, 1, 15, 8, 0, 0)),
    Producao(2, 1500.5, DateTime(2024, 1, 15, 12, 0, 0)),
    Producao(3, 1800.75, DateTime(2024, 1, 15, 16, 0, 0)),
  ];

  for (var producao in producoes) {
    print(producao.formatarDados());
  }
}
