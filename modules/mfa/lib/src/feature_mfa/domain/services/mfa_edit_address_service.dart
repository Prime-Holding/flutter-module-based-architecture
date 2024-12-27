// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';
import 'package:widget_toolkit/edit_address.dart';

class MfaEditAddressService extends EditAddressService<CountryModel> {
  MfaEditAddressService();

  Future<List<CountryModel>> get searchList => Future.delayed(
        const Duration(seconds: 1),
        () => _countriesList
            .map((country) =>
                CountryModel(countryCode: 'US', countryName: country))
            .toList(),
      );

  final _countriesList = [
    'Angola',
    'Bulgaria',
    'Cuba',
    'Egypt',
    'Italy',
    'Angola',
    'Bulgaria',
    'Cuba',
    'Egypt',
    'Italy',
    'Angola',
    'Bulgaria',
    'Cuba',
    'Egypt',
    'Italy'
  ];

  @override
  Future<AddressModel> saveAddress(AddressModel addressModel) async {
    await Future.delayed(const Duration(seconds: 1));
    return addressModel;
  }

  @override
  Future<List<CountryModel>> getCountries() => searchList;

  @override
  List<CountryModel> getCountryPlaceholderList() =>
      List.generate(3, (index) => CountryModel.empty());

  @override
  Future<String> validateCityOnSubmit(String text) async {
    if (text.trim().isEmpty) {
      throw FieldErrorModel<String>(
        errorKey: I18nErrorKeys.tooShort,
        fieldValue: text,
      );
    }
    return text;
  }

  @override
  Future<String> validateStreetOnSubmit(String text) async {
    if (text.trim().isEmpty) {
      throw FieldErrorModel<String>(
        errorKey: I18nErrorKeys.tooShort,
        fieldValue: text,
      );
    }
    return text;
  }

  @override
  void validateCityOnType(String text) {
    if (text.trim().isEmpty) {
      throw FieldErrorModel<String>(
        errorKey: I18nErrorKeys.tooShort,
        fieldValue: text,
      );
    }
  }

  @override
  void validateStreetOnType(String text) {
    if (text.trim().isEmpty) {
      throw FieldErrorModel<String>(
        errorKey: I18nErrorKeys.tooShort,
        fieldValue: text,
      );
    }
  }
}
