import 'package:ctmax_upai/logic/bloc/auth/login/login_bloc.dart';
import 'package:ctmax_upai/logic/bloc/auth/register/register_bloc.dart';
import 'package:ctmax_upai/logic/bloc/auth/register/register_event.dart';
import 'package:ctmax_upai/models/account.dart';
import 'package:ctmax_upai/screens/login_screen/login_screen.dart';
import 'package:ctmax_upai/styles/colors_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Регистрация",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.primary),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  final AuthRegisterBloc authRegisterBloc;
  const RegistrationForm({super.key, required this.authRegisterBloc});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final Account account = Account();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // String? _firstNameValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'First name is required';
  //   }
  //   return null;
  // }

  // String? _lastNameValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Last name is required';
  //   }
  //   return null;
  // }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final account = Account(
          username: _usernameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          password2: _confirmPasswordController.text,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text);
      widget.authRegisterBloc.add(AuthRegisterRequest(account));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _usernameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: _buildInputDecoration('Username*'),
            validator: _usernameValidator,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: _buildInputDecoration('Email*'),
            validator: _emailValidator,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: _buildInputDecoration('Password*'),
            obscureText: true,
            validator: _passwordValidator,
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _confirmPasswordController,
            decoration: _buildInputDecoration('Confirm Password*'),
            obscureText: true,
            validator: _confirmPasswordValidator,
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameController,
            decoration: _buildInputDecoration("First Name"),
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameController,
            decoration: _buildInputDecoration("Last Name"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: _submitForm,
            child: const Text(
              "Зарегистрироваться",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      errorStyle: const TextStyle(fontSize: 10),
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class RegisterDividerWidget extends StatelessWidget {
  const RegisterDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: Colors.blueGrey[400])),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("Или c помощью"),
        ),
        Expanded(child: Divider(thickness: 1, color: Colors.blueGrey[400])),
      ],
    );
  }
}

class RegisterWithSocialButtons extends StatelessWidget {
  const RegisterWithSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _socialButton("assets/google_icon.svg"),
      _socialButton("assets/apple_icon.svg"),
      _socialButton("assets/facebook_icon.svg"),
      _socialButton("assets/vk_icon.svg"),
    ]);
  }

  Widget _socialButton(String assetPath) {
    return SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.white,
        ),
        child: SvgPicture.asset(
          assetPath,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

class RegisterFooterWidget extends StatelessWidget {
  const RegisterFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Уже есть аккаунт?"),
        SizedBox(
          height: 25,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                (Route<dynamic> route) => false,
              );
            },
            style: ButtonStyle(
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 0, horizontal: 8)),
              alignment: Alignment.center,
              overlayColor:
                  WidgetStatePropertyAll(AppColors.primary.withOpacity(0.1)),
            ),
            child: const Text(
              "Войти",
              style: TextStyle(color: AppColors.primary, fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}
