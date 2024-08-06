import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/modules/signup/bloc/signup_bloc.dart';
import 'package:food_delivery_app/modules/signup/bloc/signup_event.dart';
import 'package:food_delivery_app/modules/signup/bloc/signup_state.dart';
import 'package:food_delivery_app/shared/constants.dart';
import 'package:food_delivery_app/shared/widgets/custom_pin_input.dart';
import 'package:go_router/go_router.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _pinController = TextEditingController();
  final _pinFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Баталгаажуулах'),
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
              // Phone
              _pinInput(),
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
    if (state is CodeVerificationSuccess) {
      context.push('/password');
    } else if (state is SignupFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    }
  }

  Widget _pinInput() {
    return SizedBox(
      width: double.infinity,
      child: CustomPinInput(
        controller: _pinController,
        focusNode: _pinFocus,
      ),
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
                    CodeSubmitted(_pinController.text),
                  );
            },
            child: const Text('Үргэлжлүүлэх'),
          );
        },
      ),
    );
  }
}
