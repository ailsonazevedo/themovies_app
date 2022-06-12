import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/filme.dart';

class ServicoFilme {
  Future<List<Filme>?> obterFilmes() async {
    const String lancamentos =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=122e21faa54b05c5b512759434d453c1&language=pt-BR';
    final url = Uri.parse(lancamentos);

    var requisicao = await http.get(url);

    if (requisicao.statusCode == HttpStatus.ok) {
      final resposta = json.decode(requisicao.body);
      final filmesMap = resposta['results'];
      List<Filme> filmes = [];
      for (var filme in filmesMap) {
        filmes.add(Filme.fromJson(filme as Map<String, dynamic>));
      }
      return filmes;
    } else {
      return null;
    }
  }

  Future<Filme?> obterFilmePorID(int id) async {
    final String filmePorID =
        'https://api.themoviedb.org/3/movie/$id?api_key=122e21faa54b05c5b512759434d453c1&language=pt-BR';

    final url = Uri.parse(filmePorID);

    var requisicao = await http.get(url);

    if (requisicao.statusCode == HttpStatus.ok) {
      final resposta = json.decode(requisicao.body);
      var filme = Filme.fromJson(resposta);

      return filme;
    } else {
      return null;
    }
  }
}
