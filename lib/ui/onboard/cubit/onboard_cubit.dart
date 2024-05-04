import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xyz/core/secure_storage.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(OnboardInitial()) {
    checkAppStatus();
  }

  Future<void> checkAppStatus() async {
    String? loginValue = await SecureStorage.getIsLogin();
    if (loginValue == null) {
      emit(OnboardMoveToLogin());
    } else {
      emit(OnboardMoveToHome());
    }
  }
}
