import 'package:carousel_slider/carousel_slider.dart';
import 'package:edspert_intensive_final_project/model/home/movie_model.dart';
import 'package:edspert_intensive_final_project/screen/content/detail_content_screen.dart';
import 'package:edspert_intensive_final_project/utils/edspert_color.dart';
import 'package:edspert_intensive_final_project/utils/image_dir.dart';
import 'package:edspert_intensive_final_project/utils/svg_dir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<MovieModel> listMovie = [
    MovieModel(
      title: 'Star Wars : The Last Jedi',
      shortTitle: 'Star Wars : The Last',
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

  final List<String> listSlider = [
    ImageDir.sliderItem1,
    ImageDir.sliderItem1,
    ImageDir.sliderItem1,
    ImageDir.sliderItem1,
    ImageDir.sliderItem1,
  ];

  final List<String> listVoucher = [
    ImageDir.voucherItem1,
    ImageDir.voucherItem2,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(ImageDir.avatar),
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(SvgDir.location),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Yogyakarta',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )),
        actions: [
          SvgPicture.asset(SvgDir.notifications),
          const SizedBox(width: 25),
        ],
      ),
      body: PersistentTabView(
        context,
        backgroundColor: EdspertColor.bottomColor,
        resizeToAvoidBottomInset: true,
        navBarHeight: 84,
        navBarStyle: NavBarStyle.style6,
        decoration: const NavBarDecoration(
          colorBehindNavBar: EdspertColor.primaryColor,
        ),
        screens: [
          _bodyScreen(),
          _ticketScreen(),
          _movieScreen(),
          _profileScreen(),
        ],
        items: [
          _bottomNavigationBar(SvgDir.home, 'Home'),
          _bottomNavigationBar(SvgDir.ticket, 'Ticket'),
          _bottomNavigationBar(SvgDir.theater, 'Bioskop'),
          _bottomNavigationBar(SvgDir.user, 'Profil'),
        ],
      ),
    );
  }

  Widget bannerHome() {
    return Column(
      children: [
        SizedBox(
          height: 164,
          child: CarouselSlider(
            items: listSlider
                .map((item) => Center(
                        child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 266,
                      height: 164,
                    )))
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listSlider
              .map((item) => Center(
                      child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 265,
                    height: 163,
                  )))
              .toList()
              .asMap()
              .entries
              .map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget cardMovie(MovieModel movieModel) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailContentScreen.routeName,
            arguments: {'movieModel': movieModel});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            movieModel.image,
            fit: BoxFit.fill,
            height: 210,
            width: 150,
          ),
          const SizedBox(height: 12),
          Text(
            movieModel.shortTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          RatingBar.builder(
            initialRating: double.parse(movieModel.rating),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 10,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              // print(rating);
            },
          ),
        ],
      ),
    );
  }

  Widget _ticketScreen() {
    return Container(
      color: EdspertColor.primaryColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Center(
            child: Text(
              'Ticket',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _movieScreen() {
    return Container(
      color: EdspertColor.primaryColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Center(
            child: Text(
              'Bioskop',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileScreen() {
    return Container(
      color: EdspertColor.primaryColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 22,
              ),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xff2F2C44),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      ImageDir.userProfile,
                      width: 90,
                      height: 90,
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wawan Kurniawan',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Since 5 January 2021',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Color(0xffFFBC4F), Color(0xffF9A01B)]),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Member Gold',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(
                                SvgDir.arrowRight,
                                width: 4,
                                height: 6,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff2F2C44),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iconContainer('Wallet', SvgDir.wallet),
                    iconContainer('Points', SvgDir.points),
                    iconContainer('Voucher', SvgDir.voucher),
                    iconContainer('PayLater', SvgDir.payLater),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              profileContainer(
                  'Saved', 'Lorem ipsum dolor sit amet, consectetur adipisci'),
              const SizedBox(
                height: 16,
              ),
              profileContainer('History',
                  'Lorem ipsum dolor sit amet, consectetur adipisci'),
              const SizedBox(
                height: 16,
              ),
              profileContainer('My Ratings',
                  'Lorem ipsum dolor sit amet, consectetur adipisci'),
              const SizedBox(
                height: 16,
              ),
              profileContainer('Help Center',
                  'Lorem ipsum dolor sit amet, consectetur adipisci'),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileContainer(String title, String desciption) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff2F2C44),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            desciption,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget iconContainer(String text, String icon) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          height: 24,
          width: 24,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget _bodyScreen() {
    return Container(
      color: EdspertColor.primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            bannerHome(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sedang Tayang',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Lihat Semua',
                        style: GoogleFonts.openSans(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white.withOpacity(0.6),
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 6),
                child: Row(
                  children: List.generate(
                    listMovie.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: cardMovie(listMovie[index]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: Colors.white.withOpacity(0.25),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Voucher Deals',
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 6),
                child: Row(
                  children: List.generate(
                    listVoucher.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Image.asset(
                        listVoucher[index],
                        width: 214,
                        height: 132,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  PersistentBottomNavBarItem _bottomNavigationBar(String svgDir, String title) {
    return PersistentBottomNavBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(svgDir),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      activeColorPrimary: EdspertColor.yellow,
      inactiveColorPrimary: Colors.white,
    );
  }
}
