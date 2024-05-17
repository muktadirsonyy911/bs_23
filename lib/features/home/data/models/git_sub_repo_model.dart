import 'dart:convert';

import 'package:bs_23/features/home/domain/entities/sub_entitites.dart';

class GitSubRepoModel extends GitSubRepoEntity {
  GitSubRepoModel({
    super.id,
    super.name,
    super.forks,
    super.fullName,
    super.defaultBranch,
    super.description,
    super.htmlUrl,
    super.private,
    super.visibility,
    super.watchers,
  });


  factory GitSubRepoModel.fromRawJson(String str) => GitSubRepoModel.fromJson(json.decode(str));

  factory GitSubRepoModel.fromJson(Map<String, dynamic> json) => GitSubRepoModel(
    id: json["id"],
    name: json["name"],
    fullName: json["full_name"],
    private: json["private"],
    htmlUrl: json["html_url"],
    description: json["description"],
    visibility: json["visibility"],
    forks: json["forks"],
    watchers: json["watchers"],
    defaultBranch: json["default_branch"],
  );
}
