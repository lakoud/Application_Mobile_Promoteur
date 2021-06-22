abstract class SearchEvents {}

class FindEvent extends SearchEvents {
  String key;
  FindEvent({this.key});
}
