// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:widget_toolkit/edit_address.dart';
import 'package:widget_toolkit/search_picker.dart';

import '../repositories/search_repository.dart';

class SearchService extends SearchPickerService<CountryModel> {
  SearchService(this._searchRepository);

  final SearchCountryRepository<CountryModel> _searchRepository;

  @override
  Future<List<CountryModel>> getItems() => _searchRepository.searchList;

  @override
  List<CountryModel> getPlaceholderList() =>
      List.generate(5, (index) => CountryModel.empty());
}
