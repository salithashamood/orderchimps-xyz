import 'package:get_it/get_it.dart';
import 'package:xyz/core/http_request.dart';
import 'package:xyz/data/repository/auth_repository_impl.dart';
import 'package:xyz/domain/repository/auth_repository.dart';
import 'package:xyz/domain/usecase/auth_usecase.dart';
import 'package:xyz/ui/home/cubit/home_cubit.dart';
import 'package:xyz/ui/navigation/cubit/navigation_cubit.dart';
import 'package:xyz/ui/onboard/cubit/onboard_cubit.dart';
import 'package:xyz/ui/profile/cubit/profile_cubit.dart';
import 'package:xyz/ui/sign_in/cubit/sign_in_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  // Http request
  serviceLocator.registerSingleton<HttpRequest>(HttpRequest());

  //Cubit
  //onboard cubit
  serviceLocator.registerFactory<OnboardCubit>(
    () => OnboardCubit(),
  );
  
  //sign in cubit
  serviceLocator.registerFactory<SignInCubit>(
    () => SignInCubit(serviceLocator<AuthUsecase>()),
  );

  //home cubit
  serviceLocator.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );

  //navigation cubit
  serviceLocator.registerFactory<NavigationCubit>(
    () => NavigationCubit(),
  );

  //profile cubit
  serviceLocator.registerFactory<ProfileCubit>(
    () => ProfileCubit(),
  );
  //Cubit

  //usecase
  //auth usecase
  serviceLocator.registerFactory<AuthUsecase>(
    () => AuthUsecase(serviceLocator<AuthRepository>()),
  );
  //usecase

  //repository
  //auth repository
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator<HttpRequest>()),
  );
  //repository
}
