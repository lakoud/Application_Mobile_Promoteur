import 'package:promoteur_immobiier/models/projetrealisermodel.dart';

abstract class AppState {}

class AppInitialState extends AppState {}

//STATES BOUTTON NAV

class AppBottomNavState extends AppState {}

//STATES GET USER DONNER
class AppusergetLoadingState extends AppState {}

class AppMessageGetUserSuccessState extends AppState {}

class AppMessageGetUserErrorState extends AppState {
  final String error;
  AppMessageGetUserErrorState(this.error);
}

//PROFIL IMAGE :UPDATE
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

//login

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

//Login GOOGLE
class ApplogingoogleErrorState extends AppState {}

class ApploginGoogleLodingState extends AppState {}

class AppchangePasswordVisibilityState extends AppState {}

class ApploginrState extends AppState {}

class ApplogoutSuccessState extends AppState {}

class ApplogoutErrorState extends AppState {
  final String error;
  ApplogoutErrorState(this.error);
}

//crer compte
class AppRegisterInitialState extends AppState {}

class AppRegisterLodingState extends AppState {}

class AppRegisterSuccessState extends AppState {}

class AppRegisterErrorState extends AppState {
  final String error;
  AppRegisterErrorState(this.error);
}

class AppCreateUserSuccessState extends AppState {
  final String uId;
  AppCreateUserSuccessState(this.uId);
}

class AppCreateUserErrorState extends AppState {
  final String error;
  AppCreateUserErrorState(this.error);
}

//favorites

class AppAjouterfavoritesSuccessStates extends AppState {}

class AppAjouterfavoritesErrorStates extends AppState {}

class AppGefavoritesSucessStates extends AppState {}

//STATES PHONE NUMBER

class AppPhoneLodingState extends AppState {}

class AppPhoneSuccesState extends AppState {}

class AppRegisterPHoneerroeState extends AppState {}

class ErreurEnvoiState extends AppState {}

class AppverifyPHoneerroeState extends AppState {}

class AppCodeechec extends AppState {}

class AppCodeexactestate extends AppState {}

//STATES GET COORDONER DATA

class AppGetCordonnerLoadingState extends AppState {}

class AppGetCordonnerSuccessState extends AppState {}

class AppGetCordonnerErrorState extends AppState {}

//Get Projet en cour Data

class GetPCLodingState extends AppState {}

class GetPCSuccessState extends AppState {}

class GetPCErrorState extends AppState {
  final String error;
  GetPCErrorState(this.error);
}

class GetProjetlodingState extends AppState {}

class GetAllProjetSuccessState extends AppState {}

class GetAllProjeterrorState extends AppState {
  final String error;
  GetAllProjeterrorState(this.error);
}
// Projet en cours

class GetPenCoursLodingState extends AppState {}

class GetPenCoursSuccessState extends AppState {}

class GetPenCoursErrorState extends AppState {
  final String error;
  GetPenCoursErrorState(this.error);
}

class GetPenCourslodingState extends AppState {}

class GetAllPenCoursSuccessState extends AppState {}

class GetAllPenCourserrorState extends AppState {
  final String error;
  GetAllPenCourserrorState(this.error);
}

class GetAllAdresseSuccessState extends AppState {}

class AppLodinggetAddress extends AppState {}

class AppErrorgetAddress extends AppState {}

class GetAllequipementSuccessState extends AppState {}

class GetAllEquipSuccessState extends AppState {}

class AppLodinggetequipemnts extends AppState {}

class AppErrorgetequipemnts extends AppState {}

//appartment a vendre
class Getappartementfavoriterreur extends AppState {}

class Getappartementfavoritlodiing extends AppState {}

class Getappartementfavoritsuccess extends AppState {}

class GetappartmentAvendreloding extends AppState {}

class GetappartmentAvendresuccuss extends AppState {}

class GetappartmentAvendrefavoriteloding extends AppState {}

class GetappartmentAvendrefavsuccuss extends AppState {}
//Search projet en cours

class LoadingStatz extends AppState {}

class SearchState extends AppState {
  List<ProjetModel> projet;
  SearchState({this.projet});
}
