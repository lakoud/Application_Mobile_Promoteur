abstract class AppState {}

class AppInitialState extends AppState {}

class AppBottomNavState extends AppState {}

class GetLoadingProjetEnCours extends AppState {}

class GetSuccessProjetEnCours extends AppState {}

class GetErrorProjetEnCours extends AppState {
  final String error;
  GetErrorProjetEnCours(this.error);
}

class AppMessageInitialState extends AppState {}

class AppMessageLoadingState extends AppState {}

class AppMessageGetUserSuccessState extends AppState {}

class AppMessageGetUserErrorState extends AppState {
  final String error;
  AppMessageGetUserErrorState(this.error);
}
