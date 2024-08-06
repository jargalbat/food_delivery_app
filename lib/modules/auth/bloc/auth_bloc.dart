import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/shared/utils.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        // Validation
        String? message = Utils.validatePhoneNumber(event.phoneNumber);
        if (message != null) {
          emit(AuthFailure(error: message));
          return;
        }

        message = Utils.validatePassword(event.password);
        if (message != null) {
          emit(AuthFailure(error: message));
          return;
        }

        await Future.delayed(const Duration(seconds: 1));
        emit(AuthSuccess());
      } catch (error) {
        emit(const AuthFailure(error: 'Нэвтрэхэд алдаа гарлаа'));
      }
    });
  }
}
