abstract class AppState {}

class AppInitialState extends AppState {}

class AppBottomNavState extends AppState {}

class GetLoadingProjetEnCours extends AppState {}

class GetSuccessProjetEnCours extends AppState {}

class GetErrorProjetEnCours extends AppState {
  final String error;
  GetErrorProjetEnCours(this.error);
}
