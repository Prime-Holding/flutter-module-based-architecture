// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../../../assets.dart';
import '../melostest_app_i18n.dart';
import 'util.dart';

class AppI18nErrorLookup extends I18nErrorLookup {
  @override
  String getString(String key, [Map<String, String>? placeholders]) {
    return getFromNetwork('error__', key, placeholders) ??
        getFromBundle(AppI18n.locale?.languageCode)
            .getString(key, placeholders)!;
  }

  I18nError? bundledI18n;

  I18nError getFromBundle(String? languageCode) {
    if (bundledI18n == null) {
      switch (I18n.currentLocale?.languageCode) {
        case 'bg':
          bundledI18n = I18nError(I18nErrorLookup_bg());
          break;
        case 'en':
        default:
          bundledI18n = I18nError(I18nErrorLookup_en());
          break;
      }
    }
    return bundledI18n!;
  }
}
