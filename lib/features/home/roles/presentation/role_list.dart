import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/images/images_constant.dart';
import 'package:pos_admin/core/common/widgets/custom_snackbar.dart';
import 'package:pos_admin/features/home/roles/bloc/role_list/role_list_bloc.dart';
import 'package:pos_admin/features/home/roles/bloc/role_list/role_list_state.dart';
import 'package:pos_admin/features/home/roles/data/role_data.dart';
import 'package:pos_admin/features/home/users/data/user_data.dart';
import '../../../../core/common/colors.dart';
import '../../../../core/common/widgets/label.dart';
import '../../presentation/bloc/menu_name_bloc.dart';
import '../../presentation/bloc/menu_name_event.dart';
import '../../widget/data_table.dart';


class RoleListSetting extends StatefulWidget {
  const RoleListSetting({super.key});

  @override
  RoleListSettingState createState() => RoleListSettingState();
}

class RoleListSettingState extends State<RoleListSetting> {
  int _rowsPerPage = 10;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool _selectAll = false;
  Image imageUrl = Image.asset('assets/image/pizza.webp');

  List<Role> roles = [
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dataTableTheme: DataTableThemeData(
          dataRowColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.primaryColor),
        ),
      ),
      child: BlocBuilder<RoleListBloc, RoleListState>(
        builder: (context, state) {
          if(state is RoleListLoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is RoleListSuccessState){
            print("Role = ${state.role!.length}");
            roles = state.role!;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: PageTable(users: roles, menuName: 'Role',),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



class PageTable extends StatefulWidget {
  List<Role> users;
  String menuName;
  PageTable({required this.menuName, required this.users, super.key});

  @override
  State<PageTable> createState() => _PageTableState();
}

class _PageTableState extends State<PageTable> {
  int? _rowsPerPage = 10;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool _selectAll = false;
  Image imageUrl = Image.asset('assets/image/pizza.webp');
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      horizontalMargin: 15,
      showEmptyRows: false,
      showCheckboxColumn: false,
      showFirstLastButtons: true,
      headingRowColor:
      MaterialStateColor.resolveWith((states) => AppColors.primaryColor),
      arrowHeadColor: AppColors.secondaryColor,
      columnSpacing: 100,
      rowsPerPage: _rowsPerPage!,
      onRowsPerPageChanged: (value) {
        setState(
              () {
            _rowsPerPage = value ?? PaginatedDataTable.defaultRowsPerPage;
          },
        );
      },
      sortAscending: _sortAscending,
      sortColumnIndex: _sortColumnIndex,
      columns: [
        DataColumn(
          label: Checkbox(
            activeColor: AppColors.secondaryColor,
            side: BorderSide(color: AppColors.whiteColor.withOpacity(.8)),
            checkColor: AppColors.whiteColor,
            tristate: true,
            value: _selectAll,
            onChanged: (value) {
              setState(() {
                _selectAll = value ?? false;
                // Update the selection status of each row
                for (var menu in widget.users) {
                  // menu['selected'] = _selectAll;
                }
              });
            },
          ),
        ),
        DataColumn(
          label: const Text(
            'Name',
            style: TextStyle(
                color: AppColors.iconColor,
                fontFamily: CustomLabels.primaryFont),
          ),
          onSort: (columnIndex, ascending) {
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if (ascending) {
                widget.users.sort((a, b) => a.name!.compareTo(b.name!));
              } else {
                widget.users.sort((a, b) => b.name!.compareTo(a.name!));
              }
            });
          },
        ),

        DataColumn(
          label: const Text(
            '',
            style: TextStyle(
                color: AppColors.iconColor,
                fontFamily: CustomLabels.primaryFont),
          ),
          onSort: (columnIndex, ascending) {
            // No need to sort the Action column
          },
        ),
        DataColumn(
          label: const Text(
            '',
            style: TextStyle(
                color: AppColors.iconColor,
                fontFamily: CustomLabels.primaryFont),
          ),
          onSort: (columnIndex, ascending) {
            // No need to sort the Action column
          },
        ),
      ],
      source: OrderDataSource(widget.users,context),
    );
  }
}

class OrderDataSource extends DataTableSource {
  final List<Role> orders;
  BuildContext context;
  OrderDataSource(this.orders,this.context);

  @override
  DataRow? getRow(int index) {
    if (index >= orders.length) return null;
    final order = orders[index];
    return DataRow.byIndex(
        index: index,
        // selected: order['selected'] ?? false,
        selected: false,
        onSelectChanged: (selected) {
          if (selected != null) {
            // orders[index]['selected'] = selected;
          }
        },
        cells: [
          DataCell(
            Checkbox(
              // value: order['selected'] ?? false,
              value: false,
              onChanged: (value) {
                if (value != null) {
                  // orders[index]['selected'] = value;
                }
              },
            ),
          ),
          DataCell(
            Text(
              order.name.toString(),
              style: const TextStyle(
                  fontFamily: CustomLabels.primaryFont,
                  color: AppColors.whiteColor),
            ),
          ),
          DataCell(InkWell(
              onTap: (){
                print("view clicked");
                BlocProvider.of<MenuNameBloc>(context).add(MenuNameSelected(context: context, menuName: "View"));
              },
              child: const Row(children: [
                Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.iconColor,
                ),
                SizedBox(width: 4),
                Text(
                  'View',
                  style: TextStyle(
                      fontFamily: CustomLabels.primaryFont,
                      color: AppColors.secondaryColor),
                ),
              ]))),
          DataCell(InkWell(
              onTap: (){
                BlocProvider.of<MenuNameBloc>(context).add(MenuNameSelected(context: context, menuName: "Edit"));
              },
              child: const Row(children: [
                Icon(
                  Icons.edit_note,
                  color: AppColors.iconColor,
                ),
                SizedBox(width: 4),
                Text(
                  'Edit',
                  style: TextStyle(
                      fontFamily: CustomLabels.primaryFont,
                      color: AppColors.secondaryColor),
                ),
              ]))),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
