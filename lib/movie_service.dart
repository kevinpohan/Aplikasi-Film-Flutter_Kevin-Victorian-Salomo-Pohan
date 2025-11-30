import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_model.dart';

class MovieService {
  // URL Dasar TVMaze
  static const String _baseUrl = 'https://api.tvmaze.com';

  // 1. Fetch "Now Playing" (Kita pakai daftar Shows populer)
  Future<List<Movie>> fetchMovies() async {
    final url = Uri.parse('$_baseUrl/shows');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      // Ambil 20 data pertama saja agar ringan
      return data.take(20).map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // 2. Search Movies (Tantangan)
  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.parse('$_baseUrl/search/shows?q=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // Struktur JSON Search TVMaze sedikit berbeda:
      // [ { "score": 0.9, "show": { ...data film... } }, ... ]
      return data.map((item) {
        final showData = item['show'];
        return Movie.fromJson(showData);
      }).toList();
    } else {
      throw Exception('Gagal mencari data');
    }
  }
}
