import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/images/images_constant.dart';
import 'package:pos_admin/core/common/widgets/custom_snackbar.dart';
import 'package:pos_admin/features/home/users/data/user_data.dart';
import '../../../../core/common/colors.dart';
import '../../../../core/common/widgets/label.dart';
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
  int _rowsPerPage = 10;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool _selectAll = false;
  Image imageUrl = Image.asset('assets/image/pizza.webp');

  List<Tenant> users = [
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
      child: BlocBuilder<TenantListBloc, TenantListState>(
        builder: (context, state) {
          if(state is TenantListLoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is TenantListSuccessState){
            print("tenant = ${state.tenant!.length}");
            users = state.tenant!;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: PageTable(users: users, menuName: 'Tenants',),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

