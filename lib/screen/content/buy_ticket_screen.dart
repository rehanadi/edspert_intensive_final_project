import 'package:edspert_intensive_final_project/core/appbar/edspert_appbar.dart';
import 'package:edspert_intensive_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_intensive_final_project/model/home/movie_model.dart';
import 'package:edspert_intensive_final_project/screen/content/choose_seat_screen.dart';
import 'package:edspert_intensive_final_project/screen/content/list_movie_screen.dart';
import 'package:edspert_intensive_final_project/utils/edspert_color.dart';
import 'package:edspert_intensive_final_project/utils/image_dir.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyTicketScreen extends StatefulWidget {
  static const routeName = '/buy-ticket-screen';

  const BuyTicketScreen({super.key});

  @override
  State<BuyTicketScreen> createState() => _BuyTicketScreenState();
}

class _BuyTicketScreenState extends State<BuyTicketScreen> {
  List<String> times = ['10:00', '15:00', '17:00', '20:00'];
  List<bool> isSelected = [false, true, false, false];

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    MovieModel movieModel = arguments['movieModel'] as MovieModel;

    return Scaffold(
        appBar: EdspertAppBar().main(movieModel.title),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  dateContainer('Wed', '21', false),
                  dateContainer('Thu', '22', false),
                  dateContainer('Fri', '23', false),
                  dateContainer('Sat', '24', true),
                  dateContainer('Sun', '25', false),
                  dateContainer('Mon', '26', false),
                  dateContainer('Tue', '27', false),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 1,
                color: Colors.white.withOpacity(0.25),
              ),
              const SizedBox(
                height: 20,
              ),
              searchTextField('Cari Bioskop', Icons.search_outlined),
              const SizedBox(
                height: 30,
              ),
              theaterContainer(
                ImageDir.theaterCGV,
                'CGV JWalk',
                const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: EdspertColor.secondaryColor,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 12, bottom: 54),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.25),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Regular',
                          style: GoogleFonts.openSans(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Rp. 50.000',
                          style: GoogleFonts.openSans(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        times.length,
                        (index) => GestureDetector(
                          onTap: () {
                            EdspertNavigation().pushNamed(ChooseSeatScreen.routeName,
                                arguments: {'movieModel': movieModel});
                          },
                          child: timeContainer(
                              times[index], isSelected[index], index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              theaterContainer(
                ImageDir.theaterXXI,
                'XXI Ambarukmo Plaza',
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              theaterContainer(
                ImageDir.theaterXXI,
                'Cinema XXI',
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget theaterContainer(String image, String text, Icon icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              EdspertNavigation().pushNamed(ListMovieScreen.routeName);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: 34,
                  height: 34,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          icon,
        ],
      ),
    );
  }

  Widget searchTextField(String hintText, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xff2F2C44),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          TextField(
            onChanged: (String value) {},
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              hintText: hintText,
              hintStyle: GoogleFonts.openSans(
                color: Colors.white.withOpacity(0.2),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.white.withOpacity(0.2),
              ),
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget dateContainer(String day, String date, bool isActive) {
    return Column(
      children: [
        Text(
          day,
          style: GoogleFonts.openSans(
            color: Colors.white.withOpacity(isActive ? 1 : 0.6),
            fontSize: isActive ? 18 : 12,
          ),
        ),
        SizedBox(
          height: isActive ? 4 : 2,
        ),
        Text(
          date,
          style: GoogleFonts.openSans(
            color: Colors.white.withOpacity(isActive ? 1 : 0.6),
            fontSize: isActive ? 18 : 16,
          ),
        ),
      ],
    );
  }

  Widget timeContainer(String text, bool isActive, int index) {
    return GestureDetector(
      /*
      onTap: () {
        isSelected = [false, false, false, false];
        isSelected[index] = true;
        setState(() {});
      },
      */
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive ? const Color(0xff867AD2) : const Color(0xff514F64),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        // margin: const EdgeInsets.only(right: 10),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
