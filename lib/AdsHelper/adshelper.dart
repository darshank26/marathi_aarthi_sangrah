import 'dart:io';

class AdHelper {

  static String get bannerAdUnitIdOfHomeScreen {
    if (Platform.isAndroid) {
      // return 'ca-app-pub-3940256099942544/6300978111';
      return  'ca-app-pub-2180535035689124/9239292706';
    }  else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get bannerAdUnitIdOfAarthiScreen {
    if (Platform.isAndroid) {
      // return 'ca-app-pub-3940256099942544/6300978111';
      return  'ca-app-pub-2180535035689124/9047721018';
    }  else {
      throw UnsupportedError('Unsupported platform');
    }
  }

}