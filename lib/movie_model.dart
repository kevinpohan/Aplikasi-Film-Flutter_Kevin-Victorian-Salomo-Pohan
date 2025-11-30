class Movie {
  final int id;
  final String title;
  final String overview;
  final String imageUrl;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.imageUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['name'] ?? 'No Title',
      // Membersihkan tag HTML sederhana dari deskripsi (UX Improvement)
      overview: (json['summary'] ?? 'No Description').replaceAll(
        RegExp(r'<[^>]*>'),
        '',
      ),
      // Ambil gambar medium, jika null pakai placeholder
      imageUrl: json['image'] != null
          ? json['image']['medium']
          : 'https://via.placeholder.com/210x295?text=No+Image',
    );
  }
}
