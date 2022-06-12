import 'package:themovies_app/service/api/servico_filme.dart';

import '../model/filme.dart';

class GerenciadorFilmes {
  ServicoFilme servicoFilme = ServicoFilme();

  Future<List<Filme>?> obterFilmes() async {
    var filmes = await servicoFilme.obterFilmes();
    return filmes;
  }

  Future<Filme?> obterFilmePorID(int id) async {
    Filme? filme = await servicoFilme.obterFilmePorID(id);
    return filme;
  }
}
