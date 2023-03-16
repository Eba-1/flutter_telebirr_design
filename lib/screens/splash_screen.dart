import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_telebirr_design/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _bankController;
  bool bankAnimated = false;
  bool animateLogoText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bankController = AnimationController(vsync: this);

    _bankController.addListener(() {
      if (_bankController.value > 0.7) {
        _bankController.stop();
        bankAnimated = true;
        setState(() {});
        Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          animateLogoText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bankController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: bankAnimated ? screenHeight / 1.9 : screenHeight,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff334050),
                  Color(0xff6f6e6e),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: !bankAnimated ? null: const BorderRadius.only(
                bottomRight: Radius.circular(130.0),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !bankAnimated,
                  child: Lottie.asset(
                    "assets/bank_animate.json",
                    controller: _bankController,
                    onLoaded: (composition) {
                      _bankController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: bankAnimated,
                  child: Image.asset(
                    "assets/bank.png",
                    height: 190.0,
                    width: 190.0,
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateLogoText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: Text(
                      "Telebirr",
                      style: GoogleFonts.notoSerif(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffefebd8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: bankAnimated,
            child: const _BottomPart(),
          ),
        ],
      ),
    );
  }
}

class _BottomPart extends StatefulWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  State<_BottomPart> createState() => _BottomPartState();
}

class _BottomPartState extends State<_BottomPart> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth / 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                "Cashless Payment via Telebirr",
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff211f1f),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              "By clicking the button down below, you agree to the terms and conditions of the app",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 12.0,
                color: const Color(0xff211f1f).withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[600]!,
                      const Color(0xff334050),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 70.0),
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.notoSerif(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
