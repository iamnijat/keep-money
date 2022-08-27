import '../../core/use_cases/use_case.dart';
import '../../domain/use_cases/preferences_use_cases/clear_shared_data.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/router_service/index.dart';

enum ProfilePreferencesState { initial, loading, error, done }

class ProfilePreferencesCubit extends Cubit<ProfilePreferencesState> {
  ProfilePreferencesCubit({
    required this.navigation,
    required this.clearSharedData,
  }) : super(ProfilePreferencesState.initial);

  final RouterService navigation;
  final ClearSharedData clearSharedData;

  Future<void> logOut(BuildContext context, bool mounted) async {
    final clearSharedDataResult = await clearSharedData(NoParams());

    if (clearSharedDataResult.isSuccess()) {
      if (!mounted) return;
      _navigateToIntroPage(context);
      _emitSuccessState();
    } else {
      _emitErrorState();
      return;
    }
  }

  void _navigateToIntroPage(BuildContext context) =>
      navigation.openIntroPage(context, withRemoval: true);

  void back(BuildContext context, {dynamic args}) =>
      navigation.back(context, result: args);

  void _emittingState(ProfilePreferencesState state) => emit(state);

  void _emitErrorState() {
    _emittingState(ProfilePreferencesState.error);
    Fimber.d('Error happened while logging out');
  }

  void _emitSuccessState() {
    _emittingState(ProfilePreferencesState.done);
    Fimber.d('Successfully logged out');
  }
}
