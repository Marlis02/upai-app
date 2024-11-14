import 'package:ctmax_upai/logic/bloc/auth/login/login_bloc.dart';
import 'package:ctmax_upai/logic/bloc/auth/login/login_event.dart';
import 'package:ctmax_upai/screens/register_screen/register_screen.dart';
import 'package:ctmax_upai/styles/colors_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.blue),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Text(
          "Акции и специальные предложения только для вас!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class FormFieldWidget extends StatefulWidget {
  final AuthLoginBloc authLoginBloc;
  const FormFieldWidget({super.key, required this.authLoginBloc});

  @override
  // ignore: library_private_types_in_public_api
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
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
          controller: _passwordController,
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
            height: 25,
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
                style: TextStyle(color: AppColors.primary, fontSize: 12),
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
            widget.authLoginBloc.add(
              AuthLoginRequest(_emailController.text, _passwordController.text),
            );
          },
          child: const Text(
            "Войти",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class SocialButtonWidget extends StatelessWidget {
  final String assetPath;
  final String text;

  const SocialButtonWidget(
      {required this.assetPath, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColors.black)),
          backgroundColor: AppColors.white,
        ),
        child: Row(
          children: [
            SvgPicture.asset(assetPath, width: 24, height: 24),
            const Spacer(),
            Text(text, style: const TextStyle(color: Colors.black)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: Colors.blueGrey[400])),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("Или"),
        ),
        Expanded(child: Divider(thickness: 1, color: Colors.blueGrey[400])),
      ],
    );
  }
}

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Еще не зарегистрированы?"),
        SizedBox(
          height: 25,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
            },
            style: ButtonStyle(
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 0, horizontal: 8)),
              alignment: Alignment.center,
              overlayColor:
                  WidgetStatePropertyAll(AppColors.primary.withOpacity(0.1)),
            ),
            child: const Text(
              "Регистрация",
              style: TextStyle(color: AppColors.primary, fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}
