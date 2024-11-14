import 'package:ctmax_upai/service_locator.dart';
import 'package:ctmax_upai/data/services/auth_services.dart';
import 'package:ctmax_upai/layout.dart';
import 'package:ctmax_upai/logic/bloc/auth/login/login_bloc.dart';
import 'package:ctmax_upai/logic/bloc/auth/login/login_state.dart';
import 'package:ctmax_upai/screens/login_screen/login_widgets.dart';
import 'package:ctmax_upai/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => locator<AuthLoginBloc>(),
        child: const LoginScreenView(),
      ),
    );
  }
}

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<AuthLoginBloc, AuthLoginState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          Navigator.pushReplacementNamed(context, MainLayout.routeName);
        } else if (state is AuthLoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<AuthLoginBloc, AuthLoginState>(
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
                        const HeaderWidget(),
                        const SizedBox(height: 20),
                        FormFieldWidget(
                          authLoginBloc: context.read<AuthLoginBloc>(),
                        ),
                        const SizedBox(height: 10),
                        const DividerWidget(),
                        const SizedBox(height: 10),
                        const SocialButtonWidget(
                            assetPath: "assets/google_icon.svg",
                            text: "Продолжить с Google"),
                        const SizedBox(height: 5),
                        const SocialButtonWidget(
                            assetPath: "assets/apple_icon.svg",
                            text: "Продолжить с Apple"),
                        const SizedBox(height: 5),
                        const SocialButtonWidget(
                            assetPath: "assets/facebook_icon.svg",
                            text: "Продолжить с Facebook"),
                        const SizedBox(height: 5),
                        const Spacer(),
                        const LoginFooterWidget()
                      ],
                    ),
                  ),
                ),
              ),
              if (state is AuthLoginLoading) const LoadingWidget(),
            ],
          );
        },
      ),
    );
  }
}
