// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';
import 'package:widget_toolkit/edit_address.dart';

import '../../data/repositories/search_repository.dart';

class CustomEditAddressService<T> extends EditAddressService<T> {
  CustomEditAddressService({
    required this.searchRepository,
  });

  final SearchCountryRepository<T> searchRepository;

  @override
  Future<AddressModel> saveAddress(AddressModel addressModel) async {
    await Future.delayed(const Duration(seconds: 1));
    return addressModel;
  }

  @override
  Future<List<T>> getCountries() async => await searchRepository.searchList;

  @override
  List<T> getCountryPlaceholderList() =>
      List.generate(3, (index) => CountryModel.empty() as T);

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
