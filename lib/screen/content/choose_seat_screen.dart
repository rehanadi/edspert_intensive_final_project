import 'package:edspert_intensive_final_project/core/appbar/edspert_appbar.dart';
import 'package:edspert_intensive_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_intensive_final_project/model/home/movie_model.dart';
import 'package:edspert_intensive_final_project/utils/svg_dir.dart';
import 'package:edspert_intensive_final_project/utils/widgets/edspert_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseSeatScreen extends StatefulWidget {
  static const routeName = '/choose-seat-screen';

  const ChooseSeatScreen({super.key});

  @override
  State<ChooseSeatScreen> createState() => _ChooseSeatScreenState();
}

class _ChooseSeatScreenState extends State<ChooseSeatScreen> {
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset(SvgDir.curveLine),
                  Text(
                    'LAYAR',
                    style: GoogleFonts.openSans(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  seatGridView(),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 1,
              color: Colors.white.withOpacity(0.15),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  seatStatus('Tersedia', const Color(0xff38354B)),
                  seatStatus('Tidak Tersedia', const Color(0xff282633)),
                  seatStatus('Dipilih', const Color(0xff6C61AF)),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Color(0xff2F2C44),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(SvgDir.building),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'CGV Pamulang Barat',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      theaterDetail('Jam', '16.00'),
                      theaterDetail('Tanggal', '24 Juni'),
                      theaterDetail('Kelas', 'Reguler'),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3 Kursi terpilih',
                        style: GoogleFonts.openSans(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'A10, A13, A13',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
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
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.openSans(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Rp.150,000',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EdspertButton().full(text: 'Beli Tiket', onTap: (){
                    EdspertNavigation().pop();
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget theaterDetail(String title, String desc) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border:
        Border.all(color: Colors.white.withOpacity(0.25)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.openSans(
              color: Colors.white.withOpacity(0.4),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 2,),
          Text(
            desc,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget seatStatus(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: GoogleFonts.openSans(
            color: Colors.white.withOpacity(0.6),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget seatGridView() {
    return Container(
      height: 215,
      alignment: Alignment.center,
      child: GridView.count(
        primary: false,
        shrinkWrap: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 7,
        crossAxisCount: 7,
        children: <Widget>[
          seatItem('A1', 'available'),
          seatItem('A2', 'unavailable'),
          seatItem('A3', 'available'),
          seatItem('A4', 'unavailable'),
          const SizedBox(),
          const SizedBox(),
          seatItem('B1', 'available'),
          seatItem('C1', 'unavailable'),
          seatItem('C2', 'available'),
          seatItem('C3', 'unavailable'),
          seatItem('C4', 'available'),
          const SizedBox(),
          const SizedBox(),
          seatItem('D1', 'unavailable'),
          seatItem('E1', 'available'),
          seatItem('E2', 'unavailable'),
          seatItem('E3', 'available'),
          seatItem('E4', 'unavailable'),
          const SizedBox(),
          const SizedBox(),
          seatItem('F1', 'available'),
          seatItem('G1', 'unavailable'),
          seatItem('G2', 'chosen'),
          seatItem('G3', 'unavailable'),
          seatItem('G4', 'chosen'),
          const SizedBox(),
          const SizedBox(),
          seatItem('H1', 'unavailable'),
          seatItem('I1', 'available'),
          seatItem('I2', 'unavailable'),
          seatItem('I3', 'chosen'),
          seatItem('I4', 'unavailable'),
          seatItem('J1', 'available'),
          seatItem('J2', 'unavailable'),
          seatItem('K1', 'available'),
        ],
      ),
    );
  }

  Widget seatItem(String text, String status) {
    Widget widget = const SizedBox();

    if (status == 'available') {
      widget = Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xff514F64),
          borderRadius: BorderRadius.circular(2.5),
        ),
        child: Text(
          text,
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else if (status == 'unavailable') {
      widget = Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xff282633),
          borderRadius: BorderRadius.circular(2.5),
        ),
        child: Text(
          text,
          style: GoogleFonts.openSans(
            color: Colors.white.withOpacity(0.2),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else if (status == 'chosen') {
      widget = Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xff6C61AF),
          borderRadius: BorderRadius.circular(2.5),
        ),
        child: Text(
          text,
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return widget;
  }
}
