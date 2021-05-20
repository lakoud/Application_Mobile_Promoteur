abstract class PCState {}

class PCInitialState extends PCState {}

class GetPCLodingState extends PCState {}

class GetPCSuccessState extends PCState {}

class GetPCErrorState extends PCState {
  final String error;
  GetPCErrorState(this.error);
}
