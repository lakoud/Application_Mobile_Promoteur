import 'package:promoteur_immobiier/modules/projetrealiser/recherche/data/search_model.dart';

abstract class SearchStates {}

class InitState extends SearchStates {}

class LoadingState extends SearchStates {}

class AddState extends SearchStates {}

class GetState extends SearchStates {
  List<SearchModel> emps;
  GetState({this.emps});
}

class SearchState extends SearchStates {
  List<SearchModel> emps;
  SearchState({this.emps});
}
