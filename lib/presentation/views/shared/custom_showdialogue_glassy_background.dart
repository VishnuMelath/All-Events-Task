import 'dart:ui';

import 'package:flutter/material.dart';

Future showDialogueCustomWithGlassyBackground(
    BuildContext context, Widget child,
    {Offset? offset}) async {
  return await showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: child,
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved =
          CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      return SlideTransition(
        position: Tween<Offset>(
          begin: offset ?? Offset.zero,
          end: Offset.zero,
        ).animate(curved),
        child: ScaleTransition(
          scale: curved,
          child: FadeTransition(
            opacity: curved,
            child: child,
          ),
        ),
      );
    },
  );
}
