import 'package:flutter/material.dart';
import 'package:flutter_telebirr_design/screens/second_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCard extends StatelessWidget {
  final String itemName;
  final String imagePath;

  const BuildCard({Key? key, required this.itemName, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imagePath,
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondScreen()));
          },
            child: Text(
              itemName,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 11.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
