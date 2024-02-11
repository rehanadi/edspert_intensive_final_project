import 'package:edspert_intensive_final_project/model/home/movie_model.dart';
import 'package:flutter/material.dart';

class DetailContentScreen extends StatelessWidget {
  static const routeName = '/detail-content-screen';

  const DetailContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    MovieModel movieModel = arguments['movieModel'] as MovieModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          movieModel.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
