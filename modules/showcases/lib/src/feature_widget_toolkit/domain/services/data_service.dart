// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:widget_toolkit/item_picker.dart';

import '../../domain/models/data_model.dart';

class DataService extends ItemPickerService<DataModel> {
  DataService();

  @override
  Future<List<DataModel>> getItems() => Future.delayed(
        const Duration(seconds: 3),
        () => List.generate(
          20,
          (index) => DataModel(
            name: 'Person $index',
            description:
                'This may be very long description for user named Person $index',
          ),
        ),
      );
}
