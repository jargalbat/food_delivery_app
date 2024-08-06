import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class PhoneNumberSubmitted extends SignupEvent {
  final String phoneNumber;

  const PhoneNumberSubmitted(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class CodeSubmitted extends SignupEvent {
  final String code;

  const CodeSubmitted(this.code);

  @override
  List<Object> get props => [code];
}

class PasswordSubmitted extends SignupEvent {
  final String pass1;
  final String pass2;

  const PasswordSubmitted(this.pass1, this.pass2);

  @override
  List<Object> get props => [pass1, pass2];
}
