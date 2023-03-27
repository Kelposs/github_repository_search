class GitHubTile {
  final String author;
  final String avatarUrl;
  final String description;
  final String name;
  final String language;
  final int starCount;
  final int watchers;
  final int forks;
  final int issues;

  GitHubTile({
    required this.author,
    required this.avatarUrl,
    required this.description,
    required this.name,
    required this.language,
    required this.starCount,
    required this.watchers,
    required this.forks,
    required this.issues,
  });

  static fromJson(Map<String, dynamic> json) {
    List<dynamic> itemList = json['items'];

    return [
      for (var item in itemList)
        GitHubTile(
            author: item['owner']["login"],
            avatarUrl: item['owner']['avatar_url'],
            name: item['name'],
            description: item['description'],
            starCount: item['stargazers_count'],
            forks: item['forks_count'],
            issues: item['open_issues_count'],
            language: item['language'],
            watchers: item["watchers_count"])
    ];
  }
}
