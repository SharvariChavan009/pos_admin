import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/images/images_constant.dart';
import 'package:pos_admin/core/common/widgets/custom_snackbar.dart';
import 'package:pos_admin/features/home/users/data/user_data.dart';
import '../../../../core/common/colors.dart';
import '../../../../core/common/widgets/label.dart';
import '../bloc/user_list/user_list_bloc.dart';
import '../bloc/user_list/user_list_state.dart';

class MenuListSetting extends StatefulWidget {
  const MenuListSetting({super.key});

  @override
  MenuListSettingState createState() => MenuListSettingState();
}

class MenuListSettingState extends State<MenuListSetting> {
  int _rowsPerPage = 10;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool _selectAll = false;
  Image imageUrl = Image.asset('assets/image/pizza.webp');

  List<UserData> users = [
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
      child: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if(state is UserListSuccessState){
            users = state.users!;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: PaginatedDataTable(
                    horizontalMargin: 15,
                    showEmptyRows: false,
                    showCheckboxColumn: false,
                    showFirstLastButtons: true,
                    headingRowColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.primaryColor),
                    arrowHeadColor: AppColors.secondaryColor,
                    columnSpacing: 60,
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (value) {
                      setState(
                            () {
                          _rowsPerPage =
                              value ?? PaginatedDataTable.defaultRowsPerPage;
                        },
                      );
                    },
                    sortAscending: _sortAscending,
                    sortColumnIndex: _sortColumnIndex,
                    columns: [
                      DataColumn(
                        label: Checkbox(
                          activeColor: AppColors.secondaryColor,
                          side: BorderSide(
                              color: AppColors.whiteColor.withOpacity(.8)),
                          checkColor: AppColors.whiteColor,
                          tristate: true,
                          value: _selectAll,
                          onChanged: (value) {
                            setState(() {
                              _selectAll = value ?? false;
                              // Update the selection status of each row
                              for (var menu in users) {
                                // menu['selected'] = _selectAll;
                              }
                            });
                          },
                        ),
                      ),
                      const DataColumn(
                        label: Text('Profile Photo',
                          style: TextStyle(
                              color: AppColors.iconColor,
                              fontFamily: CustomLabels.primaryFont),
                        ),),
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
                              users.sort((a, b) =>
                                  a.name.compareTo(b.name));
                            } else {
                              users.sort((a, b) =>
                                  b.name.compareTo(a.name));
                            }
                          });
                        },
                      ),
                      DataColumn(
                        label: const Text(
                          'Email',
                          style: TextStyle(
                              color: AppColors.iconColor,
                              fontFamily: CustomLabels.primaryFont),
                        ),
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                            if (ascending) {
                              users.sort(
                                      (a, b) =>
                                      a.email.compareTo(b.email));
                            } else {
                              users.sort(
                                      (a, b) =>
                                      b.email.compareTo(a.email));
                            }
                          });
                        },
                      ),
                      DataColumn(
                        label: const Text(
                          'Phone',
                          style: TextStyle(
                              color: AppColors.iconColor,
                              fontFamily: CustomLabels.primaryFont),
                        ),
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                            if (ascending) {
                              users.sort(
                                      (a, b) =>
                                      a.phone.compareTo(b.phone));
                            } else {
                              users.sort(
                                      (a, b) =>
                                      b.phone.compareTo(a.phone));
                            }
                          });
                        },
                      ),
                      DataColumn(
                        label: const Text(
                          'Role',
                          style: TextStyle(
                              color: AppColors.iconColor,
                              fontFamily: CustomLabels.primaryFont),
                        ),
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                            // if (ascending) {
                            //   menus.sort((a, b) =>
                            //       a..compareTo(b['tableNumber']));
                            // } else {
                            //   menus.sort((a, b) =>
                            //       b['tableNumber'].compareTo(a['tableNumber']));
                            // }
                          });
                        },
                      ),
                      DataColumn(
                        label: const Text(
                          'Active',
                          style: TextStyle(
                              color: AppColors.iconColor,
                              fontFamily: CustomLabels.primaryFont),
                        ),
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                            // if (ascending) {
                            //   menus.sort((a, b) =>
                            //       a.active.compareTo(b.active));
                            // } else {
                            //   menus.sort((a, b) =>
                            //       b['guestName'].compareTo(a['guestName']));
                            // }
                          });
                        },
                      ),
                      DataColumn(
                        label: const Text(
                          'Order Status',
                          style: TextStyle(
                              color: AppColors.iconColor,
                              fontFamily: CustomLabels.primaryFont),
                        ),
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                            // if (ascending) {
                            //   menus.sort((a, b) =>
                            //       a['orderStatus'].compareTo(b['orderStatus']));
                            // } else {
                            //   menus.sort((a, b) =>
                            //       b['orderStatus'].compareTo(a['orderStatus']));
                            // }
                          });
                        },
                      ),
                      DataColumn(
                        label: const Text(
                          'Action',
                          style: TextStyle(
                              color: AppColors.iconColor,
                              fontFamily: CustomLabels.primaryFont),
                        ),
                        onSort: (columnIndex, ascending) {
                          // No need to sort the Action column
                        },
                      ),
                    ],
                    source: OrderDataSource(users),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class OrderDataSource extends DataTableSource {
  final List<UserData> orders;

  OrderDataSource(this.orders);

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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Image.asset(
                AppImages.backgroundImage,
                width: 50,
                height: 50,
              ),
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
          DataCell(
            Text(
              order.email.toString(),
              style: const TextStyle(
                  fontFamily: CustomLabels.primaryFont,
                  color: AppColors.secondaryColor),
            ),
          ),
          DataCell(Text(
            order.phone.toString(),
            style: const TextStyle(
                fontFamily: CustomLabels.primaryFont,
                color: AppColors.whiteColor),
          )),
          const DataCell(Text(
            // order['Role'].toString(),
            "Manager",
            style: TextStyle(
                fontFamily: CustomLabels.primaryFont,
                color: AppColors.whiteColor),
          )),
          DataCell(Text(
            order.active.toString(),
            style: const TextStyle(
                fontFamily: CustomLabels.primaryFont,
                color: AppColors.whiteColor),
          )),
          const DataCell(
            Text(
              // order['orderStatus'].toString(),
              "OrderStatus",
              style: TextStyle(
                  fontFamily: CustomLabels.primaryFont, color: Colors.yellow),
            ),
          ),
          const DataCell(InkWell(
            child: Text(
              'View Order',
              style: TextStyle(
                  fontFamily: CustomLabels.primaryFont,
                  color: AppColors.secondaryColor),
            ),
          )),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
