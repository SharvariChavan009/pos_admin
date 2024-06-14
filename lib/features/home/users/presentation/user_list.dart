import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/images/images_constant.dart';
import 'package:pos_admin/core/common/widgets/c_searchbar.dart';
import 'package:pos_admin/core/common/widgets/custom_snackbar.dart';
import 'package:pos_admin/features/home/users/cubits/search/search_cubit.dart';
import 'package:pos_admin/features/home/users/data/user_data.dart';
import '../../../../core/common/colors.dart';
import '../../../../core/common/widgets/label.dart';
import '../../widget/data_table.dart';
import '../bloc/user_list/user_list_bloc.dart';
import '../bloc/user_list/user_list_state.dart';

class UserListSetting extends StatefulWidget {
  const UserListSetting({super.key});

  @override
  UserListSettingState createState() => UserListSettingState();
}

class UserListSettingState extends State<UserListSetting> {
  int _rowsPerPage = 10;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool _selectAll = false;
  Image imageUrl = Image.asset('assets/image/pizza.webp');

  List<User> users = [];
  List<User> searchResult = [];
  List<User> displayUser = [];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dataTableTheme: DataTableThemeData(
          dataRowColor: MaterialStateColor.resolveWith(
              (states) => AppColors.primaryColor),
        ),
      ),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccessState) {
            print("Search Success");
            print(state.searchList.length);

            searchResult = state.searchList;
          }
         
          return BlocBuilder<UserListBloc, UserListState>(
            builder: (context, state) {
              if (state is UserListLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserListSuccessState) {
                print("users = ${state.users!.length}");
                users = state.users!;
                print("searchlist =${searchResult}");
                print("users list = ${users}");
                if (searchResult.isEmpty) {
                  displayUser = users;
                } else {
                  displayUser = searchResult;
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 10,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: PageTable(users: displayUser, menuName: "User"),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
