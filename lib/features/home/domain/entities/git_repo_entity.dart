import 'package:bs_23/features/home/domain/entities/sub_entitites.dart';

class GitRepoEntity {
  final int? totalCount;
  final bool? incompleteResults;
  final List<GitSubRepoEntity>? items;

  GitRepoEntity({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });
}
