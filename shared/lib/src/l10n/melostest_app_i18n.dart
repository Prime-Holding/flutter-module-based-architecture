// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../assets.dart';
import 'network_lookup/counter_lookup.dart';
import 'network_lookup/deep_link_lookup.dart';
import 'network_lookup/enter_message_lookup.dart';
import 'network_lookup/error_lookup.dart';
import 'network_lookup/field_lookup.dart';
import 'network_lookup/lib_change_language_lookup.dart';
import 'network_lookup/lib_dev_menu_lookup.dart';
import 'network_lookup/lib_pin_code_lookup.dart';
import 'network_lookup/lib_router_lookup.dart';
import 'network_lookup/login_lookup.dart';
import 'network_lookup/mfa_lookup.dart';
import 'network_lookup/notifications_lookup.dart';
import 'network_lookup/otp_lookup.dart';
import 'network_lookup/profile_lookup.dart';
import 'network_lookup/qr_code_lookup.dart';
import 'network_lookup/showcase_lookup.dart';
import 'network_lookup/util.dart';
import 'network_lookup/widget_toolkit_lookup.dart';

class AppI18n extends I18n {
  static Locale? locale;

  static const AppI18nDelegate delegate = AppI18nDelegate();

  AppI18n() : super(AppI18nLookup());

  static AppI18n of(BuildContext context) =>
      Localizations.of<AppI18n>(context, AppI18n)!;
}

class AppI18nDelegate extends LocalizationsDelegate<AppI18n> {
  const AppI18nDelegate();

  @override
  Future<AppI18n> load(Locale locale) {
    I18n.delegate.load(locale);
    AppI18n.locale = locale;
    return SynchronousFuture<AppI18n>(AppI18n());
  }

  @override
  bool isSupported(Locale locale) => true;

  @override
  bool shouldReload(AppI18nDelegate old) => true;
}

class AppI18nLookup extends I18nLookup {
  /// region Boilerplate

  @override
  String getString(String key, [Map<String, String>? placeholders]) {
    return getFromNetwork('', key, placeholders) ??
        getFromBundle(AppI18n.locale?.languageCode)
            .getString(key, placeholders)!;
  }

  I18n? bundledI18n;

  I18n getFromBundle(String? languageCode) {
    if (bundledI18n == null) {
      switch (I18n.currentLocale?.languageCode) {
        case 'bg':
          bundledI18n = I18n(I18nLookup_bg());
          break;
        case 'en':
          bundledI18n = I18n(I18nLookup_en());
          break;
        default:
          bundledI18n = I18n(I18nLookup_en());
          break;
      }
    }
    return bundledI18n!;
  }

  /// endregion

  /// region Lookup overrides

  @override
  I18nErrorLookup createErrorLookup() => AppI18nErrorLookup();

  @override
  I18nFieldLookup createFieldLookup() => AppI18nFieldLookup();

  @override
  I18nFeatureLoginLookup createFeatureLoginLookup() => AppI18nLoginLookup();

  @override
  I18nFeatureMfaLookup createFeatureMfaLookup() => AppI18nMfaLookup();

  @override
  I18nFeatureCounterLookup createFeatureCounterLookup() =>
      AppI18nCounterLookup();

  @override
  I18nFeatureDeepLinkLookup createFeatureDeepLinkLookup() =>
      AppI18nDeepLinkLookup();

  @override
  I18nFeatureEnterMessageLookup createFeatureEnterMessageLookup() =>
      AppI18nEnterMessageLookup();

  @override
  I18nFeatureNotificationsLookup createFeatureNotificationsLookup() =>
      AppI18nNotificationsLookup();

  @override
  I18nFeatureOtpLookup createFeatureOtpLookup() => AppI18nOtpLookup();

  @override
  I18nFeatureProfileLookup createFeatureProfileLookup() =>
      AppI18nProfileLookup();

  @override
  I18nFeatureWidgetToolkitLookup createFeatureWidgetToolkitLookup() =>
      AppI18nWidgetToolkitLookup();

  @override
  I18nLibChangeLanguageLookup createLibChangeLanguageLookup() =>
      AppI18nLibChangeLanguageLookup();

  @override
  I18nLibDevMenuLookup createLibDevMenuLookup() => AppI18nLibDevMenuLookup();

  @override
  I18nLibPinCodeLookup createLibPinCodeLookup() => AppI18nLibPinCodeLookup();

  @override
  I18nLibRouterLookup createLibRouterLookup() => AppI18nLibRouterLookup();

  @override
  I18nFeatureQrLookup createFeatureQrLookup() => AppI18nQrLookup();

  @override
  I18nFeatureShowcaseLookup createFeatureShowcaseLookup() =>
      AppI18nShowcaseLookup();

  /// endregion

  // TODO: Add your custom lookups here
  // First create your lookup file inside the `network_lookup` directory
  // And then wire it up with here as an override
}
