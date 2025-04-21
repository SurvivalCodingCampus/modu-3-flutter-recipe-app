import 'package:recipe_app/data/dto/search_data_dto.dart';
import 'package:recipe_app/domain/model/search_data.dart';

extension SearchDataDtoMapper on SearchData {
  SearchDataDto toDto() {
    return SearchDataDto(query: query, rate: rate, categories: categories);
  }
}

extension SearchDataMapper on SearchDataDto {
  SearchData toSearchData() {
    return SearchData(
      query: query,
      rate: rate?.toInt(),
      categories: categories ?? [],
    );
  }
}
