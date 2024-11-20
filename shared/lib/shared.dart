library shared;

export 'src/base/extensions/async_snapshot_extensions.dart';
export 'src/base/extensions/error_model_translations.dart';
export 'src/base/extensions/error_model_field_translations.dart';
export 'src/base/extensions/error_model_extensions.dart';

export 'src/base/data_sources/local/shared_preferences_instance.dart';
export 'src/base/data_sources/remote/interceptors/analytics_interceptor.dart';
export 'src/base/data_sources/remote/interceptors/log_interceptor.dart';

export 'src/base/mappers/error_mappers/error_mapper.dart';

export 'src/base/models/errors/error_model.dart';

export 'src/base/blocs/coordinator_bloc.dart';

export 'assets.dart';

export 'src/base/theme/design_system.dart';
export 'src/base/theme/melostest_theme.dart';

export 'src/l10n/l10n.dart';
export 'src/l10n/melostest_app_i18n.dart';

export 'src/keys.dart';
export 'src/base/config/app_constants.dart';
export 'src/base/config/environment_config.dart';

export 'src/base/utils/helpers.dart';
export 'src/base/utils/local_notifications.dart';

export 'src/base/ui_components/app_error_modal_widget.dart';
export 'src/base/ui_components/custom_app_bar.dart';
export 'src/base/ui_components/app_loading_indicator.dart';
export 'src/base/ui_components/primary_button.dart';
export 'src/base/ui_components/action_button.dart';
export 'src/base/ui_components/update_button.dart';
export 'src/base/ui_components/app_error_widget.dart';

export 'src/lib_change_language/extensions/language_model_extensions.dart';
export 'src/lib_change_language/ui_components/language_picker_button.dart';
export 'src/lib_change_language/bloc/change_language_bloc.dart';

export 'src/lib_pin_code/bloc/create_pin_bloc.dart';
export 'src/lib_pin_code/bloc/update_and_verify_pin_bloc.dart';
export 'src/lib_pin_code/models/pin_code_arguments.dart';
export 'src/lib_pin_code/services/create_pin_code_service.dart';
export 'src/lib_pin_code/views/verify_pin_code_page.dart';
export 'src/lib_pin_code/views/create_pin_page.dart';
export 'src/lib_pin_code/di/update_pin_page_with_dependencies.dart';

export 'src/lib_analytics/repositories/analytics_repository.dart';
export 'src/lib_analytics/blocs/analytics_bloc.dart';

export 'src/lib_permissions/services/permissions_service.dart';
export 'src/lib_permissions/models/route_permissions.dart';

export 'src/http_clients/api_http_client.dart';
export 'src/http_clients/plain_http_client.dart';

export 'src/lib_router/models/route_data_model.dart';
export 'src/lib_router/services/router_service.dart';
export 'src/lib_router/services/router_resolver_service.dart';
export 'src/lib_router/blocs/router_bloc.dart';

export 'src/lib_translations/di/translations_dependencies.dart';
export 'src/lib_translations/services/translations_service.dart';
