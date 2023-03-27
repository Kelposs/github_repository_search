import 'package:chopper/chopper.dart';
import 'package:github_repository_search/src/export_box.dart';
import 'package:github_repository_search/src/features/github/data/domain/github_tile.dart';
import 'package:github_repository_search/src/features/home/home_app_bar/data/app_bar_text_controller.dart';
import 'package:github_repository_search/src/utils/error/sunabako_exception.dart';
import 'package:github_repository_search/src/utils/service/rest_api/api_service.dart';

final homeBodyProvider =
    FutureProvider.autoDispose<List<GitHubTile>>((ref) async {
  final textController = ref.watch(textControllerRepository);

  if (textController.text.isEmpty) return [];
  final ApiService service = ApiService.create();
  final Response response = await service.getRepo(textController.text);
  switch (response.statusCode) {
    case 200:
      final responseBodyJson = response.body as Map<String, dynamic>;
      // jsonのパース
      return GitHubTile.fromJson(responseBodyJson);
    case 302:
      // 302 Not Modified : 要求されたコンテンツは前回送信以降更新されていない
      throw MyAppException('302');
    case 403:
      // 403: Apiコールの上限
      throw MyAppException('403');
    case 422:
      // 422 	Validation failed, or the endpoint has been spammed. : サーバー側がリクエストを理解しているにもかかわらず、処理ができない
      throw MyAppException('422');
    case 503:
      // 503 	Service unavailable : サービスが一時的に利用不可
      throw MyAppException('503');
    default:
      throw MyAppException('9999');
  }
});
