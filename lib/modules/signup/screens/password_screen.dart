import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/modules/signup/bloc/signup_bloc.dart';
import 'package:food_delivery_app/modules/signup/bloc/signup_event.dart';
import 'package:food_delivery_app/modules/signup/bloc/signup_state.dart';
import 'package:food_delivery_app/shared/constants.dart';
import 'package:food_delivery_app/shared/widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _pass1Controller = TextEditingController();
  final _pass2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Нууц үг'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: Padding(
          padding: kScreenPadding,
          child: Column(
            children: [
              // Pass 1
              _pass1TextField(),
              kHeightSmall,

              // Pass 2
              _pass2TextField(),
              kHeightMedium,

              // Next
              _nextButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, SignupState state) {
    if (state is PasswordSubmittedSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Амжилттай бүртгүүллээ')),
      );

      context.go('/');
    } else if (state is SignupFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    }
  }

  Widget _pass1TextField() {
    return CustomTextField(
      controller: _pass1Controller,
      labelText: 'Нууц үг',
      keyboardType: TextInputType.phone,
      maxLength: 30,
      icon: Icons.lock,
      obscureText: true,
    );
  }

  Widget _pass2TextField() {
    return CustomTextField(
      controller: _pass2Controller,
      labelText: 'Нууц үг давтах',
      keyboardType: TextInputType.phone,
      maxLength: 30,
      icon: Icons.lock,
      obscureText: true,
    );
  }

  Widget _nextButton() {
    return BlocListener<SignupBloc, SignupState>(
      listener: _listener,
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          if (state is SignupLoading) {
            return const CircularProgressIndicator();
          }

          return ElevatedButton(
            onPressed: () {
              context.read<SignupBloc>().add(
                    PasswordSubmitted(
                      _pass1Controller.text,
                      _pass2Controller.text,
                    ),
                  );
            },
            child: const Text('Үргэлжлүүлэх'),
          );
        },
      ),
    );
  }
}
