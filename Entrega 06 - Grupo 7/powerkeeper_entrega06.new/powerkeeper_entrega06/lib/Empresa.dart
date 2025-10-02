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
