import 'package:github_repository_search/src/features/home/home_app_bar/data/home_app_bar_data_source.dart';
import 'package:github_repository_search/src/export_box.dart';

final appBarRepository = StateNotifierProvider.autoDispose<AppBarRepository,
    AppBarRepositoryDataSource>(
  (ref) => AppBarRepository(),
);

class AppBarRepository extends StateNotifier<AppBarRepositoryDataSource> {
  AppBarRepository() : super(const AppBarRepositoryDataSource());

  void makeTapped() {
    state = state.copyWith(wasTapped: true);
  }
}
