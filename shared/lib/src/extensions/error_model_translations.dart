import 'package:flutter/widgets.dart';

import '../l10n/l10n.dart';
import '../domain/models/errors/error_model.dart';

extension ErrorModelL10n on ErrorModel {
  /// Translate the business error to a user friendly message
  /// based on the error type.
  String translate(BuildContext context) {
    if (this is BadRequestErrorModel) {
      return (this as BadRequestErrorModel).translate(context);
    }

    if (this is NotFoundErrorModel) {
      return (this as NotFoundErrorModel).translate(context);
    }

    if (this is ConflictErrorModel) {
      return (this as ConflictErrorModel).translate(context);
    }

    if (this is FieldErrorModel) {
      return (this as FieldErrorModel).translate(context);
    }

    if (this is FieldRequiredErrorModel) {
      return (this as FieldRequiredErrorModel).translate(context);
    }

    if (this is ErrorServerGenericModel) {
      return (this as ErrorServerGenericModel).translate(context);
    }

    if (this is ErrorTimeoutModel) {
      return (this as ErrorTimeoutModel).translate(context);
    }

    if (this is NetworkErrorModel) {
      return (this as NetworkErrorModel).translate(context);
    }

    return context.l10n.unknown;
  }
}

extension ErrorNotFoundL10n on NotFoundErrorModel {
  String translate(BuildContext context) => message ?? context.l10n.notFound;
}

extension ErrorFieldModelL10n on FieldErrorModel {
  String translate(BuildContext context) => errorValue;
}

extension ErrorFieldRequiredModelL10n on FieldRequiredErrorModel {
  String translate(BuildContext context) => errorValue;
}

extension ErrorServerGenericModelL10n on ErrorServerGenericModel {
  String translate(BuildContext context) => message ?? context.l10n.server;
}
