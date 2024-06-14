import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos_admin/core/common/widgets/c_lists.dart';

import 'package:pos_admin/features/home/users/data/user_data.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial()) {}

  // Search Function

  void searchFunctio(String value) async {
    List<User> filteredData;
    List<User> users = ListConstatnts.users;

    filteredData = users
        .where((userItem) =>
            userItem.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    print("searchlist");

    print('Filtered Data Length: ${filteredData.length}');
    emit(SearchSuccessState(searchList: filteredData));
  }
}
