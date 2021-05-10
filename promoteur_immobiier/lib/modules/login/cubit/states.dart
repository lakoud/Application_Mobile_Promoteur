abstract class AppLoginStates {}

class ApploginInitialState extends AppLoginStates {}

class ApploginLodingState extends AppLoginStates {}

class ApploginSuccessState extends AppLoginStates {
  final String uId;
  ApploginSuccessState(this.uId);
}

class ApploginErrorState extends AppLoginStates {
  final String error;
  ApploginErrorState(this.error);
}

class AppchangePasswordVisibilityState extends AppLoginStates {}

class ApploginrState extends AppLoginStates {}
