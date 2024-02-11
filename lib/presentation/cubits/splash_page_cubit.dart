import 'dart:async';

import 'package:keep_money/core/constants/durations.dart';

import '../../domain/use_cases/preferences_use_cases/get_user_id.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/router_service/index.dart';
import '../../../core/use_cases/use_case.dart';

enum SplashPageState { loading, error, done }

class SplashPageCubit extends Cubit<SplashPageState> {
  SplashPageCubit({
    required this.getUserId,
    required this.navigation,
  }) : super(SplashPageState.done);

  final GetUserId getUserId;
  final RouterService navigation;

  Future<void> checkRoute(BuildContext context, bool mounted) async {
    _emittingState(SplashPageState.loading);

    final result = await getUserId(NoParams());

    result.when(
      error: (_) {
        _emitErrorState();
        return;
      },
      success: (userId) async {
        if (userId != null) {
          await _addDelay();
          if (!mounted) return;
          _navigateToHomePage(context);
        } else {
          await _addDelay();
          if (!mounted) return;
          _navigateToIntroPage(context);
        }
        _emitSuccessState();
      },
    );
  }

  void _navigateToIntroPage(BuildContext context) =>
      navigation.openIntroPage(context);

  void _navigateToHomePage(BuildContext context) =>
      navigation.openHomePage(context);

  _addDelay() async =>
      await Future.delayed(DurationsUtil.threeHundredMillisecondsDuration);

  void _emitSuccessState() {
    _emittingState(SplashPageState.done);
    Fimber.d('Successfully handled checking route');
  }

  void _emitErrorState() {
    _emittingState(SplashPageState.error);
    Fimber.d('Error happened while checking route');
  }

  void _emittingState(SplashPageState state) => emit(state);
}
