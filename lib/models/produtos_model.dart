//   produto_id: JG.objectId(),
//   produto: JG.loremIpsum({ units: 'words', count: 2 }),
//   endereco: `${JG.integer(1, 100)} ${JG.street()}, ${JG.city()},
//   ${JG.state()}`,
//   descricao: JG.loremIpsum({ units: 'sentences', count: 2 }),
//   imagem: 'http://placehold.it/128x128',
//   quantidade: `${JG.integer(1,100)}`,
//   preco: `${JG.floating(1,1000,2)}`]

class Produtos {
  final List produtos;

  Produtos(this.produtos);
}

class Produto {
  final String produto_id;
  final String produto;
  final String endereco;
  final String descricao;
  final String imagem;
  final int quantidade;
  final double preco;

  Produto(this.produto_id, this.produto, this.endereco, this.descricao,
      this.imagem, this.quantidade, this.preco);

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(json['produto_id'], json['produto'], json['endereco'],
        json['descricao'], json['imagem'], json['quantidade'], json['preco']);
  }

  Map<String, dynamic> toJson() => {
        'produto_id': this.produto_id,
        'produto': this.produto,
        'endereco': this.endereco,
        'descricao': this.descricao,
        'imagem': this.imagem,
        'quantidade': this.quantidade,
        'preco': this.preco
      };
}