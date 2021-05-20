abstract class PropState {}

class PropInitialState extends PropState {}

class GetLoadingPropStates extends PropState {}

class GetSuccessPropStates extends PropState {}

class GetErrorPropStates extends PropState {
  final String error;
  GetErrorPropStates(this.error);
}

//mta3 Create
class CreatePropSuccessStates extends PropState {}

class CreatePropErrorStates extends PropState {
  final String error;
  CreatePropErrorStates(this.error);
}
