import 'package:all_events_task/presentation/views/shared/custom_showdialogue_glassy_background.dart';
import 'package:flutter/material.dart';

Future showLoading(BuildContext context) async {
  return showDialogueCustomWithGlassyBackground(
    context,
    const CircularProgressIndicator(),
  );
}
