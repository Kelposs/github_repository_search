import 'package:chopper/chopper.dart';
import 'package:github_repository_search/src/features/github/data/domain/github_tile.dart';
import 'package:github_repository_search/src/utils/service/rest_api/api_service.dart';

class GitHubRepository {
  final ApiService service = ApiService.create();

  Future<List<GitHubTile>> getRepo() async {
    final Response response = await service.getRepo("Flutter");
    if (response.isSuccessful) {
      final responseBodyJson = response.body as Map<String, dynamic>;
      // jsonのパース
      return GitHubTile.fromJson(responseBodyJson);
    } else {
      return [];
    }
  }
}
