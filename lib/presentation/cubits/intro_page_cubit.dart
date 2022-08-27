import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/router_service/index.dart';

enum IntroPageState { loading, done }

class IntroPageCubit extends Cubit<IntroPageState> {
  IntroPageCubit({required this.navigation}) : super(IntroPageState.done);
  final RouterService navigation;

  void checkRoute(BuildContext context) async {
    _emittingState(IntroPageState.loading);
    _navigateToHomePage(context);
    _emittingState(IntroPageState.done);
    Fimber.d('Successfully navigated to personal information page');
  }

  void _navigateToHomePage(BuildContext context) =>
      navigation.openPersonalInformationPage(context);

  void _emittingState(IntroPageState state) => emit(state);
}
