import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:launch_review/launch_review.dart';
import 'package:marathi_aarthi_sangrah/AdsHelper/adshelper.dart';
import 'package:marathi_aarthi_sangrah/screens/AarthiScreen.dart';
import 'package:marathi_aarthi_sangrah/utils/constants.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> aarthilist = ["|| श्री गणपतीची आरती ||","|| श्री शंकराची आरती ||","|| श्री दुर्गा देवीची आरती ||","|| श्री महालक्ष्मीची आरती ||","|| दशावतारांची आरती  ||","|| साईबाबा आरती  ||","|| ज्ञानराजा आरती ||","|| श्री विठोबाची आरती ||","|| श्री गुरुदत्ताची आरती ||","|| श्री कृष्णाची आरती ||","|| श्री रामाची आरती ||"];

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  Future<void>? _launched;

  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitIdOfAarthiScreen,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();

  }


  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'http://darshankomu.com/apps/Marathi%20Aarti%20Sangrah/privacypolicy.html';

    return Scaffold(
      backgroundColor: kmarroncolor,
      appBar: AppBar(
        title: Center(child: Text("मराठी आरती संग्रह",
            style: GoogleFonts.poppins(
                letterSpacing: 0.8,
                fontSize: 24,
                color: kmarroncolor,
                fontWeight: FontWeight.bold))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: aarthilist.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: DecoratedBox(
                        decoration:
                        ShapeDecoration(shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                            color: kprimarycolor.withOpacity(0.9)),
                        child: OutlinedButton(
                          onPressed: () =>
                          {
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: AarthiScreen(listIndex: i,)))

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         AarthiScreen(listIndex: i,)))
                          },
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                                color: koutlinecolor.withOpacity(0.9),
                                width: 1.0,
                                style: BorderStyle.solid)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Stack(children: [
                                    Opacity(child: Image.asset(
                                        "assets/images/side.png",
                                        color: Colors.black,
                                        height: 30,
                                        width: 30.0), opacity: 0.5),
                                    ClipRect(child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5.0, sigmaY: 5.0),
                                        child: Image.asset(
                                            "assets/images/side.png",
                                            height: 30, width: 30.0)))
                                  ]),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Text(aarthilist[i].toString(),
                                          style: GoogleFonts.aBeeZee(
                                              letterSpacing: 1,
                                              fontSize: 21,
                                              color: kmarroncolor,
                                              fontWeight: FontWeight.bold)),
                                      // Image.asset('assets/images/bottom.png',
                                      //   height: 20,width: 300.0, ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Stack(children: [
                                    Opacity(child: Image.asset(
                                        "assets/images/side.png",
                                        color: Colors.black,
                                        height: 30,
                                        width: 30.0), opacity: 0.5),
                                    ClipRect(child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5.0, sigmaY: 5.0),
                                        child: Image.asset(
                                            "assets/images/side.png",
                                            height: 30, width: 30.0)))
                                  ]),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  );
                },
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) =>
            FabCircularMenu(
              key: fabKey,
              alignment: Alignment.bottomRight,
              ringColor: kmarroncolor.withAlpha(190),
              ringDiameter: 400.0,
              ringWidth: 100.0,
              fabSize: 64.0,
              fabElevation: 24.0,
              fabIconBorder: const CircleBorder(),
              fabColor: ksecondcolor,
              fabOpenIcon: const Icon(
                Icons.home, color: kmarroncolor, size: 28,),
              fabCloseIcon: const Icon(
                Icons.close, color: kmarroncolor, size: 28,),
              fabMargin: const EdgeInsets.all(16.0),
              animationDuration: const Duration(milliseconds: 500),
              animationCurve: Curves.easeInOutCirc,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    _launched = _launchInBrowser(toLaunch);
                  },
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(34.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        // BoxShadow(
                        //   color: kprimarycolor,
                        //   blurRadius: 10.0, // soften the shadow
                        //   spreadRadius: 1.0, //extend the shadow
                        //   offset: Offset(
                        //     4.0, // Move to right 10  horizontally
                        //     2.0, // Move to bottom 5 Vertically
                        //   ),
                        // ),
                      ],

                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 8,
                      child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: kprimarycolor,
                          child: Icon(
                            Icons.privacy_tip, color: kmarroncolor, size: 24,)),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    if (Platform.isAndroid) {
                      // Android-specific code
                      Share.share(
                          androidShareText + '\n' + androidAppShareLink);
                    } else if (Platform.isIOS) {
                      // iOS-specific code
                      // Share.share(iosShareText + '\n' + iosAppShareLink);
                    }
                  },
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(34.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        // BoxShadow(
                        //   color: kprimarycolor,
                        //   blurRadius: 10.0, // soften the shadow
                        //   spreadRadius: 1.0, //extend the shadow
                        //   offset: Offset(
                        //     4.0, // Move to right 10  horizontally
                        //     2.0, // Move to bottom 5 Vertically
                        //   ),
                        // ),
                      ],

                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 8,
                      child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: kprimarycolor,
                          child: Icon(
                            Icons.share, color: kmarroncolor, size: 24,)),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    LaunchReview.launch(
                      androidAppId: androidAppIdValue,
                      iOSAppId: iOSAppIdValue,);
                  },
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(34.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        // BoxShadow(
                        //   color: kprimarycolor,
                        //   blurRadius: 10.0, // soften the shadow
                        //   spreadRadius: 1.0, //extend the shadow
                        //   offset: Offset(
                        //     4.0, // Move to right 10  horizontally
                        //     2.0, // Move to bottom 5 Vertically
                        //   ),
                        // ),
                      ],

                    ),
                    child: Material(

                      borderRadius: BorderRadius.circular(30),
                      elevation: 8,
                      child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: kprimarycolor,
                          child: Icon(
                            Icons.feedback, color: kmarroncolor, size: 24,)),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    LaunchReview.launch(
                        androidAppId: androidAppIdValue,
                        iOSAppId: iOSAppIdValue);
                  },
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(34.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        // BoxShadow(
                        //   color: kprimarycolor,
                        //   blurRadius: 10.0, // soften the shadow
                        //   spreadRadius: 0.5, //extend the shadow
                        //   offset: Offset(
                        //     4.0, // Move to right 10  horizontally
                        //     3.0, // Move to bottom 5 Vertically
                        //   ),
                        // ),
                      ],

                    ),
                    child: Material(

                      borderRadius: BorderRadius.circular(30),
                      elevation: 8,
                      child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: kprimarycolor,
                          child: Icon(
                            Icons.star_rate, color: kmarroncolor, size: 24,)),
                    ),
                  ),
                ),

              ],
            ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isBannerAdReady)
            Container(
              width: _bannerAd.size.width.toDouble(),
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
        ],
      ),

    );
  }


  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

}
