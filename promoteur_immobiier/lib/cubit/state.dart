abstract class AppState {}

class AppInitialState extends AppState {}

class AppBottomNavState extends AppState {}

class AppusergetLoadingState extends AppState {}

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

// chat

class AppSendMessageSuccessStates extends AppState {}

class AppSendMessageErrorStates extends AppState {}

class AppGetMessageSucessStates extends AppState {}

class ApploginInitialState extends AppState {}

class ApploginLodingState extends AppState {}

class ApploginSuccessState extends AppState {
  final String uId;
  ApploginSuccessState(this.uId);
}

class ApploginErrorState extends AppState {
  final String error;
  ApploginErrorState(this.error);
}

class AppchangePasswordVisibilityState extends AppState {}

class ApploginrState extends AppState {}
