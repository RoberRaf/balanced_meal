import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

enum ThemeCo {
  primary,
  grey,
  reverse,
}

abstract class Helpers {
  static Future customTryCatch(Future Function() func) async {
    try {
      await func();
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
  }

  static String? formatDate(String? date, {bool showDate = true, bool showTime = false}) {
    if (date == null) return null;
    try {
      final parsed = DateTime.parse(date);
      final formateddate = DateFormat('MMM dd, yyyy').format(parsed);
      final formatedTime = DateFormat('jm').format(parsed);
      return showDate ? formateddate + (showTime ? ' $formatedTime' : '') : formatedTime;
    } catch (e) {
      return null;
    }
  }

  static String getProperPrice(num price, {bool showCurrency = true}) {
    final isInt = price % 1 == 0;
    final parsedPrice = ((isInt ? price.toStringAsFixed(0) : price.toStringAsFixed(2)));
    return '${showCurrency ? 'EGP' : ''} $parsedPrice';
  }
}
