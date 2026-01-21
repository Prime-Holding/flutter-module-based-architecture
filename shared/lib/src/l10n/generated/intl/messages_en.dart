// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(theError) => "Error: ${theError}";

  static String m1(fieldName) => "${fieldName} should not be empty";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accessDenied": MessageLookupByLibrary.simpleMessage(
      "You don\'t have access to this resource.",
    ),
    "appBarText": MessageLookupByLibrary.simpleMessage("Error page!"),
    "appBarTitle": MessageLookupByLibrary.simpleMessage("MFA"),
    "appleLogin": MessageLookupByLibrary.simpleMessage("Sign in with Apple"),
    "badRequest": MessageLookupByLibrary.simpleMessage(
      "Bad or malformed request.",
    ),
    "biometricsDisabled": MessageLookupByLibrary.simpleMessage(
      "Your biometrics are disabled!",
    ),
    "biometricsEnabled": MessageLookupByLibrary.simpleMessage(
      "Your biometrics are enabled!",
    ),
    "biometricsNotSetup": MessageLookupByLibrary.simpleMessage(
      "To use biometrics, you need to turn it on in your device settings!",
    ),
    "biometricsNotSupported": MessageLookupByLibrary.simpleMessage(
      "You don\'t have biometric feature on your device!",
    ),
    "bulgarian": MessageLookupByLibrary.simpleMessage("Bulgarian"),
    "buttons": MessageLookupByLibrary.simpleMessage("Buttons"),
    "cancel": MessageLookupByLibrary.simpleMessage(
      "Multi-Factor Authentication canceled",
    ),
    "changeAddressActionDescription": MessageLookupByLibrary.simpleMessage(
      "Fill the address fields and click save to trigger the MFA process. \n - Use \"0000\" for the PIN and OTP code to complete the flow. \n - Use \"3333\" for OTP code to fail the flow.",
    ),
    "changeAddressActionTitle": MessageLookupByLibrary.simpleMessage(
      "The address component below demonstrates the MFA (PIN and OTP) feature.",
    ),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("Change Language"),
    "changePin": MessageLookupByLibrary.simpleMessage("Change pin code"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "commonComponents": MessageLookupByLibrary.simpleMessage(
      "Common Components",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmPin": MessageLookupByLibrary.simpleMessage("Confirm pin code"),
    "conflict": MessageLookupByLibrary.simpleMessage(
      "The resource already exists.",
    ),
    "connectionRefused": MessageLookupByLibrary.simpleMessage(
      "Unable to connect to server. Connection refused. Check if the local server is up and running then try again.",
    ),
    "counterAppBarTitle": MessageLookupByLibrary.simpleMessage("Counter"),
    "counterPageTitle": MessageLookupByLibrary.simpleMessage("Counter sample"),
    "counterShowcase": MessageLookupByLibrary.simpleMessage("Counter Showcase"),
    "counterShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Demonstrates a simple counter functionality.",
    ),
    "createPin": MessageLookupByLibrary.simpleMessage("Create pin code"),
    "createPinPage": MessageLookupByLibrary.simpleMessage("Create pin page"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "decrement": MessageLookupByLibrary.simpleMessage("Decrement"),
    "deepLinkFlowPageTitle": MessageLookupByLibrary.simpleMessage(
      "Deep link flow",
    ),
    "deepLinkShowcase": MessageLookupByLibrary.simpleMessage(
      "Deep Links Showcase",
    ),
    "deepLinkShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Demonstrates deep linking capabilities.",
    ),
    "displaysTextAfterLoaded": MessageLookupByLibrary.simpleMessage(
      "Displays Text after loaded",
    ),
    "editAddress": MessageLookupByLibrary.simpleMessage("EditAddress"),
    "editAddressAddressButtonText": MessageLookupByLibrary.simpleMessage(
      "Save",
    ),
    "editAddressAddressChangedMessage": MessageLookupByLibrary.simpleMessage(
      "You\'ve successfully changed your address data",
    ),
    "editAddressAddressEmptyLabel": MessageLookupByLibrary.simpleMessage(
      "Add address",
    ),
    "editAddressAddressLabelText": MessageLookupByLibrary.simpleMessage(
      "Address",
    ),
    "editAddressCardFieldLabel": MessageLookupByLibrary.simpleMessage(
      "Contact Address",
    ),
    "editAddressCityButtonText": MessageLookupByLibrary.simpleMessage("Save"),
    "editAddressCityEmptyLabel": MessageLookupByLibrary.simpleMessage(
      "Add city",
    ),
    "editAddressCityLabelText": MessageLookupByLibrary.simpleMessage("City"),
    "editAddressCountryLabelText": MessageLookupByLibrary.simpleMessage(
      "Country",
    ),
    "editAddressCountrySearchPickerHintText":
        MessageLookupByLibrary.simpleMessage("Search by country name"),
    "editAddressCountrySearchPickerRetryText":
        MessageLookupByLibrary.simpleMessage("Retry"),
    "editAddressCountrySearchPickerTitle": MessageLookupByLibrary.simpleMessage(
      "Choose country",
    ),
    "editAddressHeaderTitle": MessageLookupByLibrary.simpleMessage(
      "Contact Address",
    ),
    "editAddressPermanentAddressContentMessage":
        MessageLookupByLibrary.simpleMessage(
          "This is your permanent address content message.\nTo change the address, you must set Show read only address to false.",
        ),
    "editAddressSaveButtonText": MessageLookupByLibrary.simpleMessage("Save"),
    "editFields": MessageLookupByLibrary.simpleMessage("Edit Fields"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "enableNotificationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Notifications enabled successfully",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterCurrentPin": MessageLookupByLibrary.simpleMessage(
      "Enter current pin",
    ),
    "enterIPAddress": MessageLookupByLibrary.simpleMessage(
      "Please, enter the IP address of the computer from your local network - where you have the Software for Proxying Charles started.",
    ),
    "enterNewPin": MessageLookupByLibrary.simpleMessage("Enter new pin"),
    "error": m0,
    "errorModalSheet": MessageLookupByLibrary.simpleMessage(
      "Error Modal Sheet",
    ),
    "errorOccurred": MessageLookupByLibrary.simpleMessage("An error occurred."),
    "errorState": MessageLookupByLibrary.simpleMessage("Error occurred"),
    "facebookLogin": MessageLookupByLibrary.simpleMessage(
      "Login with Facebook",
    ),
    "fieldHintMessage": MessageLookupByLibrary.simpleMessage(
      "Enter your message",
    ),
    "fieldMessageLabel": MessageLookupByLibrary.simpleMessage("Message"),
    "fillButtonText": MessageLookupByLibrary.simpleMessage("Save"),
    "googleAuthError": MessageLookupByLibrary.simpleMessage(
      "Google authorization failed",
    ),
    "googleLogin": MessageLookupByLibrary.simpleMessage("Sign in with Google"),
    "gradientFillButton": MessageLookupByLibrary.simpleMessage(
      "GradientFillButton",
    ),
    "gradientFillButtonDisabled": MessageLookupByLibrary.simpleMessage(
      "GradientFillButton - disabled",
    ),
    "headerValue": MessageLookupByLibrary.simpleMessage("Enter your data"),
    "hint": MessageLookupByLibrary.simpleMessage(
      "*hint* The correct code might be 0000",
    ),
    "iconTextButton": MessageLookupByLibrary.simpleMessage("IconTextButton"),
    "increment": MessageLookupByLibrary.simpleMessage("Increment"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email",
    ),
    "invalidMessage": MessageLookupByLibrary.simpleMessage(
      "The entered message should be at least 2 characters long.",
    ),
    "invalidUrl": MessageLookupByLibrary.simpleMessage("Invalid URL"),
    "itemPickerMultiSelect": MessageLookupByLibrary.simpleMessage(
      "ItemPicker - multi select",
    ),
    "itemPickerSingleSelect": MessageLookupByLibrary.simpleMessage(
      "ItemPicker - single select",
    ),
    "loadingState": MessageLookupByLibrary.simpleMessage("Loading..."),
    "logIn": MessageLookupByLibrary.simpleMessage("Log in with Email"),
    "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
    "loginCredentialsHint": MessageLookupByLibrary.simpleMessage(
      "Enter your login credentials: \n A valid email address. \n At least 6 characters password.",
    ),
    "loginPageTitle": MessageLookupByLibrary.simpleMessage("Login sample"),
    "mfaShowcase": MessageLookupByLibrary.simpleMessage("MFA Showcase"),
    "mfaShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Showcases multi-factor authentication.",
    ),
    "modalSheetWithMessage": MessageLookupByLibrary.simpleMessage(
      "Modal Sheet with message",
    ),
    "nameValue": MessageLookupByLibrary.simpleMessage("John"),
    "navCounter": MessageLookupByLibrary.simpleMessage("Counter"),
    "navLinks": MessageLookupByLibrary.simpleMessage("Links"),
    "navProfile": MessageLookupByLibrary.simpleMessage("Profile"),
    "navShowcase": MessageLookupByLibrary.simpleMessage("Showcase"),
    "navWidgetToolkit": MessageLookupByLibrary.simpleMessage("Widgets"),
    "network": MessageLookupByLibrary.simpleMessage(
      "A network error occurred.",
    ),
    "noConnection": MessageLookupByLibrary.simpleMessage(
      "It looks like your device is not connected to the internet. Please check your settings.",
    ),
    "noMailApp": MessageLookupByLibrary.simpleMessage(
      "No e-mail client found on your device. Please, install one or open your mail provider with a browser.",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Resource not found."),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "This feature is not implemented",
    ),
    "notificationPageTitle": MessageLookupByLibrary.simpleMessage(
      "Notification sample",
    ),
    "notificationPermissionRequestText": MessageLookupByLibrary.simpleMessage(
      "Request notification permissions",
    ),
    "notificationRedirecing": MessageLookupByLibrary.simpleMessage(
      "This is a redirecting notification",
    ),
    "notificationShowDelayedText": MessageLookupByLibrary.simpleMessage(
      "Show notification after 5 seconds",
    ),
    "notificationShowRedirectingText": MessageLookupByLibrary.simpleMessage(
      "Show redirecting notification",
    ),
    "notificationShowText": MessageLookupByLibrary.simpleMessage(
      "Show notification",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "notificationsDelayed": MessageLookupByLibrary.simpleMessage(
      "This is a delayed notification!",
    ),
    "notificationsDisabledMessage": MessageLookupByLibrary.simpleMessage(
      "Seems that you have denied notifications on this device. In order for us to show notifications, they need to be manually enabled from the device settings.",
    ),
    "notificationsMessage": MessageLookupByLibrary.simpleMessage(
      "This is a notification!",
    ),
    "notificationsPageConfig": MessageLookupByLibrary.simpleMessage(
      "When Firebase Cloud Messaging (FCM) is initialized, a FCM token is generated for the device. You can use this token to receive notifications while the app is in foreground, background or even terminated.",
    ),
    "notificationsPageDescription": MessageLookupByLibrary.simpleMessage(
      "In order to receive push notifications on your device, you need first to grant access to them. This applies for iOS and Web, as the permissions on Android are granted upfront.",
    ),
    "notificationsPermissionsDenied": MessageLookupByLibrary.simpleMessage(
      "Seems that you have denied notifications on this device. In order for us to show notifications, they need to be manually enabled from the device settings.",
    ),
    "notificationsTurnedOff": MessageLookupByLibrary.simpleMessage(
      "Your Notifications were turned off successfully!",
    ),
    "notificationsTurnedOn": MessageLookupByLibrary.simpleMessage(
      "Your Notifications were turned on successfully!",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "openModalSheet": MessageLookupByLibrary.simpleMessage("Open modal sheet"),
    "openUrlWidgetCallAPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "OpenUrlWidget - call a phone number",
    ),
    "openUrlWidgetLaunchURLLink": MessageLookupByLibrary.simpleMessage(
      "OpenUrlWidget - launch URL link",
    ),
    "otp": MessageLookupByLibrary.simpleMessage("OTP and Pin"),
    "otpPageTitle": MessageLookupByLibrary.simpleMessage("OTP feature Example"),
    "otpShowcase": MessageLookupByLibrary.simpleMessage("OTP Showcase"),
    "otpShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Demonstrates one-time password functionality.",
    ),
    "outlineFillButton": MessageLookupByLibrary.simpleMessage(
      "OutlineFillButton",
    ),
    "pageDescription": MessageLookupByLibrary.simpleMessage(
      "The purpose of this page is to showcase how to return data to the parent page and process it. Enter your message and press the submit button.",
    ),
    "pageWithResult": MessageLookupByLibrary.simpleMessage("Enter message"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordLength": MessageLookupByLibrary.simpleMessage(
      "Password should be at least 6 characters long",
    ),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "pickers": MessageLookupByLibrary.simpleMessage("Pickers"),
    "pinBiometrics": MessageLookupByLibrary.simpleMessage("Pin Biometrics"),
    "pinCodeMismatch": MessageLookupByLibrary.simpleMessage(
      "Pin codes do not match. Please try again.",
    ),
    "pinCreatedMessage": MessageLookupByLibrary.simpleMessage(
      "Pin was created successfully",
    ),
    "pinUpdatedMessage": MessageLookupByLibrary.simpleMessage(
      "Pin was updated successfully",
    ),
    "presentErrorInModal": MessageLookupByLibrary.simpleMessage(
      "Present error in modal",
    ),
    "primeHoldingUrl": MessageLookupByLibrary.simpleMessage(
      "https://www.primeholding.com/",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profilePageChangeLanguageButton": MessageLookupByLibrary.simpleMessage(
      "Change Languge",
    ),
    "profilePageEnableNotificationText": MessageLookupByLibrary.simpleMessage(
      "Enable notification",
    ),
    "profilePageNotificationsButton": MessageLookupByLibrary.simpleMessage(
      "Notification sample",
    ),
    "proxy": MessageLookupByLibrary.simpleMessage("proxy"),
    "qrCodePageTitle": MessageLookupByLibrary.simpleMessage("Qr Code Example"),
    "qrCodeShowcase": MessageLookupByLibrary.simpleMessage(
      "Qr Scanner Showcase",
    ),
    "qrCodeShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Displays QR code scanning functionality.",
    ),
    "reload": MessageLookupByLibrary.simpleMessage("Reload"),
    "requiredField": m1,
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
    "restartApp": MessageLookupByLibrary.simpleMessage(
      "After you save the IP, to apply the change, please restart your application!",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "runInterceptor": MessageLookupByLibrary.simpleMessage(
      "Run HTTP Interceptor",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "searchPicker": MessageLookupByLibrary.simpleMessage("Search Picker"),
    "selectAFewItems": MessageLookupByLibrary.simpleMessage(
      "Select a few items",
    ),
    "selectASingleItem": MessageLookupByLibrary.simpleMessage(
      "Select a single item",
    ),
    "selectAnItemFromLongList": MessageLookupByLibrary.simpleMessage(
      "Select an item from a long list",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage("Select country"),
    "selectOneItem": MessageLookupByLibrary.simpleMessage("Select one item"),
    "selectedItem": MessageLookupByLibrary.simpleMessage("Selected Item:"),
    "selectedItems": MessageLookupByLibrary.simpleMessage("Selected Items:"),
    "server": MessageLookupByLibrary.simpleMessage(
      "An error occurred and the request could not be processed. Please try again later.",
    ),
    "shimmerWrapper": MessageLookupByLibrary.simpleMessage("Shimmer Wrapper"),
    "showcaseTitle": MessageLookupByLibrary.simpleMessage("Showcase Page"),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "success": MessageLookupByLibrary.simpleMessage(
      "Successfully finished the action",
    ),
    "textFieldButtonText": MessageLookupByLibrary.simpleMessage("Save"),
    "textFieldDialog": MessageLookupByLibrary.simpleMessage("TextFieldDialog"),
    "textFieldLabel": MessageLookupByLibrary.simpleMessage("First Name"),
    "textShimmer": MessageLookupByLibrary.simpleMessage("Text Shimmer"),
    "thereAreNoResults": MessageLookupByLibrary.simpleMessage(
      "There are no results for the searched query!",
    ),
    "thisIsAnErrorMessage": MessageLookupByLibrary.simpleMessage(
      "This is an error message",
    ),
    "thisIsAnInformativeMessage": MessageLookupByLibrary.simpleMessage(
      "This is an informative message",
    ),
    "token": MessageLookupByLibrary.simpleMessage("Push notification token"),
    "tooLong": MessageLookupByLibrary.simpleMessage(
      "The entered text is too long",
    ),
    "tooShort": MessageLookupByLibrary.simpleMessage(
      "The entered text is too short",
    ),
    "translatedError": MessageLookupByLibrary.simpleMessage("translated error"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
    "typeSubstring": MessageLookupByLibrary.simpleMessage("Type substring"),
    "unknown": MessageLookupByLibrary.simpleMessage(
      "Oops, something went wrong. Please try again.",
    ),
    "unlockActionDescription": MessageLookupByLibrary.simpleMessage(
      "Tap on the button to trigger the MFA process. \n - Use \"0000\" for the pin.",
    ),
    "unlockActionTitle": MessageLookupByLibrary.simpleMessage(
      "The button below demonstrates the MFA (PIN) feature.",
    ),
    "unlockButtonText": MessageLookupByLibrary.simpleMessage("Unlock"),
    "updatePinPage": MessageLookupByLibrary.simpleMessage("Update pin page"),
    "verifyPinCodePage": MessageLookupByLibrary.simpleMessage(
      "Verify pin code page",
    ),
    "widgetToolkitShowcase": MessageLookupByLibrary.simpleMessage(
      "Widget Toolkit Showcase",
    ),
    "widgetToolkitShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Showcases various reusable widgets.",
    ),
    "wrongConfirmationPin": MessageLookupByLibrary.simpleMessage(
      "Wrong confirmation pin",
    ),
    "wrongEmailOrPassword": MessageLookupByLibrary.simpleMessage(
      "Wrong email or password",
    ),
    "wrongPin": MessageLookupByLibrary.simpleMessage("Wrong pin"),
  };
}
