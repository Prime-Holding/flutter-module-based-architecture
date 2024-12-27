import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:shared/src/lib_pin_code/ui/bloc/update_and_verify_pin_bloc.dart';
import 'package:shared/src/lib_pin_code/domain/models/pin_code_arguments.dart';
import 'package:shared/src/lib_pin_code/domain/services/verify_pin_code_service.dart';
import 'package:shared/src/lib_pin_code/ui/widgets/verify_pin_code_page.dart';

import 'package:shared/src/lib_router/ui/blocs/router_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../../blocs/router_bloc_mock.dart';
import '../../mock/verify_pin_code_service_mock.dart';
import '../mocks/pin_biometrics_auth_datasource_mock.dart';
import '../mocks/pin_biometrics_local_datasource_mock.dart';
import '../mocks/update_and_verify_pin_bloc_mock.dart';

Widget verifyPinFactory({
  String? title,
  bool showBiometricsButton = false,
}) =>
    Scaffold(
      body: MultiProvider(
        providers: [
          RxBlocProvider<UpdateAndVerifyPinBlocType>.value(
            value: updateAndVerifyPinMockFactory(),
          ),
          RxBlocProvider<RouterBlocType>.value(
            value: routerBlocMockFactory(),
          ),
          Provider<VerifyPinCodeService>.value(
            value: verifyPinCodeServiceMockFactory(
              showBiometricsButton: showBiometricsButton,
            ),
          ),
          Provider<BiometricsLocalDataSource>.value(
            value:
                pinBiometricsLocalDataSourceMockFactory(showBiometricsButton),
          ),
          Provider<PinBiometricsAuthDataSource>.value(
            value: MockBiometricsAuthDataSource(
              showBiometricsButton: showBiometricsButton,
            ),
          ),
        ],
        child: VerifyPinCodePage(
          pinCodeArguments: PinCodeArguments(
            title: title ?? '',
            showBiometricsButton: showBiometricsButton,
          ),
        ),
      ),
    );
