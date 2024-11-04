import 'package:ctmax_upai/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            padding: const EdgeInsets.all(30),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                _header(),
                const SizedBox(height: 30),
                _formField(),
                const SizedBox(height: 30),
                _buildDivider(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSocialButton('assets/google_icon.svg'),
                    _buildSocialButton('assets/facebook_icon.svg'),
                    _buildSocialButton('assets/vk_icon.svg'),
                    _buildSocialButton('assets/apple_icon.svg'),
                  ],
                ),
                const SizedBox(height: 20),
                const Spacer(), // Занимаем свободное пространство перед футером
                _footer(), // Футер зафиксирован внизу
              ],
            ),
          ),
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

  Widget _formField() {
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
        const SizedBox(height: 10),
        Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                overlayColor:
                    WidgetStatePropertyAll(Colors.blue.withOpacity(0.1)),
              ),
              child: const Text(
                "Забыли пароль?",
                style: TextStyle(color: Colors.blue),
              ),
            )),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, MainLayout.routeName);
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
          child: Text("Или войдите через"),
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

  Widget _buildSocialButton(String assetPath) {
    return SizedBox(
      width: 80,
      height: 80,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        onPressed: () {},
        child: SvgPicture.asset(assetPath),
      ),
    );
  }

  Widget _footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Еще не зарегистрированы?"),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.blue.withOpacity(0.1)),
          ),
          child: const Text(
            "Регистрация",
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }
}
