class Local {
  //atributos
  int id;
  String nome;
  String endereco;

  //metodo construtor
  Local(this.id, this.nome, this.endereco);

  //Metodo para inserir o ID
  void inserirId(int id) {
    this.id = id;
  }

  //Metodo para inserir o nome
  void inserirNome(String nome) {
    this.nome = nome;
  }

  //Metodo para inserir o endereço
  void inserirEndereco(String endereco) {
    this.endereco = endereco;
  }

  //Metodo para obter o nome
  String getNome() {
    return nome;
  }

  //Metodo para obter o endereço
  String getEndereco() {
    return endereco;
  }

  //Metodo para exibir os dados
  void exibirDados() {
    print('---- Dados do Local ---');
    print('ID: $id');
    print('Nome: $nome');
    print('Endereço: $endereco');
  }
}
