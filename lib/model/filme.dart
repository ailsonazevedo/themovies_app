class Filme {
  late int id;
  late String titulo;
  late double imdb;
  late String dataLancamento;
  late String descricao;
  late String cartaz;
  late bool favorito;

  Filme(this.id, this.titulo, this.imdb, this.dataLancamento, this.descricao,
      this.cartaz,
      {favorito = false});

  Filme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['title'];
    imdb = json['vote_average'] * 1.0;
    dataLancamento = json['release_date'];
    descricao = json['overview'];
    if (json['poster_path'] == null) {
      cartaz =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    } else {
      var imgTemp = json['poster_path'];
      cartaz = 'https://image.tmdb.org/t/p/w92$imgTemp';
    }
    favorito = false;
  }

  @override
  String toString() {
    return '{id: $id, titulo: $titulo, imdb: $imdb}';
  }
}
  