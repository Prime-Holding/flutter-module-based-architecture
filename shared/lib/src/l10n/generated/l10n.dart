// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Message`
  String get fieldMessageLabel {
    return Intl.message(
      'Message',
      name: 'fieldMessageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your message`
  String get fieldHintMessage {
    return Intl.message(
      'Enter your message',
      name: 'fieldHintMessage',
      desc: '',
      args: [],
    );
  }

  /// `The purpose of this page is to showcase how to return data to the parent page and process it. Enter your message and press the submit button.`
  String get pageDescription {
    return Intl.message(
      'The purpose of this page is to showcase how to return data to the parent page and process it. Enter your message and press the submit button.',
      name: 'pageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get fillButtonText {
    return Intl.message('Save', name: 'fillButtonText', desc: '', args: []);
  }

  /// `Notification sample`
  String get profilePageNotificationsButton {
    return Intl.message(
      'Notification sample',
      name: 'profilePageNotificationsButton',
      desc: '',
      args: [],
    );
  }

  /// `Change Languge`
  String get profilePageChangeLanguageButton {
    return Intl.message(
      'Change Languge',
      name: 'profilePageChangeLanguageButton',
      desc: '',
      args: [],
    );
  }

  /// `Enable notification`
  String get profilePageEnableNotificationText {
    return Intl.message(
      'Enable notification',
      name: 'profilePageEnableNotificationText',
      desc: '',
      args: [],
    );
  }

  /// `Notifications enabled successfully`
  String get enableNotificationSuccessMessage {
    return Intl.message(
      'Notifications enabled successfully',
      name: 'enableNotificationSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Seems that you have denied notifications on this device. In order for us to show notifications, they need to be manually enabled from the device settings.`
  String get notificationsDisabledMessage {
    return Intl.message(
      'Seems that you have denied notifications on this device. In order for us to show notifications, they need to be manually enabled from the device settings.',
      name: 'notificationsDisabledMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your Notifications were turned on successfully!`
  String get notificationsTurnedOn {
    return Intl.message(
      'Your Notifications were turned on successfully!',
      name: 'notificationsTurnedOn',
      desc: '',
      args: [],
    );
  }

  /// `Your Notifications were turned off successfully!`
  String get notificationsTurnedOff {
    return Intl.message(
      'Your Notifications were turned off successfully!',
      name: 'notificationsTurnedOff',
      desc: '',
      args: [],
    );
  }

  /// `Widgets`
  String get navWidgetToolkit {
    return Intl.message(
      'Widgets',
      name: 'navWidgetToolkit',
      desc: '',
      args: [],
    );
  }

  /// `Common Components`
  String get commonComponents {
    return Intl.message(
      'Common Components',
      name: 'commonComponents',
      desc: '',
      args: [],
    );
  }

  /// `Pickers`
  String get pickers {
    return Intl.message('Pickers', name: 'pickers', desc: '', args: []);
  }

  /// `Edit Fields`
  String get editFields {
    return Intl.message('Edit Fields', name: 'editFields', desc: '', args: []);
  }

  /// `OpenUrlWidget - launch URL link`
  String get openUrlWidgetLaunchURLLink {
    return Intl.message(
      'OpenUrlWidget - launch URL link',
      name: 'openUrlWidgetLaunchURLLink',
      desc: '',
      args: [],
    );
  }

  /// `OpenUrlWidget - call a phone number`
  String get openUrlWidgetCallAPhoneNumber {
    return Intl.message(
      'OpenUrlWidget - call a phone number',
      name: 'openUrlWidgetCallAPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `https://www.primeholding.com/`
  String get primeHoldingUrl {
    return Intl.message(
      'https://www.primeholding.com/',
      name: 'primeHoldingUrl',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Shimmer Wrapper`
  String get shimmerWrapper {
    return Intl.message(
      'Shimmer Wrapper',
      name: 'shimmerWrapper',
      desc: '',
      args: [],
    );
  }

  /// `Text Shimmer`
  String get textShimmer {
    return Intl.message(
      'Text Shimmer',
      name: 'textShimmer',
      desc: '',
      args: [],
    );
  }

  /// `Displays Text after loaded`
  String get displaysTextAfterLoaded {
    return Intl.message(
      'Displays Text after loaded',
      name: 'displaysTextAfterLoaded',
      desc: '',
      args: [],
    );
  }

  /// `Modal Sheet with message`
  String get modalSheetWithMessage {
    return Intl.message(
      'Modal Sheet with message',
      name: 'modalSheetWithMessage',
      desc: '',
      args: [],
    );
  }

  /// `Open modal sheet`
  String get openModalSheet {
    return Intl.message(
      'Open modal sheet',
      name: 'openModalSheet',
      desc: '',
      args: [],
    );
  }

  /// `This is an informative message`
  String get thisIsAnInformativeMessage {
    return Intl.message(
      'This is an informative message',
      name: 'thisIsAnInformativeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error Modal Sheet`
  String get errorModalSheet {
    return Intl.message(
      'Error Modal Sheet',
      name: 'errorModalSheet',
      desc: '',
      args: [],
    );
  }

  /// `Present error in modal`
  String get presentErrorInModal {
    return Intl.message(
      'Present error in modal',
      name: 'presentErrorInModal',
      desc: '',
      args: [],
    );
  }

  /// `This is an error message`
  String get thisIsAnErrorMessage {
    return Intl.message(
      'This is an error message',
      name: 'thisIsAnErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Buttons`
  String get buttons {
    return Intl.message('Buttons', name: 'buttons', desc: '', args: []);
  }

  /// `OutlineFillButton`
  String get outlineFillButton {
    return Intl.message(
      'OutlineFillButton',
      name: 'outlineFillButton',
      desc: '',
      args: [],
    );
  }

  /// `GradientFillButton`
  String get gradientFillButton {
    return Intl.message(
      'GradientFillButton',
      name: 'gradientFillButton',
      desc: '',
      args: [],
    );
  }

  /// `GradientFillButton - disabled`
  String get gradientFillButtonDisabled {
    return Intl.message(
      'GradientFillButton - disabled',
      name: 'gradientFillButtonDisabled',
      desc: '',
      args: [],
    );
  }

  /// `IconTextButton`
  String get iconTextButton {
    return Intl.message(
      'IconTextButton',
      name: 'iconTextButton',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `ItemPicker - single select`
  String get itemPickerSingleSelect {
    return Intl.message(
      'ItemPicker - single select',
      name: 'itemPickerSingleSelect',
      desc: '',
      args: [],
    );
  }

  /// `Select one item`
  String get selectOneItem {
    return Intl.message(
      'Select one item',
      name: 'selectOneItem',
      desc: '',
      args: [],
    );
  }

  /// `Select a single item`
  String get selectASingleItem {
    return Intl.message(
      'Select a single item',
      name: 'selectASingleItem',
      desc: '',
      args: [],
    );
  }

  /// `ItemPicker - multi select`
  String get itemPickerMultiSelect {
    return Intl.message(
      'ItemPicker - multi select',
      name: 'itemPickerMultiSelect',
      desc: '',
      args: [],
    );
  }

  /// `Select a few items`
  String get selectAFewItems {
    return Intl.message(
      'Select a few items',
      name: 'selectAFewItems',
      desc: '',
      args: [],
    );
  }

  /// `Search Picker`
  String get searchPicker {
    return Intl.message(
      'Search Picker',
      name: 'searchPicker',
      desc: '',
      args: [],
    );
  }

  /// `Select an item from a long list`
  String get selectAnItemFromLongList {
    return Intl.message(
      'Select an item from a long list',
      name: 'selectAnItemFromLongList',
      desc: '',
      args: [],
    );
  }

  /// `Select country`
  String get selectCountry {
    return Intl.message(
      'Select country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Type substring`
  String get typeSubstring {
    return Intl.message(
      'Type substring',
      name: 'typeSubstring',
      desc: '',
      args: [],
    );
  }

  /// `There are no results for the searched query!`
  String get thereAreNoResults {
    return Intl.message(
      'There are no results for the searched query!',
      name: 'thereAreNoResults',
      desc: '',
      args: [],
    );
  }

  /// `Selected Items:`
  String get selectedItems {
    return Intl.message(
      'Selected Items:',
      name: 'selectedItems',
      desc: '',
      args: [],
    );
  }

  /// `Selected Item:`
  String get selectedItem {
    return Intl.message(
      'Selected Item:',
      name: 'selectedItem',
      desc: '',
      args: [],
    );
  }

  /// `TextFieldDialog`
  String get textFieldDialog {
    return Intl.message(
      'TextFieldDialog',
      name: 'textFieldDialog',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get textFieldLabel {
    return Intl.message(
      'First Name',
      name: 'textFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `John`
  String get nameValue {
    return Intl.message('John', name: 'nameValue', desc: '', args: []);
  }

  /// `Enter your data`
  String get headerValue {
    return Intl.message(
      'Enter your data',
      name: 'headerValue',
      desc: '',
      args: [],
    );
  }

  /// `EditAddress`
  String get editAddress {
    return Intl.message('EditAddress', name: 'editAddress', desc: '', args: []);
  }

  /// `Save`
  String get textFieldButtonText {
    return Intl.message(
      'Save',
      name: 'textFieldButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Choose country`
  String get editAddressCountrySearchPickerTitle {
    return Intl.message(
      'Choose country',
      name: 'editAddressCountrySearchPickerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search by country name`
  String get editAddressCountrySearchPickerHintText {
    return Intl.message(
      'Search by country name',
      name: 'editAddressCountrySearchPickerHintText',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get editAddressCountrySearchPickerRetryText {
    return Intl.message(
      'Retry',
      name: 'editAddressCountrySearchPickerRetryText',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get editAddressCountryLabelText {
    return Intl.message(
      'Country',
      name: 'editAddressCountryLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get editAddressCityButtonText {
    return Intl.message(
      'Save',
      name: 'editAddressCityButtonText',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get editAddressCityLabelText {
    return Intl.message(
      'City',
      name: 'editAddressCityLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Add city`
  String get editAddressCityEmptyLabel {
    return Intl.message(
      'Add city',
      name: 'editAddressCityEmptyLabel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get editAddressAddressButtonText {
    return Intl.message(
      'Save',
      name: 'editAddressAddressButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get editAddressAddressLabelText {
    return Intl.message(
      'Address',
      name: 'editAddressAddressLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Add address`
  String get editAddressAddressEmptyLabel {
    return Intl.message(
      'Add address',
      name: 'editAddressAddressEmptyLabel',
      desc: '',
      args: [],
    );
  }

  /// `You've successfully changed your address data`
  String get editAddressAddressChangedMessage {
    return Intl.message(
      'You\'ve successfully changed your address data',
      name: 'editAddressAddressChangedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Contact Address`
  String get editAddressCardFieldLabel {
    return Intl.message(
      'Contact Address',
      name: 'editAddressCardFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get editAddressSaveButtonText {
    return Intl.message(
      'Save',
      name: 'editAddressSaveButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Contact Address`
  String get editAddressHeaderTitle {
    return Intl.message(
      'Contact Address',
      name: 'editAddressHeaderTitle',
      desc: '',
      args: [],
    );
  }

  /// `This is your permanent address content message.\nTo change the address, you must set Show read only address to false.`
  String get editAddressPermanentAddressContentMessage {
    return Intl.message(
      'This is your permanent address content message.\nTo change the address, you must set Show read only address to false.',
      name: 'editAddressPermanentAddressContentMessage',
      desc: '',
      args: [],
    );
  }

  /// `Links`
  String get navLinks {
    return Intl.message('Links', name: 'navLinks', desc: '', args: []);
  }

  /// `Deep link flow`
  String get deepLinkFlowPageTitle {
    return Intl.message(
      'Deep link flow',
      name: 'deepLinkFlowPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `*hint* The correct code might be 0000`
  String get hint {
    return Intl.message(
      '*hint* The correct code might be 0000',
      name: 'hint',
      desc: '',
      args: [],
    );
  }

  /// `OTP feature Example`
  String get otpPageTitle {
    return Intl.message(
      'OTP feature Example',
      name: 'otpPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Reload`
  String get reload {
    return Intl.message('Reload', name: 'reload', desc: '', args: []);
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Error occurred`
  String get errorState {
    return Intl.message(
      'Error occurred',
      name: 'errorState',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loadingState {
    return Intl.message('Loading...', name: 'loadingState', desc: '', args: []);
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter message`
  String get pageWithResult {
    return Intl.message(
      'Enter message',
      name: 'pageWithResult',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message('Try again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Profile`
  String get navProfile {
    return Intl.message('Profile', name: 'navProfile', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Bulgarian`
  String get bulgarian {
    return Intl.message('Bulgarian', name: 'bulgarian', desc: '', args: []);
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Showcase`
  String get navShowcase {
    return Intl.message('Showcase', name: 'navShowcase', desc: '', args: []);
  }

  /// `Error page!`
  String get appBarText {
    return Intl.message('Error page!', name: 'appBarText', desc: '', args: []);
  }

  /// `An error occurred.`
  String get errorOccurred {
    return Intl.message(
      'An error occurred.',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Error: {theError}`
  String error(Object theError) {
    return Intl.message(
      'Error: $theError',
      name: 'error',
      desc: '',
      args: [theError],
    );
  }

  /// `Push notification token`
  String get token {
    return Intl.message(
      'Push notification token',
      name: 'token',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter the IP address of the computer from your local network - where you have the Software for Proxying Charles started.`
  String get enterIPAddress {
    return Intl.message(
      'Please, enter the IP address of the computer from your local network - where you have the Software for Proxying Charles started.',
      name: 'enterIPAddress',
      desc: '',
      args: [],
    );
  }

  /// `After you save the IP, to apply the change, please restart your application!`
  String get restartApp {
    return Intl.message(
      'After you save the IP, to apply the change, please restart your application!',
      name: 'restartApp',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `proxy`
  String get proxy {
    return Intl.message('proxy', name: 'proxy', desc: '', args: []);
  }

  /// `Run HTTP Interceptor`
  String get runInterceptor {
    return Intl.message(
      'Run HTTP Interceptor',
      name: 'runInterceptor',
      desc: '',
      args: [],
    );
  }

  /// `Qr Code Example`
  String get qrCodePageTitle {
    return Intl.message(
      'Qr Code Example',
      name: 'qrCodePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pin Biometrics`
  String get pinBiometrics {
    return Intl.message(
      'Pin Biometrics',
      name: 'pinBiometrics',
      desc: '',
      args: [],
    );
  }

  /// `OTP and Pin`
  String get otp {
    return Intl.message('OTP and Pin', name: 'otp', desc: '', args: []);
  }

  /// `Successfully finished the action`
  String get success {
    return Intl.message(
      'Successfully finished the action',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Multi-Factor Authentication canceled`
  String get cancel {
    return Intl.message(
      'Multi-Factor Authentication canceled',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `MFA`
  String get appBarTitle {
    return Intl.message('MFA', name: 'appBarTitle', desc: '', args: []);
  }

  /// `Unlock`
  String get unlockButtonText {
    return Intl.message('Unlock', name: 'unlockButtonText', desc: '', args: []);
  }

  /// `The address component below demonstrates the MFA (PIN and OTP) feature.`
  String get changeAddressActionTitle {
    return Intl.message(
      'The address component below demonstrates the MFA (PIN and OTP) feature.',
      name: 'changeAddressActionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Fill the address fields and click save to trigger the MFA process. \n - Use "0000" for the PIN and OTP code to complete the flow. \n - Use "3333" for OTP code to fail the flow.`
  String get changeAddressActionDescription {
    return Intl.message(
      'Fill the address fields and click save to trigger the MFA process. \n - Use "0000" for the PIN and OTP code to complete the flow. \n - Use "3333" for OTP code to fail the flow.',
      name: 'changeAddressActionDescription',
      desc: '',
      args: [],
    );
  }

  /// `The button below demonstrates the MFA (PIN) feature.`
  String get unlockActionTitle {
    return Intl.message(
      'The button below demonstrates the MFA (PIN) feature.',
      name: 'unlockActionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tap on the button to trigger the MFA process. \n - Use "0000" for the pin.`
  String get unlockActionDescription {
    return Intl.message(
      'Tap on the button to trigger the MFA process. \n - Use "0000" for the pin.',
      name: 'unlockActionDescription',
      desc: '',
      args: [],
    );
  }

  /// `You don't have access to this resource.`
  String get accessDenied {
    return Intl.message(
      'You don\'t have access to this resource.',
      name: 'accessDenied',
      desc: '',
      args: [],
    );
  }

  /// `Bad or malformed request.`
  String get badRequest {
    return Intl.message(
      'Bad or malformed request.',
      name: 'badRequest',
      desc: '',
      args: [],
    );
  }

  /// `The resource already exists.`
  String get conflict {
    return Intl.message(
      'The resource already exists.',
      name: 'conflict',
      desc: '',
      args: [],
    );
  }

  /// `A network error occurred.`
  String get network {
    return Intl.message(
      'A network error occurred.',
      name: 'network',
      desc: '',
      args: [],
    );
  }

  /// `It looks like your device is not connected to the internet. Please check your settings.`
  String get noConnection {
    return Intl.message(
      'It looks like your device is not connected to the internet. Please check your settings.',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unable to connect to server. Connection refused. Check if the local server is up and running then try again.`
  String get connectionRefused {
    return Intl.message(
      'Unable to connect to server. Connection refused. Check if the local server is up and running then try again.',
      name: 'connectionRefused',
      desc: '',
      args: [],
    );
  }

  /// `Resource not found.`
  String get notFound {
    return Intl.message(
      'Resource not found.',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred and the request could not be processed. Please try again later.`
  String get server {
    return Intl.message(
      'An error occurred and the request could not be processed. Please try again later.',
      name: 'server',
      desc: '',
      args: [],
    );
  }

  /// `Oops, something went wrong. Please try again.`
  String get unknown {
    return Intl.message(
      'Oops, something went wrong. Please try again.',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `{fieldName} should not be empty`
  String requiredField(Object fieldName) {
    return Intl.message(
      '$fieldName should not be empty',
      name: 'requiredField',
      desc: '',
      args: [fieldName],
    );
  }

  /// `Please enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password should be at least 6 characters long`
  String get passwordLength {
    return Intl.message(
      'Password should be at least 6 characters long',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `Wrong email or password`
  String get wrongEmailOrPassword {
    return Intl.message(
      'Wrong email or password',
      name: 'wrongEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `The entered message should be at least 2 characters long.`
  String get invalidMessage {
    return Intl.message(
      'The entered message should be at least 2 characters long.',
      name: 'invalidMessage',
      desc: '',
      args: [],
    );
  }

  /// `The entered text is too long`
  String get tooLong {
    return Intl.message(
      'The entered text is too long',
      name: 'tooLong',
      desc: '',
      args: [],
    );
  }

  /// `Google authorization failed`
  String get googleAuthError {
    return Intl.message(
      'Google authorization failed',
      name: 'googleAuthError',
      desc: '',
      args: [],
    );
  }

  /// `The entered text is too short`
  String get tooShort {
    return Intl.message(
      'The entered text is too short',
      name: 'tooShort',
      desc: '',
      args: [],
    );
  }

  /// `Wrong pin`
  String get wrongPin {
    return Intl.message('Wrong pin', name: 'wrongPin', desc: '', args: []);
  }

  /// `Pin codes do not match. Please try again.`
  String get pinCodeMismatch {
    return Intl.message(
      'Pin codes do not match. Please try again.',
      name: 'pinCodeMismatch',
      desc: '',
      args: [],
    );
  }

  /// `No e-mail client found on your device. Please, install one or open your mail provider with a browser.`
  String get noMailApp {
    return Intl.message(
      'No e-mail client found on your device. Please, install one or open your mail provider with a browser.',
      name: 'noMailApp',
      desc: '',
      args: [],
    );
  }

  /// `Invalid URL`
  String get invalidUrl {
    return Intl.message('Invalid URL', name: 'invalidUrl', desc: '', args: []);
  }

  /// `This feature is not implemented`
  String get notImplemented {
    return Intl.message(
      'This feature is not implemented',
      name: 'notImplemented',
      desc: '',
      args: [],
    );
  }

  /// `Create pin code`
  String get createPin {
    return Intl.message(
      'Create pin code',
      name: 'createPin',
      desc: '',
      args: [],
    );
  }

  /// `Change pin code`
  String get changePin {
    return Intl.message(
      'Change pin code',
      name: 'changePin',
      desc: '',
      args: [],
    );
  }

  /// `Update pin page`
  String get updatePinPage {
    return Intl.message(
      'Update pin page',
      name: 'updatePinPage',
      desc: '',
      args: [],
    );
  }

  /// `Create pin page`
  String get createPinPage {
    return Intl.message(
      'Create pin page',
      name: 'createPinPage',
      desc: '',
      args: [],
    );
  }

  /// `Pin was created successfully`
  String get pinCreatedMessage {
    return Intl.message(
      'Pin was created successfully',
      name: 'pinCreatedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Pin was updated successfully`
  String get pinUpdatedMessage {
    return Intl.message(
      'Pin was updated successfully',
      name: 'pinUpdatedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Confirm pin code`
  String get confirmPin {
    return Intl.message(
      'Confirm pin code',
      name: 'confirmPin',
      desc: '',
      args: [],
    );
  }

  /// `Enter current pin`
  String get enterCurrentPin {
    return Intl.message(
      'Enter current pin',
      name: 'enterCurrentPin',
      desc: '',
      args: [],
    );
  }

  /// `Enter new pin`
  String get enterNewPin {
    return Intl.message(
      'Enter new pin',
      name: 'enterNewPin',
      desc: '',
      args: [],
    );
  }

  /// `translated error`
  String get translatedError {
    return Intl.message(
      'translated error',
      name: 'translatedError',
      desc: '',
      args: [],
    );
  }

  /// `To use biometrics, you need to turn it on in your device settings!`
  String get biometricsNotSetup {
    return Intl.message(
      'To use biometrics, you need to turn it on in your device settings!',
      name: 'biometricsNotSetup',
      desc: '',
      args: [],
    );
  }

  /// `You don't have biometric feature on your device!`
  String get biometricsNotSupported {
    return Intl.message(
      'You don\'t have biometric feature on your device!',
      name: 'biometricsNotSupported',
      desc: '',
      args: [],
    );
  }

  /// `Your biometrics are enabled!`
  String get biometricsEnabled {
    return Intl.message(
      'Your biometrics are enabled!',
      name: 'biometricsEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Your biometrics are disabled!`
  String get biometricsDisabled {
    return Intl.message(
      'Your biometrics are disabled!',
      name: 'biometricsDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Verify pin code page`
  String get verifyPinCodePage {
    return Intl.message(
      'Verify pin code page',
      name: 'verifyPinCodePage',
      desc: '',
      args: [],
    );
  }

  /// `Wrong confirmation pin`
  String get wrongConfirmationPin {
    return Intl.message(
      'Wrong confirmation pin',
      name: 'wrongConfirmationPin',
      desc: '',
      args: [],
    );
  }

  /// `Counter`
  String get counterAppBarTitle {
    return Intl.message(
      'Counter',
      name: 'counterAppBarTitle',
      desc: 'Text shown in the AppBar of the Counter Page',
      args: [],
    );
  }

  /// `Counter sample`
  String get counterPageTitle {
    return Intl.message(
      'Counter sample',
      name: 'counterPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Increment`
  String get increment {
    return Intl.message('Increment', name: 'increment', desc: '', args: []);
  }

  /// `Decrement`
  String get decrement {
    return Intl.message('Decrement', name: 'decrement', desc: '', args: []);
  }

  /// `Counter`
  String get navCounter {
    return Intl.message('Counter', name: 'navCounter', desc: '', args: []);
  }

  /// `Login sample`
  String get loginPageTitle {
    return Intl.message(
      'Login sample',
      name: 'loginPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Log in with Email`
  String get logIn {
    return Intl.message('Log in with Email', name: 'logIn', desc: '', args: []);
  }

  /// `Log out`
  String get logOut {
    return Intl.message('Log out', name: 'logOut', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Enter your login credentials: \n A valid email address. \n At least 6 characters password.`
  String get loginCredentialsHint {
    return Intl.message(
      'Enter your login credentials: \n A valid email address. \n At least 6 characters password.',
      name: 'loginCredentialsHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get appleLogin {
    return Intl.message(
      'Sign in with Apple',
      name: 'appleLogin',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get googleLogin {
    return Intl.message(
      'Sign in with Google',
      name: 'googleLogin',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get facebookLogin {
    return Intl.message(
      'Login with Facebook',
      name: 'facebookLogin',
      desc: '',
      args: [],
    );
  }

  /// `Notification sample`
  String get notificationPageTitle {
    return Intl.message(
      'Notification sample',
      name: 'notificationPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Seems that you have denied notifications on this device. In order for us to show notifications, they need to be manually enabled from the device settings.`
  String get notificationsPermissionsDenied {
    return Intl.message(
      'Seems that you have denied notifications on this device. In order for us to show notifications, they need to be manually enabled from the device settings.',
      name: 'notificationsPermissionsDenied',
      desc: '',
      args: [],
    );
  }

  /// `Request notification permissions`
  String get notificationPermissionRequestText {
    return Intl.message(
      'Request notification permissions',
      name: 'notificationPermissionRequestText',
      desc: '',
      args: [],
    );
  }

  /// `Show notification`
  String get notificationShowText {
    return Intl.message(
      'Show notification',
      name: 'notificationShowText',
      desc: '',
      args: [],
    );
  }

  /// `Show notification after 5 seconds`
  String get notificationShowDelayedText {
    return Intl.message(
      'Show notification after 5 seconds',
      name: 'notificationShowDelayedText',
      desc: '',
      args: [],
    );
  }

  /// `Show redirecting notification`
  String get notificationShowRedirectingText {
    return Intl.message(
      'Show redirecting notification',
      name: 'notificationShowRedirectingText',
      desc: '',
      args: [],
    );
  }

  /// `In order to receive push notifications on your device, you need first to grant access to them. This applies for iOS and Web, as the permissions on Android are granted upfront.`
  String get notificationsPageDescription {
    return Intl.message(
      'In order to receive push notifications on your device, you need first to grant access to them. This applies for iOS and Web, as the permissions on Android are granted upfront.',
      name: 'notificationsPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `When Firebase Cloud Messaging (FCM) is initialized, a FCM token is generated for the device. You can use this token to receive notifications while the app is in foreground, background or even terminated.`
  String get notificationsPageConfig {
    return Intl.message(
      'When Firebase Cloud Messaging (FCM) is initialized, a FCM token is generated for the device. You can use this token to receive notifications while the app is in foreground, background or even terminated.',
      name: 'notificationsPageConfig',
      desc: '',
      args: [],
    );
  }

  /// `This is a notification!`
  String get notificationsMessage {
    return Intl.message(
      'This is a notification!',
      name: 'notificationsMessage',
      desc: '',
      args: [],
    );
  }

  /// `This is a delayed notification!`
  String get notificationsDelayed {
    return Intl.message(
      'This is a delayed notification!',
      name: 'notificationsDelayed',
      desc: '',
      args: [],
    );
  }

  /// `This is a redirecting notification`
  String get notificationRedirecing {
    return Intl.message(
      'This is a redirecting notification',
      name: 'notificationRedirecing',
      desc: '',
      args: [],
    );
  }

  /// `Showcase Page`
  String get showcaseTitle {
    return Intl.message(
      'Showcase Page',
      name: 'showcaseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Counter Showcase`
  String get counterShowcase {
    return Intl.message(
      'Counter Showcase',
      name: 'counterShowcase',
      desc: '',
      args: [],
    );
  }

  /// `Demonstrates a simple counter functionality.`
  String get counterShowcaseDescription {
    return Intl.message(
      'Demonstrates a simple counter functionality.',
      name: 'counterShowcaseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Widget Toolkit Showcase`
  String get widgetToolkitShowcase {
    return Intl.message(
      'Widget Toolkit Showcase',
      name: 'widgetToolkitShowcase',
      desc: '',
      args: [],
    );
  }

  /// `Showcases various reusable widgets.`
  String get widgetToolkitShowcaseDescription {
    return Intl.message(
      'Showcases various reusable widgets.',
      name: 'widgetToolkitShowcaseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Qr Scanner Showcase`
  String get qrCodeShowcase {
    return Intl.message(
      'Qr Scanner Showcase',
      name: 'qrCodeShowcase',
      desc: '',
      args: [],
    );
  }

  /// `Displays QR code scanning functionality.`
  String get qrCodeShowcaseDescription {
    return Intl.message(
      'Displays QR code scanning functionality.',
      name: 'qrCodeShowcaseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Deep Links Showcase`
  String get deepLinkShowcase {
    return Intl.message(
      'Deep Links Showcase',
      name: 'deepLinkShowcase',
      desc: '',
      args: [],
    );
  }

  /// `Demonstrates deep linking capabilities.`
  String get deepLinkShowcaseDescription {
    return Intl.message(
      'Demonstrates deep linking capabilities.',
      name: 'deepLinkShowcaseDescription',
      desc: '',
      args: [],
    );
  }

  /// `MFA Showcase`
  String get mfaShowcase {
    return Intl.message(
      'MFA Showcase',
      name: 'mfaShowcase',
      desc: '',
      args: [],
    );
  }

  /// `Showcases multi-factor authentication.`
  String get mfaShowcaseDescription {
    return Intl.message(
      'Showcases multi-factor authentication.',
      name: 'mfaShowcaseDescription',
      desc: '',
      args: [],
    );
  }

  /// `OTP Showcase`
  String get otpShowcase {
    return Intl.message(
      'OTP Showcase',
      name: 'otpShowcase',
      desc: '',
      args: [],
    );
  }

  /// `Demonstrates one-time password functionality.`
  String get otpShowcaseDescription {
    return Intl.message(
      'Demonstrates one-time password functionality.',
      name: 'otpShowcaseDescription',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'bg'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
