// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:all_events_task/config/route/route_names.dart';
import 'package:all_events_task/data/data_sources/user_sources.dart';
import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:all_events_task/presentation/views/shared/snackbars/custom_snackbars.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  // ignore: unused_field
  final Ref _ref;

  AuthProvider(this._ref);

  Future signupUsingGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      await googleSignIn.signOut();
      var responce = await googleSignIn.signIn();
      if (responce == null) {
        showErrorSnackBar(context, 'Login failed');
      } else {
        UserSources.name = responce.displayName;
        UserSources.profileImage = responce.photoUrl;
        UserSources.isLoggedIn = true;
        await UserSources.saveDate();
        //navigate to home

        context.goNamed(AppRouteNames.homeScreen);
        _ref.read(eventProvider).getCategories();
      }
    } on SocketException {
      showErrorSnackBar(context, "please check your internet connection");
    } on Exception catch (_) {
      showErrorSnackBar(context, 'Something went wrong');
    }
  }
}
