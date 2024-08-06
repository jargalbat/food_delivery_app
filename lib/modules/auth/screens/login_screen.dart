import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/shared/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: Padding(
          padding: kScreenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
        width: 200.0,
        height: 200.0,
      ),
    );
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

  Widget _passwordTextField() {
    return CustomTextField(
      controller: _passwordController,
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
          if (state is AuthLoading) {
            return const CircularProgressIndicator();
          }

          return ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    LoginEvent(
                      phoneNumber: _phoneController.text,
                      password: _passwordController.text,
                    ),
                  );
            },
            child: const Text('Нэвтрэх'),
          );
        },
      ),
    );
  }

  Widget _signupButton() {
    return TextButton(
      onPressed: () {
        context.push('/signup');
      },
      child: const Text('Бүртгүүлэх'),
    );
  }
}
