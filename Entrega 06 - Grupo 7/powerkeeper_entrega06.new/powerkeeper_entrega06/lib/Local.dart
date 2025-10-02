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
