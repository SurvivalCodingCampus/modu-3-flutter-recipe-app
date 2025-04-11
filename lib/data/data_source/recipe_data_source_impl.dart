import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  final List<RecipeDto> _mockRecipes = [
    RecipeDto(
      id: "recipe_001",
      name: "Traditional spare ribs baked",
      estimatedTime: 30,
      isFavorite: true,
      rate: 4.8,
      makeUserName: "최chef",
      makeUserImageUrl: "https://images.pexels.com/photos/3814446/pexels-photo-3814446.jpeg",
      videoUrl: "https://player.vimeo.com/external/414879105.sd.mp4?s=9ec2ec4a3f95584bba0a30b8c5c33232e79c6aee&profile_id=139&oauth2_token_id=57447761",
      imageUrl: "https://images.pexels.com/photos/5835353/pexels-photo-5835353.jpeg",
    ),

    RecipeDto(
      id: "recipe_002",
      name: "불고기",
      estimatedTime: 45,
      isFavorite: true,
      rate: 4.9,
      makeUserName: "한식마스터",
      makeUserImageUrl: "https://images.pexels.com/photos/3771807/pexels-photo-3771807.jpeg",
      videoUrl: "https://player.vimeo.com/external/371867463.sd.mp4?s=76edaeefdb9eb67734ca388c5889e202137dd11a&profile_id=139&oauth2_token_id=57447761",
      imageUrl: "https://images.pexels.com/photos/2313686/pexels-photo-2313686.jpeg",
    ),

    RecipeDto(
      id: "recipe_003",
      name: "파스타 카르보나라",
      estimatedTime: 20,
      isFavorite: false,
      rate: 4.5,
      makeUserName: "파스타장인",
      makeUserImageUrl: "https://images.pexels.com/photos/887827/pexels-photo-887827.jpeg",
      videoUrl: null,
      imageUrl: "https://images.pexels.com/photos/1527603/pexels-photo-1527603.jpeg",
    ),

    RecipeDto(
      id: "recipe_004",
      name: "베이컨 아보카도 샐러드",
      estimatedTime: 15,
      isFavorite: true,
      rate: 4.3,
      makeUserName: "건강식연구소",
      makeUserImageUrl: "https://images.pexels.com/photos/1197132/pexels-photo-1197132.jpeg",
      videoUrl: "https://player.vimeo.com/external/403283608.sd.mp4?s=e749a56d72da7809f57b6a865073b6b199326e19&profile_id=139&oauth2_token_id=57447761",
      imageUrl: "https://images.pexels.com/photos/1213710/pexels-photo-1213710.jpeg",
    ),

    RecipeDto(
      id: "recipe_005",
      name: "스팸 김치 볶음밥",
      estimatedTime: 25,
      isFavorite: false,
      rate: 4.7,
      makeUserName: "집밥요리사",
      makeUserImageUrl: "https://images.pexels.com/photos/3771089/pexels-photo-3771089.jpeg",
      videoUrl: null,
      imageUrl: "https://images.pexels.com/photos/723198/pexels-photo-723198.jpeg",
    ),

    RecipeDto(
      id: "recipe_006",
      name: "초코 머핀",
      estimatedTime: 60,
      isFavorite: true,
      rate: 4.6,
      makeUserName: "베이킹마스터",
      makeUserImageUrl: "https://images.pexels.com/photos/4148961/pexels-photo-4148961.jpeg",
      videoUrl: "https://player.vimeo.com/external/368767165.sd.mp4?s=0797a7c9b25ae2a1f192a1ded04a7f335774cb91&profile_id=139&oauth2_token_id=57447761",
      imageUrl: "https://images.pexels.com/photos/1055272/pexels-photo-1055272.jpeg",
    ),

    RecipeDto(
      id: "recipe_007",
      name: "닭갈비",
      estimatedTime: 40,
      isFavorite: false,
      rate: 4.4,
      makeUserName: "춘천요리사",
      makeUserImageUrl: "https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg",
      videoUrl: "https://player.vimeo.com/external/352320117.sd.mp4?s=81764d11ab83a6c46901e1054221fed80a26f073&profile_id=139&oauth2_token_id=57447761",
      imageUrl: "https://images.pexels.com/photos/2338407/pexels-photo-2338407.jpeg",
    ),

    RecipeDto(
      id: "recipe_008",
      name: "비빔밥",
      estimatedTime: 35,
      isFavorite: true,
      rate: 4.9,
      makeUserName: "전통한식",
      makeUserImageUrl: "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg",
      videoUrl: null,
      imageUrl: "https://images.pexels.com/photos/5835359/pexels-photo-5835359.jpeg",
    ),
  ];

  @override
  Future<List<RecipeDto>> fetchSavedRecipes() async {
    return await Future.value(_mockRecipes);
  }

}