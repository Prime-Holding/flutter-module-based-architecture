// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:widget_toolkit/edit_address.dart';

class SearchCountryRepository<T> {
  Future<List<T>> get searchList => Future.delayed(
        const Duration(seconds: 1),
        () => _countriesList
            .map((country) =>
                CountryModel(countryCode: 'US', countryName: country) as T)
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
}
