import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final Ref _ref;

  AuthProvider(this._ref);

  Future signupUsingGoogle() async {
    try {
      var responce = await GoogleSignIn().signIn();
      if (responce == null) {
        //show error
        log('error');
      } else {
        //navigate to home
        log('navigate to home');
      }
    } on Exception catch (e) {
      //show error
    }
  }
}
