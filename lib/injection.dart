import 'package:get_it/get_it.dart';
import 'package:ifridgev2/bloc/food/food_bloc.dart';
import 'package:ifridgev2/repository/food_database.dart';

GetIt getIt = GetIt.instance;

void initializeInjection() {
  getIt.registerFactory<FoodBloc>(() => FoodBloc(getIt<IFoodDatabase>()));
  getIt.registerLazySingleton<IFoodDatabase>(() => FoodDatabaseService());
}
