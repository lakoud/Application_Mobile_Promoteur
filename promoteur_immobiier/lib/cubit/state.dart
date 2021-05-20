abstract class AppState {}

class AppInitialState extends AppState {}

class AppBottomNavState extends AppState {}

class AppMessageGetUserSuccessState extends AppState {}

class AppMessageGetUserErrorState extends AppState {
  final String error;
  AppMessageGetUserErrorState(this.error);
}

class AppProfilImagePickedSuccssState extends AppState {}

class AppProfilImagePickedErrorState extends AppState {}

class AppUploadImageSuccssState extends AppState {}

class AppUploadImageErrorState extends AppState {}

class AppuserUpdateErrorState extends AppState {}

class AppuserUpdateLoadingState extends AppState {}
