import 'package:ctmax_upai/service_locator.dart';
import 'package:ctmax_upai/layout.dart';
import 'package:ctmax_upai/logic/bloc/auth/register/register_bloc.dart';
import 'package:ctmax_upai/logic/bloc/auth/register/register_state.dart';
import 'package:ctmax_upai/screens/login_screen/login_screen.dart';
import 'package:ctmax_upai/screens/register_screen/register_widgets.dart';
import 'package:ctmax_upai/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => locator<AuthRegisterBloc>(),
        child: const RedisterScreenView(),
      ),
    );
  }
}

class RedisterScreenView extends StatefulWidget {
  const RedisterScreenView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenViewState createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RedisterScreenView> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<AuthRegisterBloc, AuthRegisterState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccess) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        } else if (state is AuthRegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<AuthRegisterBloc, AuthRegisterState>(
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
                        Spacer(),
                        RegisterHeader(),
                        SizedBox(height: 20),
                        RegistrationForm(
                          authRegisterBloc: context.read<AuthRegisterBloc>(),
                        ),
                        SizedBox(height: 5),
                        RegisterDividerWidget(),
                        SizedBox(height: 5),
                        RegisterWithSocialButtons(),
                        SizedBox(height: 5),
                        Spacer(),
                        RegisterFooterWidget()
                      ],
                    ),
                  ),
                ),
              ),
              if (state is AuthRegisterLoading) const LoadingWidget(),
            ],
          );
        },
      ),
    );
  }
}
