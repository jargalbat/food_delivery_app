import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/modules/signup/bloc/signup_bloc.dart';
import 'package:food_delivery_app/modules/signup/bloc/signup_event.dart';
import 'package:food_delivery_app/modules/signup/bloc/signup_state.dart';
import 'package:food_delivery_app/shared/constants.dart';
import 'package:food_delivery_app/shared/utils.dart';
import 'package:food_delivery_app/shared/widgets/custom_elevated_button.dart';
import 'package:food_delivery_app/shared/widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: GestureDetector(
        onTap: () => Utils.hideKeyboard(context),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Бүртгүүлэх'),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Утасны дугаараа оруулна уу.',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                kHeightMedium,

                // Phone
                _phoneTextField(),
                kHeightMedium,

                // Next
                _nextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, SignupState state) {
    if (state is PhoneNumberSubmittedSuccess) {
      context.push('/verify');
    } else if (state is SignupFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    }
  }

  Widget _phoneTextField() {
    return CustomTextField(
      controller: _phoneController,
      labelText: 'Утасны дугаар',
      keyboardType: TextInputType.phone,
      maxLength: 8,
      icon: Icons.phone,
    );
  }

  Widget _nextButton() {
    return BlocListener<SignupBloc, SignupState>(
      listener: _listener,
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return CustomElevatedButton(
            onPressed: () {
              Utils.hideKeyboard(context);
              context.read<SignupBloc>().add(
                    PhoneNumberSubmitted(_phoneController.text),
                  );
            },
            text: 'Үргэлжлүүлэх',
            isLoading: state is SignupLoading,
          );
        },
      ),
    );
  }
}
