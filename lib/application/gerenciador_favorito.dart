import 'package:themovies_app/service/bd/bd_favoritos.dart';
import '../model/filme.dart';

class GerenciadorFavorito {
  final BdFavorito _bd = BdFavorito();

  void adicionaFavorito(Filme filme) {
    _bd.adicionaFavorito(filme.id);
  }

  void removeFavorito(Filme filme) {
    _bd.removeFavorito(filme.id);
  }

  Future<bool> ehFavorito(Filme filme) {
    return _bd.ehFavorito(filme.id);
  }
}
