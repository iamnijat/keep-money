import 'package:flutter/material.dart';

import '../../presentation/snackbars/error_snackbar.dart';

void showErrorSnackBar(context, {required String? message}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(ErrorSnackbar.showErrorSnackBar(message));
}
