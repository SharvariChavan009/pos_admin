import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/colors.dart';
import '../../../../core/common/images/images_constant.dart';
import '../../../../core/common/widgets/label.dart';
import '../../presentation/bloc/menu_name_bloc.dart';
import '../../presentation/bloc/menu_name_event.dart';
import '../../widget/data_table.dart';
import '../bloc/tenant_list/tenant_list_bloc.dart';
import '../bloc/tenant_list/tenant_list_state.dart';
import '../data/tenant_data.dart';


class TenantListSetting extends StatefulWidget {
  const TenantListSetting({super.key});

  @override
  TenantListSettingState createState() => TenantListSettingState();
}

class TenantListSettingState extends State<TenantListSetting> {
  Image imageUrl = Image.asset('assets/image/pizza.webp');

  List<Tenant> tenants = [
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
      child:
      BlocBuilder<TenantListBloc, TenantListState>(
        builder: (context, state) {
          print("tenent bloc");
          if(state is TenantListSuccessState){
            print("Success state");
            tenants = state.tenants!;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: PageTableTenant(users: tenants, menuName: 'Tenants',),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


class PageTableTenant extends StatefulWidget {
  List<Tenant> users;
  String menuName;

  PageTableTenant({required this.menuName, required this.users, super.key});

  @override
  State<PageTableTenant> createState() => PageTableTenantState();
}

class PageTableTenantState extends State<PageTableTenant> {
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
      columnSpacing: 35,
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
        const DataColumn(
          label: Text(
            'Image',
            style: TextStyle(
                color: AppColors.iconColor,
                fontFamily: CustomLabels.primaryFont),
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
        const DataColumn(
          label: Text(
            'Website',
            style: TextStyle(
                color: AppColors.iconColor,
                fontFamily: CustomLabels.primaryFont),
          ),
          // onSort: (columnIndex, ascending) {
          //   setState(() {
          //     _sortColumnIndex = columnIndex;
          //     _sortAscending = ascending;
          //     if (ascending) {
          //       widget.users.sort((a, b) => a.email!.compareTo(b.email!));
          //     } else {
          //       widget.users.sort((a, b) => b.email!.compareTo(a.email!));
          //     }
          //   });
          // },
        ),
        const DataColumn(
          label: Text(
            'Units',
            style: TextStyle(
                color: AppColors.iconColor,
                fontFamily: CustomLabels.primaryFont),
          ),
          // onSort: (columnIndex, ascending) {
          //   setState(() {
          //     _sortColumnIndex = columnIndex;
          //     _sortAscending = ascending;
          //     if (ascending) {
          //       widget.users.sort((a, b) => a.phone!.compareTo(b.phone!));
          //     } else {
          //       widget.users.sort((a, b) => b.phone!.compareTo(a.phone!));
          //     }
          //   });
          // },
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
      source: OrderDataSource(widget.users, context),
    );
  }
}

class OrderDataSource extends DataTableSource {
  final List<Tenant> orders;
  BuildContext context;

  OrderDataSource(this.orders, this.context);

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
              order.website.toString(),
              style: const TextStyle(
                  fontFamily: CustomLabels.primaryFont,
                  color: AppColors.secondaryColor),
            ),
          ),
          const DataCell(Text(
            "units data",
            style: TextStyle(
                fontFamily: CustomLabels.primaryFont,
                color: AppColors.whiteColor),
          )),
          DataCell(order.active
              ? const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
          )
              : const Icon(
            Icons.cancel_outlined,
            color: Colors.red,
          )),
          DataCell(InkWell(
              onTap: () {
                print("view clicked");
                BlocProvider.of<MenuNameBloc>(context).add(
                    MenuNameSelected(context: context, menuName: "View"));
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
              onTap: () {
                BlocProvider.of<MenuNameBloc>(context).add(
                    MenuNameSelected(context: context, menuName: "Edit"));
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



