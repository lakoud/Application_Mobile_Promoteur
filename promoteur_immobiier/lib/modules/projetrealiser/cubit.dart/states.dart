abstract class PRState {}

class PRInitialState extends PRState {}

class GetPRLodingState extends PRState {}

class GetPRSuccessState extends PRState {}

class GetPRErrorState extends PRState {
  final String error;
  GetPRErrorState(this.error);
}
