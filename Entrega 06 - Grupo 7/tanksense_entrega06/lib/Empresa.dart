class Empresa {
  //atributos
  int id;
  String nome;
  String cnpj;

  //metodo construtor
  Empresa(this.id, this.nome, this.cnpj);

  //Metodo para inserir o ID
  void inserirId(int id) {
    id = 0001;
  }

  //Metodo para inserir o nome
  void inserirNome(String nome) {
    nome = 'PackBag';
  }

  //Metodo para inserir o cnpj
  void inserirCNJP() {
    cnpj = '13.478.113/0003-00';
  }

  //Metodo para exibir os dados
  void exibirDados() {
    print('---- Dados da Empresa ---');
    print('Nome: $nome');
    print('CNPJ: $cnpj');
  }
}
