import '../tv.dart';

class TvsResponse {
  final int page;
  final List<Tv> results;
  final int total_pages;
  final int total_results;

  TvsResponse(this.page, this.results, this.total_pages, this.total_results);
}
