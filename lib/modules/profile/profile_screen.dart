import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/constants.dart';
import 'package:food_delivery_app/shared/widgets/custom_elevated_button.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kScreenPadding,
      child: Column(
        children: [
          _logoutButton(),
        ],
      ),
    );
  }

  Widget _logoutButton() {
    return CustomElevatedButton(
      onPressed: () {
        context.go('/');
      },
      text: 'Гарах',
      width: 200.0,
      icon: Icons.logout,
    );
  }
}
