import 'package:ctmax_upai/data/services/auth_services.dart';
import 'package:ctmax_upai/layout.dart';
import 'package:ctmax_upai/logic/bloc/auth/auth_bloc.dart';
import 'package:ctmax_upai/logic/bloc/auth/auth_enent.dart';
import 'package:ctmax_upai/logic/bloc/auth/auth_state.dart';
import 'package:ctmax_upai/screens/login_screen/login_widgets.dart';
import 'package:ctmax_upai/styles/colors_style.dart';
import 'package:ctmax_upai/ui/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authBloc = AuthBloc(
    AuthServices(),
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, MainLayout.routeName);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                        height: screenSize.height,
                        padding: const EdgeInsets.all(30),
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            _header(),
                            const SizedBox(height: 20),
                            FormFieldWidget(authBloc: authBloc),
                            const SizedBox(height: 20),
                            _buildDivider(),
                            const SizedBox(height: 20),
                            const Spacer(),
                            _footer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state is AuthLoading) const LoadingWidget(),
                ],
              );
            },
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
