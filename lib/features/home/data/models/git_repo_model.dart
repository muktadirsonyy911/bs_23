import 'package:bs_23/core/values/git_repo_database_fields.dart';
import 'package:bs_23/features/home/domain/entities/git_repo_entity.dart';

class GitRepoModel extends GitRepoEntity {
  GitRepoModel(
      {required super.id,
        required super.name,
        required super.ownerName,
        String? ownerPhoto,
        required super.starCount,
        super.description,
        super.url,
        super.ownerGit,
        required super.updatedAt})
      : super(
    ownerPhoto: ownerPhoto ?? '',
  );

  factory GitRepoModel.fromJson(Map<String, dynamic> json) {
    return GitRepoModel(
      id: json[GitRepoDatabaseFields.id],
      name: json[GitRepoDatabaseFields.name],
      ownerName: getOwnerName(json),
      ownerPhoto: getOwnerPhoto(json),
      starCount: json[GitRepoDatabaseFields.starCount],
      description: json[GitRepoDatabaseFields.description] ?? '',
      url: json[GitRepoDatabaseFields.gitLink] ?? '',
      ownerGit: json[GitRepoDatabaseFields.ownerGit] ?? '',
      updatedAt: json[GitRepoDatabaseFields.updatedAt],
    );
  }

  factory GitRepoModel.fromLocal(Map<String, dynamic> json) {
    return GitRepoModel(
      id: json[GitRepoDatabaseFields.id],
      name: json[GitRepoDatabaseFields.name],
      ownerName: json[GitRepoDatabaseFields.ownerName],
      ownerPhoto: json[GitRepoDatabaseFields.ownerPhoto],
      starCount: json[GitRepoDatabaseFields.starCount],
      description: json[GitRepoDatabaseFields.description] ?? '',
      url: json[GitRepoDatabaseFields.gitLink] ?? '',
      ownerGit: json[GitRepoDatabaseFields.ownerGit] ?? '',
      updatedAt: json[GitRepoDatabaseFields.updatedAt],
    );
  }

  Map<String, Object?> toJson() => {
    GitRepoDatabaseFields.id: id,
    GitRepoDatabaseFields.name: name,
    GitRepoDatabaseFields.starCount: starCount,
    GitRepoDatabaseFields.ownerName: ownerName,
    GitRepoDatabaseFields.ownerPhoto: ownerPhoto,
    GitRepoDatabaseFields.description: description,
    GitRepoDatabaseFields.gitLink: url,
    GitRepoDatabaseFields.ownerGit: ownerGit,
    GitRepoDatabaseFields.updatedAt: updatedAt,
  };

  static String getOwnerName(Map<String, dynamic> json) {
    if (json['owner'] != null && json['owner']['login'] != null) {
      return json['owner']['login'];
    }

    return '';
  }

  static String getOwnerPhoto(Map<String, dynamic> json) {
    if (json['owner'] != null && json['owner']['avatar_url'] != null) {
      return json['owner']['avatar_url'];
    }

    return '';
  }
}
