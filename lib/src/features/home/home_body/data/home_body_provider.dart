import 'package:chopper/chopper.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/github/data/domain/github_tile.dart';
import 'package:github_repository_search/src/features/home/home_app_bar/data/app_bar_text_controller.dart';
import 'package:github_repository_search/src/utils/service/rest_api/api_service.dart';

final homeBodyProvider =
    FutureProvider.autoDispose<List<GitHubTile>>((ref) async {
  final textController = ref.watch(textControllerRepository);

  if (textController.text.isEmpty) return [];
  try {
    final ApiService service = ApiService.create();
    final Response response = await service.getRepo(textController.text);
    if (response.isSuccessful) {
      final responseBodyJson = response.body as Map<String, dynamic>;
      // jsonのパース
      return GitHubTile.fromJson(responseBodyJson);
    } else {
      return [];
    }
  } catch (e) {
    print('error caught: $e');
    return [];
  }
});
