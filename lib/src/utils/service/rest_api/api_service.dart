import 'package:chopper/chopper.dart';
part 'api_service.chopper.dart';

@ChopperApi(baseUrl: "https://api.github.com")
abstract class ApiService extends ChopperService {
  @Get(path: "/search/repositories?q={repo}")
  Future<Response> getRepo(@Path('repo') String repo);

  static ApiService create() {
    final client = ChopperClient(
      // GitHubへのリンク
      baseUrl: Uri.parse('https://api.github.com'),
      services: [
        // The generated implementation
        _$ApiService(),
      ],
      // JSONとの間でデータを変換し、application/jsonヘッダーを追加します。
      converter: const JsonConverter(),
      interceptors: [
        // Header
        (Request request) => applyHeaders(
              request,
              {
                'X-GitHub-Api-Version': '2022-11-28',
              },
            ),
      ],
    );

    // ChopperClient が渡された生成クラス。
    return _$ApiService(client);
  }
}
