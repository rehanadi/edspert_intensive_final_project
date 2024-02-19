class MovieModel {
  String title;
  String image;
  String rating;
  String shortTitle;
  String description;
  String director;
  String writer;
  String genre;
  String ph;
  String score;
  String duration;
  String pg;

  MovieModel({
    required this.title,
    required this.image,
    required this.rating,
    this.shortTitle = '',
    this.description = '',
    this.director = '',
    this.writer = '',
    this.genre = '',
    this.ph = '',
    this.score = '',
    this.duration = '',
    this.pg = '',
  });
}