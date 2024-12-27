// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

part of 'login_bloc.dart';

extension _UserAccountBlocExtensions on LoginBloc {
  Stream<bool> _validateAllFields() => Rx.combineLatest2<String, String, bool>(
        email,
        password,
        (username, password) => true,
      ).onErrorReturn(false);
}
