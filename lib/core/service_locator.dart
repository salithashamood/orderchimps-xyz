import 'package:get_it/get_it.dart';
import 'package:xyz/ui/navigation/cubit/navigation_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  //Http request
  // serviceLocator.registerSingleton<HttpRequest>(HttpRequest());

  //Cubit
  //sign in cubit
  // serviceLocator.registerFactory<SignInCubit>(
  //   () => SignInCubit(serviceLocator<AuthUsecase>()),
  // );

  //navigation cubit
  serviceLocator.registerFactory<NavigationCubit>(
    () => NavigationCubit(),
  );

  //home cubit
  // serviceLocator.registerFactory<HomeCubit>(
  //   () => HomeCubit(
  //       serviceLocator<PromotedListingUsecase>(),
  //       serviceLocator<RestaurantUsecase>(),
  //       serviceLocator<HomeUsecase>(),
  //       serviceLocator<CategoryUsecase>(),
  //       serviceLocator<BlogUsecase>()),
  // );

  //profile cubit
  // serviceLocator.registerFactory<ProfileCubit>(
  //   () => ProfileCubit(serviceLocator<AuthUsecase>()),
  // );

  //Cubit

  //usecase
  //auth usecase
  // serviceLocator.registerFactory<AuthUsecase>(
  //   () => AuthUsecase(serviceLocator<AuthRepository>()),
  // );

  //home usecase
  // serviceLocator.registerFactory<HomeUsecase>(
  //   () => HomeUsecase(serviceLocator<HomeRepository>()),
  // );

  //usecase

  //repository
  //auth repository
  // serviceLocator.registerFactory<AuthRepository>(
  //   () => AuthRepositoryImpl(serviceLocator<HttpRequest>()),
  // );

  //home repository
  // serviceLocator.registerFactory<HomeRepository>(
  //   () => HomeRepositoryImpl(serviceLocator<HttpRequest>()),
  // );

  //repository
}
