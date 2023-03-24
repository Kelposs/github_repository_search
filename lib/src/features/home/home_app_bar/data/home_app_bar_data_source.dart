import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_app_bar_data_source.freezed.dart';

@freezed
class AppBarRepositoryDataSource with _$AppBarRepositoryDataSource {
  const factory AppBarRepositoryDataSource({
    @Default(false) bool wasTapped,
  }) = _AppBarRepositoryDataSource;
}
