// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared/shared.dart';

import '../../../domain/models/deep_link_model.dart';
import '../../../domain/services/deep_link_service.dart';

part 'deep_link_list_bloc.rxb.g.dart';

/// A contract class containing all events of the DeepLinkListBloC.
abstract class DeepLinkListBlocEvents {
  @RxBlocEvent(type: RxBlocEventType.behaviour)
  void fetchDeepLinkList();

  void setMessage(String message);
}

/// A contract class containing all states of the DeepLinkListBloC.
abstract class DeepLinkListBlocStates {
  /// The loading state
  Stream<LoadingWithTag> get isLoading;

  /// The error state
  Stream<ErrorModel> get errors;

  Stream<Result<List<DeepLinkModel>>> get deepLinkList;

  Stream<String> get message;
}

@RxBloc()
class DeepLinkListBloc extends $DeepLinkListBloc {
  DeepLinkListBloc(this._deepLinkService) {
    fetchDeepLinkList();
  }

  final DeepLinkService _deepLinkService;

  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  Stream<LoadingWithTag> _mapToIsLoadingState() => loadingWithTagState;

  @override
  Stream<Result<List<DeepLinkModel>>> _mapToDeepLinkListState() =>
      _$fetchDeepLinkListEvent
          .switchMap((_) => _deepLinkService.fetchDeepLinks().asResultStream())
          .setResultStateHandler(this)
          .shareReplay(maxSize: 1);

  @override
  Stream<String> _mapToMessageState() => _$setMessageEvent.share();
}
