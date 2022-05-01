
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marathi_aarthi_sangrah/AdsHelper/adshelper.dart';
import 'package:marathi_aarthi_sangrah/utils/constants.dart';

class AarthiScreen extends StatefulWidget {
  final int listIndex;

  const AarthiScreen({Key? key,required this.listIndex}) : super(key: key);

  @override
  _AarthiScreenState createState() => _AarthiScreenState(listIndex);
}

class _AarthiScreenState extends State<AarthiScreen> {

  final int listIndex;

  _AarthiScreenState(this. listIndex);  //constructor

  List<String> aarthilist = ["|| श्री गणपतीची आरती ||","|| श्री शंकराची आरती ||","|| श्री दुर्गा देवीची आरती ||","|| श्री महालक्ष्मीची आरती ||","|| दशावतारांची आरती  ||","|| साईबाबा आरती  ||","|| ज्ञानराजा आरती ||","|| श्री विठोबाची आरती ||","|| श्री गुरुदत्ताची आरती ||","|| श्री कृष्णाची आरती ||","|| श्री रामाची आरती ||"];

  List<String> aarthiMain = ["सुखकर्ता दुःखहर्ता वार्ता विघ्नाची।\n नुरवी पुरवी प्रेम कृपा जयाची। \n सर्वांगी सुन्दर उटि शेंदुराची। \n कण्ठी झळके माळ मुक्ताफळांची॥ \n\n जय देव जय देव जय मंगलमूर्ति। \n दर्शनमात्रे मनकामना पुरती॥ \n\n रत्नखचित फरा तुज गौरीकुमरा। \n  चन्दनाची उटि कुंकुमकेशरा। \n हिरे जड़ित मुकुट शोभतो बरा। \n रुणझुणती नूपुरे चरणी घागरिया॥ \n\n जय देव जय देव जय मंगलमूर्ति। \n दर्शनमात्रे मनकामना पुरती॥ \n\n लम्बोदर पीताम्बर फणिवर बन्धना। \n सरळ सोण्ड वक्रतुण्ड त्रिनयना। \n दास रामाचा वाट पाहे सदना। \n संकटी पावावे निर्वाणीरक्षावे सुरवरवन्दना॥ \n\n जय देव जय देव जय मंगलमूर्ति। \n दर्शनमात्रे मनकामना पुरती॥",
    "लवथवती विक्राळा ब्रह्माण्डी माळा। \n वीषे कण्ठ काळा त्रिनेत्री ज्वाळा। \n लावण्य सुन्दर मस्तकी बाळा। \n तेथुनिया जळ निर्मळ वाहे झुळझुळा॥ \n\n जय देव जय देव जय श्रीशंकरा। \n आरती ओवाळू तुज कर्पुरगौरा॥ \n\n कर्पुर्गौरा भोळा नयनी विशाळा। \n अर्धांगी पार्वती सुमनांच्या माळा। \n विभुतीचे उधळण शितिकण्ठ नीळा। \n ऐसा शंकर शोभे उमावेल्हाळा॥ \n\n जय देव जय देव जय श्रीशंकरा। \n आरती ओवाळू तुज कर्पुरगौरा॥ \n\n देवी दैत्यी सागरमन्थन पै केलें। \n त्यामाजी अवचित हळाहळ जें उठिले। \n ते त्वां असुरपणे प्राशन केलें। \n नीलकण्ठ नाम प्रसिद्ध झालें॥ \n\n जय देव जय देव जय श्रीशंकरा। \n आरती ओवाळू तुज कर्पुरगौरा॥ \n\n व्याघ्राम्बर फणिवरधर सुन्दर मदनारी \n पंचानन मनमोहन मुनिजन सुखकारी। \n शतकोटीचें बीज वाचे उच्चारी। \n रघुकुळटिळक रामदासा अन्तरी॥ \n\n जय देव जय देव जय श्रीशंकरा। \n आरती ओवाळू तुज कर्पुरगौरा॥",
    "दुर्गे दुर्घट भारी तुजविण संसारी। \n अनाथ नाथे अम्बे करुणा विस्तारी। \n वारी वारी जन्म मरणांते वारी। \n हारी पडलो आता संकट निवारी॥ \n\n जय देवी जय देवी महिषासुरमथिनी। \n सुरवर ईश्वर वरदे तारक संजीवनी॥ \n\n त्रिभुवन-भुवनी पाहता तुज ऐसी नाही। \n चारी श्रमले परन्तु न बोलवे काही। \n साही विवाद करिता पडले प्रवाही। \n ते तू भक्तालागी पावसि लवलाही॥ \n\n जय देवी जय देवी महिषासुरमथिनी। \n सुरवर ईश्वर वरदे तारक संजीवनी॥ \n\n प्रसन्न वदने प्रसन्न होसी निजदासा। \n क्लेशांपासुनि सोडवि तोडी भवपाशा। \n अम्बे तुजवाचून कोण पुरविल आशा। \n नरहरी तल्लिन झाला पदपंकजलेशा॥ \n\n जय देवी जय देवी महिषासुरमथिनी \n सुरवर ईश्वर वरदे तारक संजीवनी॥",
     "जय देवी जय देवी जय महालक्ष्मी।\n वससी व्यापकरुपे तू स्थूलसूक्ष्मी॥ \n करवीरपुरवासिनी सुरवरमुनिमाता। \n पुरहरवरदायिनी मुरहरप्रियकान्ता। \n कमलाकारें जठरी जन्मविला धाता। \n सहस्त्रवदनी भूधर न पुरे गुण गातां॥ \n\n जय देवी जय देवी.॥ \n\n मातुलिंग गदा खेटक रविकिरणीं। \n झळके हाटकवाटी पीयुषरसपाणी। \n  माणिकरसना सुरंगवसना मृगनयनी। \n शशिकरवदना राजस मदनाची जननी॥ \n\n जय देवी जय देवी.॥ \n\n तारा शक्ति अगम्या शिवभजकां गौरी। \n सांख्य म्हणती प्रकृती निर्गुण निर्धारी। \n गायत्री निजबीजा निगमागम सारी। \n प्रगटे पद्मावती निजधर्माचारी॥ \n\n जय देवी जय देवी.॥ \n\n अमृतभरिते सरिते अघदुरितें वारीं। \n मारी दुर्घट असुरां भवदुस्तर तारीं। \n वारी मायापटल प्रणमत परिवारी। \n हें रुप चिद्रूप दावी निर्धारी॥ \n\n जय देवी जय देवी.॥ \n\n  चतुराननें कुश्चित कर्मांच्या ओळी। \n लिहिल्या असतिल माते माझे निजभाळी। \n पुसोनि चरणातळी पदसुमने क्षाळी। \n मुक्तेश्वर नागर क्षीरसागरबाळी॥ \n\n जय देवी जय देवी.॥",
    "आरती सप्रेम जय जय विठ्ठल परब्रह्म। \n भक्त संकटिं नानास्वरूपीं स्थापिसि स्वधर्म॥ \n अंबऋषीकारणें गर्भवास सोशीसी। \n वेद नेले चोरूनि ब्रह्मया आणुनियां देसी॥ \n मत्स्यरूपी नारायण सप्तहि सागर धुंडीसी। \n हस्त लागतां शंखासुरा तुझा वर देसी। \n\n रसातळासी जातां पृथ्वी पाठीवर घेसी। \n परोपकरासाठीं देवा कांसव झालासी॥ \n दाढें धरुनी पृथ्वी नेतां वराहरूप होसी।  \n प्रल्हादाकारणें स्तंभीं नरहरि गुरगुरसी। \n\n पांचवे अवतारीं बळिच्या द्वाराला जासी। \n भिक्षे स्थळ मागुनीं बळीला पाताळा नेसी॥  \n  सर्व समर्पण केलं म्हणुनी प्रसन्न त्या होसी। \n  वामनरूप धरुनी बळिच्या द्वारीं तिष्ठसी॥ \n\n सहस्त्रार्जुन मातला जमदग्नीचा वध केला।\n  कष्टी ते रेणुका म्हणुनी सहस्त्रार्जुन वधिला॥ \n  निःक्षत्री पृथ्वी दान दिधली विप्राला। \n सहावा अवतार परशुराम प्रगटला॥ \n\n  मातला रावण सर्वां उपद्रव केला। \n तेहतिस कोटी देव बंदी हरिलें सीतेला॥ \n पितृवचनालागीं रामें वनवास केला। \n मिळोनि वानरसहित राजा राम प्रगटला॥ \n\n देवकीवसुदेवबंदीमोचन त्वां केलें। \n नंदाघरीं जाउनी निजसुख गोकुळा दिधलें। \n गोरसचोरी करितां नवलक्ष गोपाळ मिळविले। \n गोपिकांचे प्रेम देखुनि श्रीकृष्ण भुलले॥ \n\n बौद्ध कलंकी कलियुगीं \nझाला अधर्म हा अवघा। \n सोडुनी दिधला धर्म \nम्हणुनी न दिससी देवा॥ \n म्लेंच्छमर्दन करिसी \nह्मणोनि कलंकी केशवा। \n बहिरवि जान्हवी द्यावी\n निजसुखानंदाची सेवा॥",
    "आरती साईबाबा ।\n सौख्यदातार जीवा । \n चरणरजातली ।\n द्यावा दासा विसावा,\n भक्ता विसावा ।। \n जाळुनियां अनंग ।\n स्वस्वरूपी राहेदंग । \n मुमुक्षूजनां दावी ।\n निज डोळा श्रीरंग । \n जयामनी जैसा भाव ।\n तया तैसा अनुभव । \n दाविसी दयाघना । \n ऐसी तुझीही माव । \n तुमचे नाम ध्याता ।\n हरे संस्कृती व्यथा । \n अगाध तव करणी ।\n मार्ग दाविसी अनाथा । \n कलियुगी अवतार । \n सगुण परब्रह्मः साचार । \n अवतीर्ण झालासे । \n स्वामी दत्त दिगंबर ।। \n आठा दिवसा गुरुवारी । \n भक्त करिती वारी । \n प्रभुपद पहावया ।\n भवभय निवारी ।। \n माझा निजद्रव्यठेवा ।\n तव चरणरज सेवा । \n मागणे हेचि आता ।\n तुम्हा देवाधिदेवा ।।\n इच्छित दिन चातक ।\n निर्मल तोय निजसुख । \n पाजावे माधवा या ।\n सांभाळ आपुली भाक ।।",
  "आरती ज्ञानराजा । \n\n महाकैवल्यतेजा ।\n\n सेविती साधुसंत ।। \n\n मनु वेधला माझा ।। \n\n  लोपलें ज्ञान जगी । \n\n  हित नेणती कोणी । \n\n  अवतार पांडुरंग । \n \n  नाम ठेविले ज्ञानी । \n \n  कनकाचे ताट करी । \n\n उभ्या गोपिका नारी । \n\n नारद तुंबर हो ।।\n\n साम गायन करी । \n \n प्रकट गुह्य बोले । \n\n विश्र्व ब्रम्हाची केलें ।\n\n रामजनार्दनी ।\n\n पायी मस्तक ठेविले ।\n\n आरती ज्ञानराजा ।\n\n महाकैवल्यतेजा ।। \n\nसेविती ।।",
  "युगें अठ्ठावीस विटेवरी उभा। \n वामांगी रखुमाई दिसे दिव्य शोभा। \n पुण्डलिकाचे भेटी परब्रह्म आलें गा। \n चरणी वाहे भीमा उद्धरी जगा॥ \n\n जय देव जय देव जय पाण्डुरंगा। \n रखुमाईवल्लभा राईच्या\n वल्लभा पावें जिवलगा॥\n\n तुळसीमाळा गळां कर ठेवुनि कटीं।\n कांसे पीताम्बर कस्तुरि लल्लाटी।\n देव सुरवर नित्य येती भेटी। \n गरुड हनुमन्त पुढे उभे राहती॥ \n\n जय देव जय देव जय पाण्डुरंगा। \n रखुमाईवल्लभा राईच्या \n वल्लभा पावें जिवलगा॥ \n\n धन्य वेणुनाद अनुक्षेत्रपाळा। \n सुवर्णाची कमळे वनमाळा गळां। \n राही रखुमाबाई राणीया सकळा। \n ओवाळिती राजा विठोबा सांवळा॥ \n\n  जय देव जय देव जय पाण्डुरंगा। \n रखुमाईवल्लभा राईच्या \n वल्लभा पावें जिवलगा॥ \n\n ओवाळूं आरत्या कुर्वण्ड्या येती। \n चन्द्रभागेमाजी सोडुनियां देती। \n दिंड्या पताका वैष्णव नाचती। \n पंढरीचा महिमा वर्णावा किती॥ \n\n जय देव जय देव जय पाण्डुरंगा। \n रखुमाईवल्लभा राईच्या \n वल्लभा पावें जिवलगा॥ \n\n आषाढी कार्तिकी भक्तजन येती। \n चन्द्रभागेमाजी स्नाने जे करिती। \n दर्शनहेळामात्रें तयां होय मुक्ती। \n केशवासी नामदेव भावे ओंवाळिती॥ \n\n जय देव जय देव जय पाण्डुरंगा। \n रखुमाईवल्लभा राईच्या \n वल्लभा पावें जिवलगा॥",
  "त्रिगुणात्मक त्रैमूर्ती दत्त हा जाणा।\n त्रिगुणी अवतार त्रेलोक्य राणा ।।\n नेती नेती शब्द न ये अनुमाना । \n सुरवर मुनिजन योगी समाधी न ये ध्याना \n\n जय देव जयदेव जय श्री गुरुदत्ता। \n आरती ओवाळिता हरली भवचिंता।\n जय देव जय देव।\n\nसबाह्य अभ्यंतरीं तू एक दत्त।\n अभाग्यासी कैंची कळेल ही मात ।।\nपरा ही परतली तेथे कैंचा हा हेत ।\n जन्मरमरण्याचा पुरलासे अंत \nजय देव जय देव\n\nदत्त येऊनिया उभा ठाकला ।\n सद्भावे साष्टांग प्रणिपात केला ।।\nप्रसन्न होऊनिया आशीर्वाद दिधला ।\n जन्ममरण्याचा फेरा चुकविला \n जय देव जय देव\n\nदत्त दत्त ऐसे लागले ध्यान।\n हारपले मन झाले उन्मन ।।\nमीतूंपणाची झाली बोळवण ।\n एका जनार्दनीं श्री दत्त ध्यान \nजय देव जय देव",
  "ओवालू आरती मदनगोपाळा। \n श्यामसुन्दर गळा लं वैजयन्तीमाळा॥ \n चरणकमल ज्याचे अति सुकुमार। \n ध्वजवज्रानकुश ब्रीदाचा तोडर॥ \n\n ओवालू आरती मदनगोपाळा.॥ \n\n नाभीकमळ ज्याचेब्रह्मयाचे स्थान। \n ह्रीदयीन पदक शोभे श्रीवत्सलांछन॥ \n\n ओवालू आरती मदनगोपाळा.॥ \n\n मुखकमळा पाहता सूर्याचिया कोटी। \n वेधीयेले मानस हारपली धृष्टी॥ \n\n ओवालू आरती मदनगोपाळा.॥ \n\n जडित मुगुट ज्याच्या देदीप्यमान। \n  तेणे तेजे कोदले अवघे त्रिभुवन॥ \n\n ओवालू आरती मदनगोपाळा.॥ \n\n एका जनार्दनी देखियले रूप। \n रूप पाहों जाता झालेसें तद्रूप॥ \n\n ओवालू आरती मदनगोपाळा.॥",
  "त्रिभुवनमंडितमाळ गळां। \n आरती ओवाळूं पाहूं ब्रह्मपुतळा॥ \n\nश्रीराम जय राम जय जय राम। \nआरती ओवाळूं पाहूं सुन्दर मेघश्यामा॥\n\nठकाराचे ठाण वारीं धनुष्यबाण। \nमारुती सन्मुख उभा कर जोडून॥\n\n श्रीराम जय राम जय जय राम। \nआरती ओवाळूं पाहूं सुन्दर मेघश्यामा॥ \n\nभरत शत्रुघ्न दोघे चामर ढाळिती।\n स्वर्गाहून देव पुष्पवृष्टि करिती॥\n\nश्रीराम जय राम जय जय राम।\nआरती ओवाळूं पाहूं सुन्दर मेघश्यामा॥\n\nरत्नजडित हार वर्णू काय मुकुटी।\nआरती ओवाळूं चौदां भुवनांच्या कोटी॥\n\nश्रीराम जय राम जय जय राम।\nआरती ओवाळूं पाहूं सुन्दर मेघश्यामा॥\n\nविष्णुदास नामा म्हणे मागतो तूतें।\nआरती ओंवाळूं पाहूं सीतापतीतें॥\n\nश्रीराम जय राम जय जय राम।\n आरती ओवाळूं पाहूं सुन्दर मेघश्यामा॥"];

  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitIdOfAarthiScreen,
      request: const AdRequest(),
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

    return Scaffold(
        backgroundColor: kmarroncolor,
        appBar:AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text(aarthilist[listIndex],
              style: GoogleFonts.poppins(
                  letterSpacing: 0.8, fontSize: 22, color: kmarroncolor,fontWeight: FontWeight.bold))),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Expanded(
                      flex:1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/side.png",height: 30,width: 30.0)),
                    ),
                    Expanded(
                        flex:5,
                        child: Center(child: Image.asset("assets/images/bottom.png",height: 50,width: 300.0))),
                    Expanded(
                      flex:1,
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset("assets/images/side.png",height: 30,width: 30.0)),
                    ),

                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      RotatedBox(
                        quarterTurns: -1,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                      ),
                      const SizedBox(height: 20.0,),
                      Image.asset("assets/images/side.png",height: 30,width: 30.0),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                      ),
                      const SizedBox(height: 20.0,),
                      Image.asset("assets/images/side.png",height: 30,width: 30.0),
                      const SizedBox(height: 20.0,),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                      ),
                      const SizedBox(height: 20.0,),
                      Image.asset("assets/images/side.png",height: 30,width: 30.0),
                      const SizedBox(height: 20.0,),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 5,
                    child:
                      aarthilist[listIndex].toString()=="|| ज्ञानराजा आरती ||"?
                      Center(child: Text(aarthiMain[listIndex],style: GoogleFonts.brygada1918(fontSize: 24, color: kprimarycolor,height: 1),textAlign: TextAlign.center,))
                      :
                      Center(child: Text(aarthiMain[listIndex],style: GoogleFonts.brygada1918(fontSize: 24, color: kprimarycolor,height: 1.5),textAlign: TextAlign.center,))),


                  Column(
                    children: [
                      RotatedBox(
                        quarterTurns: -1,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                      ),
                      const SizedBox(height: 20.0,),
                      Image.asset("assets/images/side.png",height: 30,width: 30.0),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                      ),
                      const SizedBox(height: 20.0,),
                      Image.asset("assets/images/side.png",height: 30,width: 30.0),
                      const SizedBox(height: 20.0,),

                      RotatedBox(
                        quarterTurns: 1,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                      ),
                      const SizedBox(height: 20.0,),
                      Image.asset("assets/images/side.png",height: 30,width: 30.0),
                      const SizedBox(height: 20.0,),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                      ),

                    ],
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex:1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/side.png",height: 30,width: 30.0)),
                    ),
                    Expanded(
                        flex:5,
                        child: Center(child: Image.asset("assets/images/bottom.png",height: 50,width: 300.0))),
                    Expanded(
                      flex:1,
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset("assets/images/side.png",height: 30,width: 30.0)),
                    ),
                  ],
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
}
