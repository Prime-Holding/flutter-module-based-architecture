// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

import '../../../design_system.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    required bool isActive,
    required VoidCallback onPressed,
    String? tooltip, // context.l10n.reload
    super.key,
  })  : _isActive = isActive,
        _onPressed = onPressed,
        _tooltip = tooltip;

  final VoidCallback _onPressed;

  final bool _isActive;
  final String? _tooltip;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: _isActive ? _onPressed : null,
        icon: Icon(context.designSystem.icons.reload),
        tooltip: _tooltip,
        color: _isActive
            ? context.designSystem.colors.updateIconAppBarColor
            : context.designSystem.colors.inactiveButtonTextColor,
      );
}
