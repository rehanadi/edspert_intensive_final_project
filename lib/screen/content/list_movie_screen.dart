import 'package:edspert_intensive_final_project/core/appbar/edspert_appbar.dart';
import 'package:edspert_intensive_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_intensive_final_project/model/home/movie_model.dart';
import 'package:edspert_intensive_final_project/screen/content/detail_content_screen.dart';
import 'package:edspert_intensive_final_project/utils/image_dir.dart';
import 'package:edspert_intensive_final_project/utils/widgets/edspert_button.dart';
import 'package:edspert_intensive_final_project/utils/widgets/edspert_rating_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMovieScreen extends StatefulWidget {
  static const routeName = 'list-movie/screen';

  const ListMovieScreen({super.key});

  @override
  State<ListMovieScreen> createState() => _ListMovieScreenState();
}

class _ListMovieScreenState extends State<ListMovieScreen> {
  final List<MovieModel> listMovieNow = [
    MovieModel(
      title: 'Star Wars : The Last Jedi',
      shortTitle: 'Star Wars : The\nLast Jedi',
      image: ImageDir.imageItem1,
      rating: '4',
      description:
          'Pembukaan film terbaru Star Wars, Episode VIII: The Last Jedi ini berbunyi bahwa First Order berencana untuk merebut kendali militer atas galaksi. Sebuah tim pejuang Perlawanan yang dipimpin oleh Jenderal Leia Organa (Carrie Fisher) merencanakan evakuasi dari markas utama mereka saat pasukan Pemimpin Tertinggi Snoke (Andy Serkis) mendatangi mereka. Perlawanan memberikan harapan bahwa Luke Skywalker (Mark Hamill) akan kembali membawa harapan.\n\nAdegan pembuka menunjukkan Poe Dameron (Oscar Isaac) dan droid BB-8 terbang di atas kapal penempur Orde Pertama saat Jenderal Hux (Domhnall Gleeson) memerintahkan anak buahnya untuk menembaki markas Poe dan Perlawanan. Pejuang lain bersiap menyerang.',
      director: 'Rian Johnson',
      writer: 'Rian Johnson',
      genre: 'Action, Sci-fi',
      ph: 'Lucasfilm Ltd.',
      score: '8.9',
      duration: '152 Min',
      pg: '13+',
    ),
    MovieModel(
      title: 'Fast & Furious 9',
      shortTitle: 'Fast & Furious 9',
      image: ImageDir.imageItem2,
      rating: '5',
      description:
          'Selama banyak misi dan melawan rintangan yang mustahil, Dom Toretto dan keluarganya telah mengakali dan mengalahkan setiap musuh di jalan mereka.\n\nSekarang, mereka menghadapi lawan paling mematikan yang pernah mereka hadapi: Ancaman mengerikan yang muncul dari bayang-bayang masa lalu yang dipicu oleh dendam berdarah, dan yang bertekad untuk menghancurkan keluarga ini dan menghancurkan segalanyadan semua orangyang dicintai Dom, selamanya. Dalam Fast Five 2011, Dom dan krunya mengalahkan gembong narkoba Brasil Hernan Reyes yang jahat dan memenggal kerajaannya di sebuah jembatan di Rio De Janeiro. ',
      director: 'Rian Johnson',
      writer: 'Rian Johnson',
      genre: 'Action, Sci-fi',
      ph: 'Lucasfilm Ltd.',
      score: '8.9',
      duration: '152 Min',
      pg: '13+',
    ),
    MovieModel(
      title: 'The Conjuring 3',
      shortTitle: 'The Conjuring 3',
      image: ImageDir.imageItem3,
      rating: '3',
      description:
          'Pada tahun 1971, Carolyn dan Roger Perron pindah ke sebuah rumah pertanian tua di Harrisville, Rhode Island, bersama kelima putri mereka. Selama hari pertama, kepindahan keluarga ini berjalan lancar, meskipun anjing mereka, Sadie, menolak memasuki rumah dan salah satu anak perempuan mereka menemukan sebuah pintu masuk ke ruang bawah tanah.\n\nKeesokan paginya, Carolyn bangun dengan memar misterius dan menemukan Sadie tergeletak mati di luar rumah. Peristiwa ini memuncak pada suatu malam saat Roger berada di Florida, Carolyn terkunci di ruang bawah tanah dan sesosok makhluk gaib yang terlihat seperti seorang wanita tua menyerang salah satu putrinya.',
      director: 'Rian Johnson',
      writer: 'Rian Johnson',
      genre: 'Action, Sci-fi',
      ph: 'Lucasfilm Ltd.',
      score: '8.9',
      duration: '152 Min',
      pg: '13+',
    ),
  ];

  final List<MovieModel> listMovieUpcoming = [
    MovieModel(
      title: 'Petualangan Sherina 2',
      shortTitle: 'Petualangan\nSherina 2',
      image: ImageDir.imageItem4,
      rating: '4',
      description:
          'Petualangan Sherina dan Sadam berlanjut dalam film Petualangan Sherina 2. Film ini kembali hadir setelah film pertamanya tayang 23 tahun yang lalu, tepatnya tahun 2000.\n\nSherina Munaf dan Derby Romero turut memerankan lagi karakter Sherina dan Sadam yang ikonis. Keduanya dipertemukan lagi dan menghadapi petualangan yang baru.',
      director: 'Rian Johnson',
      writer: 'Rian Johnson',
      genre: 'Drama, Action',
      ph: 'Lucasfilm Ltd.',
      score: '8.9',
      duration: '152 Min',
      pg: '13+',
    ),
    MovieModel(
      title: 'The Marvels',
      shortTitle: 'The Marvels',
      image: ImageDir.imageItem5,
      rating: '5',
      description:
          'Di film “The Marvels” dari Marvel Studios, Carol Danvers alias Captain Marvel telah merebut kembali identitasnya dari tirani Kree dan membalas dendam pada Supreme Intelligence.\n\nNamun konsekuensi yang tak diinginkan membuat Carol harus memikul beban ketidakstabilan alam semesta.',
      director: 'Rian Johnson',
      writer: 'Rian Johnson',
      genre: 'Action, Sci-fi',
      ph: 'Lucasfilm Ltd.',
      score: '8.9',
      duration: '152 Min',
      pg: '13+',
    ),
    MovieModel(
      title: 'Despicable Me 4',
      shortTitle: 'Despicable Me 4',
      image: ImageDir.imageItem6,
      rating: '3',
      description:
          'Despicable Me 4 resmi merilis trailer untuk kelanjutan waralaba animasi sukses tersebut. Kali ini, Gru sudah berkeluarga semenjak menikah dengan Lucy.\n\nDalam trailer yang dirilis tersebut, Gru kini hidup dalam kebahagiaan keluarga kecilnya, seorang istri, tiga anak adopsi, para minion, serta seorang putra hasil pernikahannya dengan Lucy.',
      director: 'Rian Johnson',
      writer: 'Rian Johnson',
      genre: 'Action, Sci-fi',
      ph: 'Lucasfilm Ltd.',
      score: '8.9',
      duration: '152 Min',
      pg: '13+',
    ),
  ];

  List<String> labels = ['Sedang Tayang', 'Akan Datang'];
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EdspertAppBar().main('Daftar Film'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xff514F64),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    labels.length,
                    (index) => tabButton(
                      text: labels[index],
                      isActive: isSelected[index],
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Column(
              children: List.generate(
                isSelected[0] ? listMovieNow.length : listMovieUpcoming.length,
                (index) => movieContainer(
                  isSelected[0] ? listMovieNow[index] : listMovieUpcoming[index],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget tabButton({required String text, required bool isActive, required int index}) {
    return GestureDetector(
      onTap: () {
        isSelected = [false, false];
        isSelected[index] = true;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isActive ? const Color(0xff867AD2) : const Color(0xff514F64),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget movieContainer(MovieModel movieModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                movieModel.image,
                width: 118,
                height: 168,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieModel.shortTitle,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  EdspertRatingStar().primary(movieModel.rating),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'P-G ${movieModel.pg}',
                    style: GoogleFonts.openSans(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    movieModel.genre,
                    style: GoogleFonts.openSans(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  EdspertButton().regular(
                    text: 'Beli Tiket',
                    onTap: () {
                      EdspertNavigation().pushNamed(DetailContentScreen.routeName,
                          arguments: {'movieModel': movieModel});
                    },
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }
}
