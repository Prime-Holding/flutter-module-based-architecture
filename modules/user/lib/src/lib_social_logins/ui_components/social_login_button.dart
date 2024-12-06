// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.child,
    required this.isLoading,
    required this.backgroundColor,
    required this.text,
    this.onPressed,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(0),
    this.width = 225,
    this.splashColor = Colors.white30,
    this.highlightColor = Colors.white30,
    this.textStyle,
    this.progressIndicatorColor = Colors.black,
    this.borderSide = BorderSide.none,
  });
  final Function()? onPressed;
  final Color backgroundColor;
  final double elevation;
  final EdgeInsetsGeometry? padding;
  final String text;
  final double width;
  final Color splashColor;
  final Color highlightColor;
  final Widget child;
  final bool isLoading;
  final TextStyle? textStyle;
  final Color? progressIndicatorColor;
  final BorderSide borderSide;

  @override
  Widget build(BuildContext context) => MaterialButton(
        key: key,
        color: backgroundColor,
        onPressed: onPressed,
        disabledElevation: elevation,
        disabledColor: backgroundColor,
        splashColor: Colors.white30,
        highlightColor: Colors.white30,
        padding: EdgeInsets.symmetric(
          vertical: context.designSystem.spacing.xss,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.designSystem.spacing.l1,
          ),
          side: borderSide,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: context.designSystem.spacing.xs,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: isLoading
                      ? child
                      : AppLoadingIndicator(
                          color: progressIndicatorColor,
                          size: Size(
                            context.designSystem.spacing.xl,
                            context.designSystem.spacing.xl,
                          ),
                          strokeWidth: context.designSystem.spacing.xxxs,
                          padding: EdgeInsets.all(
                            context.designSystem.spacing.xss1,
                          ),
                        ),
                ),
              ),
              Text(
                text,
                style: textStyle ?? context.designSystem.typography.h3Med14,
              ),
            ],
          ),
        ),
      );
}
