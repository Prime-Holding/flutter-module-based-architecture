// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/edit_address.dart';

import '../repositories/search_repository.dart';
import '../services/custom_edit_address_service.dart';
import '../utils/edit_address_custom_localisations.dart';
import '../views/widget_toolkit_page.dart';

class WidgetToolkitWithDependencies extends StatelessWidget {
  const WidgetToolkitWithDependencies({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._localisations,
          ..._repositories,
          ..._services,
        ],
        child: Builder(builder: (context) => const WidgetToolkitPage()),
      );

  List<Provider> get _localisations => [
        Provider<EditAddressCustomLocalisations>(
          create: (context) => EditAddressCustomLocalisations(context),
        ),
      ];

  List<Provider> get _repositories => [
        Provider<SearchCountryRepository<CountryModel>>(
          create: (context) => SearchCountryRepository<CountryModel>(),
        ),
      ];

  List<Provider> get _services => [
        Provider<CustomEditAddressService<CountryModel>>(
          create: (context) => CustomEditAddressService<CountryModel>(
            searchRepository:
                context.read<SearchCountryRepository<CountryModel>>(),
          ),
        ),
      ];
}
