abstract class AppMessageState {}

class AppMessageInitialState extends AppMessageState {}

class AppMessageLoadingState extends AppMessageState {}

class AppMessageGetUserSuccessState extends AppMessageState {}

class AppMessageGetUserErrorState extends AppMessageState {
  final String error;
  AppMessageGetUserErrorState(this.error);
}
