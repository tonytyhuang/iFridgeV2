import 'package:get_it/get_it.dart';
import 'package:ifridgev2/bloc/bloc/food_bloc.dart';

GetIt getIt = GetIt.instance;

void initializeInjection() {
  getIt.registerFactory<FoodBloc>(() => FoodBloc());
}
