import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/shared/constants.dart';
import 'package:food_delivery_app/shared/utils.dart';
import 'package:food_delivery_app/shared/widgets/custom_elevated_button.dart';
import 'package:food_delivery_app/shared/widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _phoneFocus.unfocus();
      _passwordFocus.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: GestureDetector(
        onTap: () => Utils.hideKeyboard(context),
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: kScreenPadding,
                child: Column(
                  children: [
                    const SizedBox(height: 100.0),

                    // Logo
                    _logo(),
                    kHeightMedium,

                    // Phone
                    _phoneTextField(),
                    kHeightSmall,

                    // Pass
                    _passwordTextField(),
                    kHeightMedium,

                    // Login
                    _loginButton(),
                    kHeightSmall,

                    // Signup
                    _signupButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, AuthState state) {
    if (state is AuthSuccess) {
      context.go('/home');
    } else if (state is AuthFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    }
  }

  Widget _logo() {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: 150.0,
        height: 150.0,
      ),
    );
  }

  Widget _phoneTextField() {
    return CustomTextField(
      controller: _phoneController,
      focusNode: _phoneFocus,
      labelText: 'Утасны дугаар',
      keyboardType: TextInputType.phone,
      maxLength: 8,
      icon: Icons.phone,
    );
  }

  Widget _passwordTextField() {
    return CustomTextField(
      controller: _passwordController,
      focusNode: _passwordFocus,
      labelText: 'Нууц үг',
      maxLength: 30,
      obscureText: true,
      icon: Icons.lock,
    );
  }

  Widget _loginButton() {
    return BlocListener<AuthBloc, AuthState>(
      listener: _listener,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return CustomElevatedButton(
            onPressed: () {
              Utils.hideKeyboard(context);

              context.read<AuthBloc>().add(
                    LoginEvent(
                      phoneNumber: _phoneController.text,
                      password: _passwordController.text,
                    ),
                  );
            },
            text: 'Нэвтрэх',
            isLoading: state is AuthLoading,
          );
        },
      ),
    );
  }

  Widget _signupButton() {
    return TextButton(
      onPressed: () {
        Utils.hideKeyboard(context);
        _clearData();
        context.push('/signup');
      },
      child: const Text('Бүртгүүлэх'),
    );
  }

  void _clearData() {
    _phoneController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }
}
