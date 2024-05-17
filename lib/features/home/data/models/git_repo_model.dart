import 'dart:convert';

import 'package:bs_23/features/home/data/models/git_sub_repo_model.dart';
import 'package:bs_23/features/home/domain/entities/git_repo_entity.dart';


class GitRepoModel extends GitRepoEntity {

  GitRepoModel({
    super.totalCount,
    super.incompleteResults,
    super.items,
  });

  factory GitRepoModel.fromRawJson(String str) => GitRepoModel.fromJson(json.decode(str));

  factory GitRepoModel.fromJson(Map<String, dynamic> json) => GitRepoModel(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: json["items"] == null ? [] : List<GitSubRepoModel>.from(json["items"]!.map((x) => GitSubRepoModel.fromJson(x))),
  );

}
