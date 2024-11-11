import 'package:ctmax_upai/data/services/auth_services.dart';
import 'package:ctmax_upai/layout.dart';
import 'package:ctmax_upai/logic/bloc/auth/auth_bloc.dart';
import 'package:ctmax_upai/logic/bloc/auth/auth_enent.dart';
import 'package:ctmax_upai/logic/bloc/auth/auth_state.dart';
import 'package:ctmax_upai/styles/colors_style.dart';
import 'package:ctmax_upai/ui/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authBloc = AuthBloc(
    AuthServices(),
  );
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          AuthBloc(AuthServices()), // используем созданный экземпляр блока
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Container(
                  height: screenSize.height,
                  padding: const EdgeInsets.all(30),
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        _header(),
                          const SizedBox(height: 20),
                          _formField(context),
                          const SizedBox(height: 20),
                          _buildDivider(),
                          const SizedBox(height: 20),
                          _buildSocialButton(
                              'assets/icons/google.svg', 'Google'),
                          _buildSocialButton(
                              'assets/icons/facebook.svg', 'Facebook'),
                          _buildSocialButton(
                              'assets/icons/telegram.svg', 'Telegram'),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return const Column(
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'Добро пожаловать в ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: 'UPAI',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Text(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          "Акции и специальные предложения только для вас!",
        ),
      ],
    );
  }

  Widget _formField(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(
              Icons.person_rounded,
              color: Colors.blueGrey[400],
            ),
            hintText: 'e-mail, login или номер телефона',
            hintStyle: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          obscureText: _isObscured,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.blueGrey[400],
            ),
            hintText: 'Пароль',
            hintStyle: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: IconButton(
              iconSize: 20,
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.blueGrey[400],
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
            height: 30,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.zero,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 0, horizontal: 5)),
                alignment: Alignment.center,
                overlayColor:
                    WidgetStatePropertyAll(AppColors.primary.withOpacity(0.1)),
              ),
              child: const Text(
                "Забыли пароль?",
                style: TextStyle(color: AppColors.primary, fontSize: 14),
              ),
            )),
        const SizedBox(height: 5),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            context
                .read<AuthBloc>()
                .add(AuthLoginEvent('qwerty', 'qwerty529156'));
          },
          child: const Text(
            "Войти",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.blueGrey[400],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("Или"),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.blueGrey[400],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String assetPath, String text) {
    return SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            // Действие при нажатии на кнопку
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColors.black),
            ),
            backgroundColor: AppColors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                assetPath,
                width: 24,
                height: 24,
              ),
              const Spacer(),
              Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
              const Spacer(),
            ],
          ),
        ));
  }

  Widget _footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Еще не зарегистрированы?"),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 0, horizontal: 5)),
            alignment: Alignment.center,
            overlayColor:
                WidgetStatePropertyAll(AppColors.primary.withOpacity(0.1)),
          ),
          child: const Text(
            "Регистрация",
            style: TextStyle(color: AppColors.primary, fontSize: 14),
          ),
        )
      ],
    );
  }
}
