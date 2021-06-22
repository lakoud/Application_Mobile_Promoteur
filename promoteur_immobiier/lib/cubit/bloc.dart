import 'package:bloc/bloc.dart';
import 'package:promoteur_immobiier/cubit/event.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/models/searchRepositiry.dart';

class SearchBloc extends Bloc<SearchEvents, AppState> {
  SearchRepository repo;
  SearchBloc(AppState initialState, SearchRepository searchRepository)
      : super(initialState);

  @override
  Stream<AppState> mapEventToState(SearchEvents event) async* {
    if (event is FindEvent) {
      yield LoadingStatz();
      var projet = await repo.findEmp(event.key);
      yield SearchState(projet: projet);
    }
  }
}
