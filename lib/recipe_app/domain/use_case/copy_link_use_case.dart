import 'package:recipe_app/recipe_app/domain/repository/copy_link_repository.dart';

class CopyLinkUseCase{
  final CopyLinkRepository copyLinkRepository;

  CopyLinkUseCase({required this.copyLinkRepository});

  void execute(int id){
    copyLinkRepository.copyLink(id);
  }
}