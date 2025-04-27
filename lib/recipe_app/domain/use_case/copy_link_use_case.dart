import 'package:recipe_app/recipe_app/domain/repository/copy_link_repository.dart';

class CopyLinkUseCase {
  final CopyLinkRepository copyLinkRepository;

  CopyLinkUseCase({required this.copyLinkRepository});

  //링크 텍스트로 받아옴
  Future<String?> getLink(int id) async {
    final link = await copyLinkRepository.getLink(id);
    print('Usecase에서 ${link}');
    return link;
  }

  //링크 복사
  void copyLink(int id) {
    copyLinkRepository.copyLink(id);
  }
}
