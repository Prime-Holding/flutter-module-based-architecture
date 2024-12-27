import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../domain/services/dashboard_service.dart';
import '../blocs/dashboard_bloc.dart';
import '../widgets/dashboard_page.dart';

class DashboardPageWithDependencies extends StatelessWidget {
  const DashboardPageWithDependencies({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._services,
          ..._blocs,
        ],
        child: const DashboardPage(),
      );

  List<Provider> get _services => [
        Provider<DashboardService>(
          create: (context) => DashboardService(),
        ),
      ];
  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<DashboardBlocType>(
          create: (context) => DashboardBloc(context.read()),
        ),
      ];
}
