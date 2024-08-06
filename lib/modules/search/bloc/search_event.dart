abstract class SearchEvent {}

class FetchSearchResults extends SearchEvent {
  final int page;

  FetchSearchResults(this.page);
}
