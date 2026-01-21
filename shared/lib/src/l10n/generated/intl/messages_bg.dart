// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a bg locale. All the
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
  String get localeName => 'bg';

  static String m0(theError) => "Грешка: ${theError}";

  static String m1(fieldName) => "${fieldName} не трябва да е празно";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accessDenied": MessageLookupByLibrary.simpleMessage(
      "Нямате достъп до този ресурс.",
    ),
    "appBarText": MessageLookupByLibrary.simpleMessage("Страница с грешка!"),
    "appBarTitle": MessageLookupByLibrary.simpleMessage("MFA"),
    "appleLogin": MessageLookupByLibrary.simpleMessage("Вход с Apple"),
    "badRequest": MessageLookupByLibrary.simpleMessage(
      "Лоша или неправилна заявка.",
    ),
    "biometricsDisabled": MessageLookupByLibrary.simpleMessage(
      "Биометричната функция е деактивирана",
    ),
    "biometricsEnabled": MessageLookupByLibrary.simpleMessage(
      "Биометричната функция е активирана",
    ),
    "biometricsNotSetup": MessageLookupByLibrary.simpleMessage(
      "За да използвате биометрика, трябва да я активирате от настройките на устройството!",
    ),
    "biometricsNotSupported": MessageLookupByLibrary.simpleMessage(
      "Устройството Ви няма функция да използва биометрична автентикация",
    ),
    "bulgarian": MessageLookupByLibrary.simpleMessage("български"),
    "buttons": MessageLookupByLibrary.simpleMessage("Бутони"),
    "cancel": MessageLookupByLibrary.simpleMessage(
      "Отмяна на удостоверяването на мултифакторна автентикация",
    ),
    "changeAddressActionDescription": MessageLookupByLibrary.simpleMessage(
      "Попълнете адрес полетата и натиснете \"запази\" за да стартирате двуфакторна (MFA) автентикация. \n - Използвайте \"0000\" за ПИН код и еднократна парола за да завършите успешно процеса. \n - Използвайте \"3333\" за еднократна парола за да завършите процеса с грешка.",
    ),
    "changeAddressActionTitle": MessageLookupByLibrary.simpleMessage(
      "Адрес компонента по-долу демонстрира двуфакторна (MFA) автентикация (ПИН и еднократна парола).",
    ),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("Смени език"),
    "changePin": MessageLookupByLibrary.simpleMessage("Смени пин код"),
    "close": MessageLookupByLibrary.simpleMessage("Затвори"),
    "commonComponents": MessageLookupByLibrary.simpleMessage("Общи компоненти"),
    "confirm": MessageLookupByLibrary.simpleMessage("Потвърдете"),
    "confirmPin": MessageLookupByLibrary.simpleMessage("Потвърди пин код"),
    "conflict": MessageLookupByLibrary.simpleMessage(
      "Ресурсът вече съществува.",
    ),
    "connectionRefused": MessageLookupByLibrary.simpleMessage(
      "Не може да се свърже със сървъра. Връзката е отказана. Проверете дали локалният сървър работи и опитайте отново.",
    ),
    "counterAppBarTitle": MessageLookupByLibrary.simpleMessage("Брояч"),
    "counterPageTitle": MessageLookupByLibrary.simpleMessage("Пример за брояч"),
    "counterShowcase": MessageLookupByLibrary.simpleMessage(
      "Демонстрация на брояч",
    ),
    "counterShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Демонстрация на елементарна функционалност на брояч.",
    ),
    "createPin": MessageLookupByLibrary.simpleMessage("Създай пин код"),
    "createPinPage": MessageLookupByLibrary.simpleMessage("Създаване на пин"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Табло за управление"),
    "decrement": MessageLookupByLibrary.simpleMessage("Намаление"),
    "deepLinkFlowPageTitle": MessageLookupByLibrary.simpleMessage(
      "Поток на дълбоки връзки",
    ),
    "deepLinkShowcase": MessageLookupByLibrary.simpleMessage(
      "Демонстрация на Deep Link-ове",
    ),
    "deepLinkShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Демонстрира възможностите на deep link.",
    ),
    "displaysTextAfterLoaded": MessageLookupByLibrary.simpleMessage(
      "Показва текст след зареждане",
    ),
    "editAddress": MessageLookupByLibrary.simpleMessage("Промени адрес"),
    "editAddressAddressButtonText": MessageLookupByLibrary.simpleMessage(
      "Запази",
    ),
    "editAddressAddressChangedMessage": MessageLookupByLibrary.simpleMessage(
      "Успешно променихте вашия адрес.",
    ),
    "editAddressAddressEmptyLabel": MessageLookupByLibrary.simpleMessage(
      "Добави адрес",
    ),
    "editAddressAddressLabelText": MessageLookupByLibrary.simpleMessage(
      "Адрес",
    ),
    "editAddressCardFieldLabel": MessageLookupByLibrary.simpleMessage(
      "Адрес за контакт",
    ),
    "editAddressCityButtonText": MessageLookupByLibrary.simpleMessage("Запази"),
    "editAddressCityEmptyLabel": MessageLookupByLibrary.simpleMessage(
      "Добави град",
    ),
    "editAddressCityLabelText": MessageLookupByLibrary.simpleMessage("Град"),
    "editAddressCountryLabelText": MessageLookupByLibrary.simpleMessage(
      "Държава",
    ),
    "editAddressCountrySearchPickerHintText":
        MessageLookupByLibrary.simpleMessage("Търси по име на държава"),
    "editAddressCountrySearchPickerRetryText":
        MessageLookupByLibrary.simpleMessage("Опитай отново"),
    "editAddressCountrySearchPickerTitle": MessageLookupByLibrary.simpleMessage(
      "Избери държава",
    ),
    "editAddressHeaderTitle": MessageLookupByLibrary.simpleMessage(
      "Адрес за контакт",
    ),
    "editAddressPermanentAddressContentMessage":
        MessageLookupByLibrary.simpleMessage(
          "Това е вашият постоянен адрес.\nЗа да промените адреса, трябва да промените Show read only address на false.",
        ),
    "editAddressSaveButtonText": MessageLookupByLibrary.simpleMessage("Запази"),
    "editFields": MessageLookupByLibrary.simpleMessage("Полета за редактиране"),
    "email": MessageLookupByLibrary.simpleMessage("Имейл"),
    "enableNotificationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Известията са активирани успешно",
    ),
    "english": MessageLookupByLibrary.simpleMessage("английски"),
    "enterCurrentPin": MessageLookupByLibrary.simpleMessage(
      "Въведи настоящ пин",
    ),
    "enterIPAddress": MessageLookupByLibrary.simpleMessage(
      "Моля, въведете IP адреса на компютъра от вашата локална мрежа - където сте стартирали софтуера за проксииране на Charles.",
    ),
    "enterNewPin": MessageLookupByLibrary.simpleMessage("Въведи нов пин"),
    "error": m0,
    "errorModalSheet": MessageLookupByLibrary.simpleMessage(
      "Модалена страница с грешки",
    ),
    "errorOccurred": MessageLookupByLibrary.simpleMessage("Появи се грешка"),
    "errorState": MessageLookupByLibrary.simpleMessage("Възникна грешка"),
    "facebookLogin": MessageLookupByLibrary.simpleMessage("Вход с Facebook"),
    "fieldHintMessage": MessageLookupByLibrary.simpleMessage(
      "Въведете вашето съобщение",
    ),
    "fieldMessageLabel": MessageLookupByLibrary.simpleMessage("Съобщение"),
    "fillButtonText": MessageLookupByLibrary.simpleMessage("Запази"),
    "googleLogin": MessageLookupByLibrary.simpleMessage("Вход с Google"),
    "gradientFillButton": MessageLookupByLibrary.simpleMessage(
      "Бутон с градиентно запълване",
    ),
    "gradientFillButtonDisabled": MessageLookupByLibrary.simpleMessage(
      "Бутон с градиентно запълване - деактивиран",
    ),
    "headerValue": MessageLookupByLibrary.simpleMessage(
      "Въведети информацията",
    ),
    "hint": MessageLookupByLibrary.simpleMessage(
      "*hint* Правилният код може да бъде 0000",
    ),
    "iconTextButton": MessageLookupByLibrary.simpleMessage(
      "Текстов бутон с икона",
    ),
    "increment": MessageLookupByLibrary.simpleMessage("Увеличаване"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Моля, въведете валиден имейл",
    ),
    "invalidMessage": MessageLookupByLibrary.simpleMessage(
      "Въведеното съобщение трябва да е дълго поне 2 знака.",
    ),
    "invalidUrl": MessageLookupByLibrary.simpleMessage("Невалиден URL адрес"),
    "itemPickerMultiSelect": MessageLookupByLibrary.simpleMessage(
      "Избор на няколко елемента",
    ),
    "itemPickerSingleSelect": MessageLookupByLibrary.simpleMessage(
      "Избор на един елемент",
    ),
    "loadingState": MessageLookupByLibrary.simpleMessage("Зарежда се..."),
    "logIn": MessageLookupByLibrary.simpleMessage("Вход с E-mail"),
    "logOut": MessageLookupByLibrary.simpleMessage("Излезте"),
    "loginCredentialsHint": MessageLookupByLibrary.simpleMessage(
      "Въведете идентификационните си данни за вход: \n Валиден имейл адрес. \n Най-малко 6 знака парола.",
    ),
    "loginPageTitle": MessageLookupByLibrary.simpleMessage("Примерно влизане"),
    "mfaShowcase": MessageLookupByLibrary.simpleMessage(
      "Mногофакторна автентикация",
    ),
    "mfaShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Демонстрира многофакторна автентикация.",
    ),
    "modalSheetWithMessage": MessageLookupByLibrary.simpleMessage(
      "Модалена страница със съобщение",
    ),
    "nameValue": MessageLookupByLibrary.simpleMessage("Джон"),
    "navCounter": MessageLookupByLibrary.simpleMessage("Брояч"),
    "navLinks": MessageLookupByLibrary.simpleMessage("Връзки"),
    "navProfile": MessageLookupByLibrary.simpleMessage("Профил"),
    "navShowcase": MessageLookupByLibrary.simpleMessage(
      "Страница с демонстрации",
    ),
    "navWidgetToolkit": MessageLookupByLibrary.simpleMessage("Компоненти"),
    "network": MessageLookupByLibrary.simpleMessage("Възникна мрежова грешка."),
    "noConnection": MessageLookupByLibrary.simpleMessage(
      "Изглежда, че вашето устройство не е свързано с интернет. Моля, проверете настройките си.",
    ),
    "noMailApp": MessageLookupByLibrary.simpleMessage(
      "Нямате пощенски клиент на устройството. Моля инсталирайте или отворете с браузър.",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Ресурсът не е намерен."),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "Тази функционалност не е завършена",
    ),
    "notificationPageTitle": MessageLookupByLibrary.simpleMessage(
      "Примерно известие",
    ),
    "notificationPermissionRequestText": MessageLookupByLibrary.simpleMessage(
      "Искане на разрешения за уведомяване",
    ),
    "notificationRedirecing": MessageLookupByLibrary.simpleMessage(
      "This is a redirecting notification",
    ),
    "notificationShowDelayedText": MessageLookupByLibrary.simpleMessage(
      "Показване на известие след 5 секунди",
    ),
    "notificationShowRedirectingText": MessageLookupByLibrary.simpleMessage(
      "Показване на известие за пренасочване",
    ),
    "notificationShowText": MessageLookupByLibrary.simpleMessage(
      "Показване на известие",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Известия"),
    "notificationsDelayed": MessageLookupByLibrary.simpleMessage(
      "Това е забавена нотификация!",
    ),
    "notificationsDisabledMessage": MessageLookupByLibrary.simpleMessage(
      "Изглежда, че сте отказали известия на това устройство. За да можем да показваме известия, те трябва да бъдат активирани ръчно от настройките на устройството.",
    ),
    "notificationsMessage": MessageLookupByLibrary.simpleMessage(
      "Това е нотификация!",
    ),
    "notificationsPageConfig": MessageLookupByLibrary.simpleMessage(
      "Когато Firebase Cloud Messaging (FCM) се инициализира, FCM токен се генерира за устройството. Можете да използвате този токен, за да получавате известия, докато приложението е на преден план, на заден план или дори прекратено.",
    ),
    "notificationsPageDescription": MessageLookupByLibrary.simpleMessage(
      "За да получавате насочени известия на вашето устройство, първо трябва да предоставите достъп до тях. Това важи за iOS и уеб, тъй като разрешенията за Android се предоставят предварително.",
    ),
    "notificationsPermissionsDenied": MessageLookupByLibrary.simpleMessage(
      "Изглежда, че сте отказали известия на това устройство. За да можем да показваме известия, те трябва да бъдат активирани ръчно от настройките на устройството.",
    ),
    "notificationsTurnedOff": MessageLookupByLibrary.simpleMessage(
      "Нотификациите ви са успешно изключени!",
    ),
    "notificationsTurnedOn": MessageLookupByLibrary.simpleMessage(
      "Нотификациите ви са успешно Включени!",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("добре"),
    "openModalSheet": MessageLookupByLibrary.simpleMessage(
      "Отворете модална страница",
    ),
    "openUrlWidgetCallAPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Компонент за обаждане на телефонен номер",
    ),
    "openUrlWidgetLaunchURLLink": MessageLookupByLibrary.simpleMessage(
      "Компонент за избор на URL връзка",
    ),
    "otp": MessageLookupByLibrary.simpleMessage("OTP и PIN "),
    "otpPageTitle": MessageLookupByLibrary.simpleMessage("OTP функция пример"),
    "otpShowcase": MessageLookupByLibrary.simpleMessage(
      "Демонстрация на еднократна парола",
    ),
    "otpShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Демонстрира функционалност за автентикация с еднократна парола.",
    ),
    "outlineFillButton": MessageLookupByLibrary.simpleMessage(
      "Очертан и запълнен бутон",
    ),
    "pageDescription": MessageLookupByLibrary.simpleMessage(
      "Целта на тази страница е да покаже как да върнете данни към родителската страница и да ги обработите. Въведете вашето съобщение и натиснете бутона за изпращане.",
    ),
    "pageWithResult": MessageLookupByLibrary.simpleMessage(
      "Въведете съобщение",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Парола"),
    "passwordLength": MessageLookupByLibrary.simpleMessage(
      "Паролата трябва да е дълга поне 6 знака",
    ),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Телефонен номер"),
    "pickers": MessageLookupByLibrary.simpleMessage("Kомпоненти с избиране"),
    "pinBiometrics": MessageLookupByLibrary.simpleMessage("Биометричен PIN"),
    "pinCodeMismatch": MessageLookupByLibrary.simpleMessage(
      "ПИН кодовете не съвпадат. Моля, опитайте отново.",
    ),
    "pinCreatedMessage": MessageLookupByLibrary.simpleMessage(
      "Пин кодът е създаден",
    ),
    "pinUpdatedMessage": MessageLookupByLibrary.simpleMessage(
      "Пин кодът е обновен",
    ),
    "presentErrorInModal": MessageLookupByLibrary.simpleMessage(
      "Настояща грешка в модална страница",
    ),
    "primeHoldingUrl": MessageLookupByLibrary.simpleMessage(
      "https://www.primeholding.com/",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Профил"),
    "profilePageChangeLanguageButton": MessageLookupByLibrary.simpleMessage(
      "Смени език",
    ),
    "profilePageEnableNotificationText": MessageLookupByLibrary.simpleMessage(
      "Aктивиране на известяване",
    ),
    "profilePageNotificationsButton": MessageLookupByLibrary.simpleMessage(
      "Примерно известие",
    ),
    "proxy": MessageLookupByLibrary.simpleMessage("прокси"),
    "qrCodePageTitle": MessageLookupByLibrary.simpleMessage("Пример за QR код"),
    "qrCodeShowcase": MessageLookupByLibrary.simpleMessage(
      "Демонстрация на четец на QR",
    ),
    "qrCodeShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Показва функционалностa за четене на QR кодове.",
    ),
    "reload": MessageLookupByLibrary.simpleMessage("Презареди"),
    "requiredField": m1,
    "resetPassword": MessageLookupByLibrary.simpleMessage("Нулиране на парола"),
    "restartApp": MessageLookupByLibrary.simpleMessage(
      "След като запазите IP, за да приложите промяната, моля, рестартирайте приложението си!",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Опитай отново"),
    "runInterceptor": MessageLookupByLibrary.simpleMessage(
      "Стартирайте HTTP Interceptor",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Запазване"),
    "searchPicker": MessageLookupByLibrary.simpleMessage(
      "Компонент за търсене",
    ),
    "selectAFewItems": MessageLookupByLibrary.simpleMessage(
      "Изберете няколко елемента",
    ),
    "selectASingleItem": MessageLookupByLibrary.simpleMessage(
      "Изберете един елемент",
    ),
    "selectAnItemFromLongList": MessageLookupByLibrary.simpleMessage(
      "Изберете елемент от дълъг списък",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage("Изберете държава"),
    "selectOneItem": MessageLookupByLibrary.simpleMessage(
      "Изберете един елемент",
    ),
    "selectedItem": MessageLookupByLibrary.simpleMessage("Избран елемент:"),
    "selectedItems": MessageLookupByLibrary.simpleMessage("Избрани елементи:"),
    "server": MessageLookupByLibrary.simpleMessage(
      "Възникна грешка и заявката не можа да бъде обработена. Моля, опитайте отново по-късно.",
    ),
    "shimmerWrapper": MessageLookupByLibrary.simpleMessage(
      "Обвивка с анимация",
    ),
    "showcaseTitle": MessageLookupByLibrary.simpleMessage(
      "Страница с демонстрации",
    ),
    "submit": MessageLookupByLibrary.simpleMessage("Изпращане"),
    "success": MessageLookupByLibrary.simpleMessage(
      "Успешно завършено действие",
    ),
    "textFieldButtonText": MessageLookupByLibrary.simpleMessage("Запази"),
    "textFieldDialog": MessageLookupByLibrary.simpleMessage(
      "Диалог в текстово поле",
    ),
    "textFieldLabel": MessageLookupByLibrary.simpleMessage("Първо име"),
    "textShimmer": MessageLookupByLibrary.simpleMessage("Текстовa анимация"),
    "thereAreNoResults": MessageLookupByLibrary.simpleMessage(
      "Няма резултати за търсената заявка!",
    ),
    "thisIsAnErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Това е съобщение за грешка",
    ),
    "thisIsAnInformativeMessage": MessageLookupByLibrary.simpleMessage(
      "Това е информативно съобщение",
    ),
    "token": MessageLookupByLibrary.simpleMessage("Токен за насочено известие"),
    "tooLong": MessageLookupByLibrary.simpleMessage(
      "Въведеният текст е твърде дълъг",
    ),
    "tooShort": MessageLookupByLibrary.simpleMessage(
      "Въведеният текст е твърде кратък",
    ),
    "translatedError": MessageLookupByLibrary.simpleMessage("Преведена грешка"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Опитайте отново"),
    "typeSubstring": MessageLookupByLibrary.simpleMessage("Въведете подниз"),
    "unknown": MessageLookupByLibrary.simpleMessage(
      "Ами сега, нещо се обърка. Моля, опитайте отново.",
    ),
    "unlockActionDescription": MessageLookupByLibrary.simpleMessage(
      "Натиснете бутона за да стартирате еднофакторната (ПИН) автентикация. \n - Използвайте \"0000\" за ПИН.",
    ),
    "unlockActionTitle": MessageLookupByLibrary.simpleMessage(
      "Бутонът по-долу демонстрира еднофакторна (ПИН) автентикация.",
    ),
    "unlockButtonText": MessageLookupByLibrary.simpleMessage("Отключи"),
    "updatePinPage": MessageLookupByLibrary.simpleMessage("Обновяване на пин"),
    "verifyPinCodePage": MessageLookupByLibrary.simpleMessage(
      "Верифициране на пин",
    ),
    "widgetToolkitShowcase": MessageLookupByLibrary.simpleMessage(
      "Демонстрация на компоненти",
    ),
    "widgetToolkitShowcaseDescription": MessageLookupByLibrary.simpleMessage(
      "Демонстрира различни преизползваеми компоненти.",
    ),
    "wrongConfirmationPin": MessageLookupByLibrary.simpleMessage(
      "Грешен пин за потвърждаване",
    ),
    "wrongEmailOrPassword": MessageLookupByLibrary.simpleMessage(
      "Грешен имейл или парола",
    ),
    "wrongPin": MessageLookupByLibrary.simpleMessage("Грешен ПИН код"),
  };
}
