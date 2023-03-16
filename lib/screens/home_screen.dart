import 'package:flutter/material.dart';
import 'package:flutter_telebirr_design/components/cards.dart';
import 'package:flutter_telebirr_design/model/card_model.dart';
import 'package:flutter_telebirr_design/screens/second_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop;
              },
            ),
          ),
          title: Text(
            "Hi, Customer!",
            style: GoogleFonts.notoSerif(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Stack(
            children: [
              Positioned(
                top: size.height / 4,
                child: const _BottomPart(),
              ),
              Positioned(
                top: 15.0,
                left: size.width / 20,
                child: const _UpperPart(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: GNav(
            gap: 8,
            duration: const Duration(milliseconds: 300),
            color: Colors.grey.shade400,
            activeColor: Colors.grey.shade100,
            tabBackgroundColor: Color(0xff1c1c64),
            tabActiveBorder: Border.all(color: Colors.white),
            mainAxisAlignment: MainAxisAlignment.center,
            tabBorderRadius: 16,
            textStyle: GoogleFonts.notoSerif(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            tabs: const [
              GButton(
                icon: Icons.wallet,
                text: "Wallet",
              ),
              GButton(
                icon: Icons.speaker,
                text: "Promotion",
              ),
              GButton(
                icon: Icons.person,
                text: "Account",
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 70.0),
          child: Container(
            height: 70,
            width: 70,
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: Color(0xff2c2c3c),
                child: Icon(
                  Icons.qr_code_scanner,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }
}

class _UpperPart extends StatefulWidget {
  const _UpperPart({Key? key}) : super(key: key);

  @override
  State<_UpperPart> createState() => _UpperPartState();
}

class _UpperPartState extends State<_UpperPart> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      child: Center(
        child: Container(
          height: size.height / 5,
          width: size.width - 40,
          decoration: BoxDecoration(
            color: const Color(0xff6c74f2),
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Color(0xff2c2c3c),
                Color(0xff1c1c64),
                Color(0xff2c2c3c),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width / 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        height: 60.0,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "ቴሌብር",
                        style: GoogleFonts.notoSerif(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isHidden = !_isHidden;
                                });
                              },
                              child: !_isHidden
                                  ? Icon(
                                Icons.visibility,
                                size: 17.0,
                                color: Colors.grey[200],
                              )
                                  : Icon(
                                Icons.visibility_off,
                                size: 17.0,
                                color: Colors.grey[200],
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "View Balance",
                              style: GoogleFonts.notoSerif(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        SizedBox(
                          height: 20.0,
                          child: Visibility(
                            visible: _isHidden,
                            maintainAnimation: true,
                            maintainSize: true,
                            maintainState: true,
                            child: RichText(
                              text: TextSpan(
                                text: "\$",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey[300],
                                ),
                                children: [
                                  TextSpan(
                                    text: ' 1,555.00',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[200],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pay & Transfer",
                    style: GoogleFonts.notoSerif(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff3b4858),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondScreen()));
                    },
                    child: Text(
                      "Transaction Details",
                      style: GoogleFonts.notoSerif(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff6c74f2),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 80.0,
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.cardItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BuildCard(
                        itemName: value.cardItems[index][0],
                        imagePath: value.cardItems[index][1],
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "UPI & Recharge",
                style: GoogleFonts.notoSerif(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff3b4858),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 80.0,
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.cardItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BuildCard(
                        itemName: value.cardItems2[index][0],
                        imagePath: value.cardItems2[index][1],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
