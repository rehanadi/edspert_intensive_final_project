import 'package:edspert_intensive_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_intensive_final_project/model/home/movie_model.dart';
import 'package:edspert_intensive_final_project/screen/content/buy_ticket_screen.dart';
import 'package:edspert_intensive_final_project/utils/image_dir.dart';
import 'package:edspert_intensive_final_project/utils/svg_dir.dart';
import 'package:edspert_intensive_final_project/utils/widgets/edspert_button.dart';
import 'package:edspert_intensive_final_project/utils/widgets/edspert_rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailContentScreen extends StatelessWidget {
  static const routeName = '/detail-content-screen';

  const DetailContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    MovieModel movieModel = arguments['movieModel'] as MovieModel;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      ImageDir.detailThumbnail,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 214,
                      opacity: const AlwaysStoppedAnimation(0.3),
                    ),
                    Positioned(
                      top: 80,
                      left: 160,
                      right: 160,
                      child: SvgPicture.asset(SvgDir.play),
                    ),
                    Positioned(
                      top: 170,
                      left: 20,
                      child: Image.asset(
                        movieModel.image,
                        width: 140,
                        height: 240,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14,
                    left: 178,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Text(
                        movieModel.title,
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      movieDetail('Director', movieModel.director),
                      const SizedBox(
                        height: 4,
                      ),
                      movieDetail('Writer', movieModel.writer),
                      const SizedBox(
                        height: 4,
                      ),
                      movieDetail('Genre', movieModel.genre),
                      const SizedBox(
                        height: 4,
                      ),
                      movieDetail('PH', movieModel.ph),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 22,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          movieCard(
                              100,
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  EdspertRatingStar().primary(movieModel.rating),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                ],
                              ),
                              '${movieModel.score}/10'),
                          movieCard(
                              110,
                              Text(
                                'Duration',
                                style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    color: Colors.white.withOpacity(0.25)),
                              ),
                              movieModel.duration),
                          movieCard(
                              90,
                              Text(
                                'P-G',
                                style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    color: Colors.white.withOpacity(0.25)),
                              ),
                              movieModel.pg),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Sinopsis',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        movieModel.description,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: EdspertButton().icon(
                svg: SvgDir.ticketOutline,
                text: 'Beli Tiket',
                onTap: () {
                  EdspertNavigation().pushNamed(BuyTicketScreen.routeName,
                      arguments: {'movieModel': movieModel});
                }),
          )
        ],
      ),
    );
  }

  Widget movieCard(double width, Widget topWidget, String bottomText) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          topWidget,
          const SizedBox(
            height: 2,
          ),
          Text(
            bottomText,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }

  Widget movieDetail(String key, String value) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            key,
            style: GoogleFonts.openSans(
                fontSize: 12, color: Colors.white.withOpacity(0.25)),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          value,
          style: GoogleFonts.openSans(
            fontSize: 12,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
