class GitSubRepoEntity {
  final int? id;
  final String? name;
  final String? fullName;
  final bool? private;
  final String? htmlUrl;
  final String? description;
  final String? visibility;
  final int? forks;
  final int? watchers;
  final String? defaultBranch;
  GitSubRepoEntity({
    this.id,
    this.name,
    this.fullName,
    this.private,
    this.htmlUrl,
    this.description,
    this.visibility,
    this.forks,
    this.watchers,
    this.defaultBranch,
  });
}
