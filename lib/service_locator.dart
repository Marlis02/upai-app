import 'package:ctmax_upai/logic/bloc/auth/register/register_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ctmax_upai/data/services/auth_services.dart';
import 'package:ctmax_upai/logic/bloc/auth/login/login_bloc.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthServices>(() => AuthServices());
  locator.registerFactory<AuthLoginBloc>(() => AuthLoginBloc());
  locator.registerFactory<AuthRegisterBloc>(() => AuthRegisterBloc());
}
