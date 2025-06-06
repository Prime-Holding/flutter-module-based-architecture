import 'package:shared/shared.dart';

class DevMenuDataSource {
  DevMenuDataSource();

  Future<void> saveProxy(String proxy) async {
    await SharedPreferencesInstance().setString('dev_menu_http_proxy', proxy);
  }

  Future<String?> getProxy() async =>
      await SharedPreferencesInstance().getString('dev_menu_http_proxy');
}
