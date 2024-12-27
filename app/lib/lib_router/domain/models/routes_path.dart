// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

class RoutesPath {
  static const showcase = '/showcase';
  static const showcaseOtp = 'otp';
  static const qrCode = 'qrCode';
  static const mfa = 'mfa';
  static const mfaPinBiometrics = '/mfa/pin-biometrics/:transactionId';
  static const mfaOtp = '/mfa/otp/:transactionId';
  static const dashboard = '/dashboard';
  static const profile = '/profile';
  static const verifyPinCode = '/verifyPinCode';
  static const createPin = 'createPin';
  static const updatePin = 'updatePin';
  static const splash = '/splash';
  static const counter = 'counter';
  static const widgetToolkit = 'widget-toolkit';
  static const otpRoute = '/otp-screen';
  static const notifications = 'notifications';
  static const login = '/login';
  static const enterMessage = 'enterMessage';
  static const deepLinks = 'deepLinks';
  static const deepLinkDetails = ':id';
}
