import 'package:bloc/bloc.dart';
import 'package:food_delivery_app/shared/shared_pref.dart';
import 'package:food_delivery_app/shared/utils.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<PhoneNumberSubmitted>(_onPhoneNumberSubmitted);
    on<CodeSubmitted>(_onCodeSubmitted);
    on<PasswordSubmitted>(_onPasswordSubmitted);
  }

  void _onPhoneNumberSubmitted(
      PhoneNumberSubmitted event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      // Validation
      String? message = Utils.validatePhoneNumber(event.phoneNumber);
      if (message != null) {
        emit(SignupFailure(message));
        return;
      }

      SharedPref().savePhoneNumber(event.phoneNumber);
      await Future.delayed(const Duration(seconds: 1));
      emit(PhoneNumberSubmittedSuccess());
    } catch (error) {
      emit(const SignupFailure("Утасны дугаараар бүртгүүлэхэд алдаа гарлаа"));
    }
  }

  void _onCodeSubmitted(CodeSubmitted event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      // Validation
      String? message = Utils.validateCode(event.code);
      if (message != null) {
        emit(SignupFailure(message));
        return;
      }

      // Success
      await Future.delayed(const Duration(seconds: 1));
      emit(CodeVerificationSuccess());
    } catch (error) {
      emit(const SignupFailure("Код баталгаажуулахад алдаа гарлаа"));
    }
  }

  void _onPasswordSubmitted(
      PasswordSubmitted event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      // Validation
      String? message = Utils.validatePassword(event.pass1);
      if (message != null) {
        emit(SignupFailure(message));
        return;
      }

      if (event.pass1 != event.pass2) {
        emit(const SignupFailure('Нууц үгээ зөв давтаж оруулна уу'));
        return;
      }

      // Success
      await Future.delayed(const Duration(seconds: 1));
      emit(PasswordSubmittedSuccess());
    } catch (error) {
      emit(const SignupFailure("Нууц үг үүсгэхэд алдаа гарлаа"));
    }
  }
}
