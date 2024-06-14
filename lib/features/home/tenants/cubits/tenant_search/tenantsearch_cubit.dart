import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos_admin/core/common/widgets/c_lists.dart';
import 'package:pos_admin/features/home/tenants/data/tenant_data.dart';

part 'tenantsearch_state.dart';

class TenantsearchCubit extends Cubit<TenantsearchState> {
  TenantsearchCubit() : super(TenantsearchInitial()) {
   
  }

  // Search Function

  void searchFunctio(String value) async {
    List<Tenant> filteredData;
    List<Tenant> tenants = ListConstatnts.tenants;

    print("Tenant Data: $tenants");

    filteredData = tenants
        .where((tenantItem) =>
            tenantItem.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();

    print("searchlist");

    print('Tenant Filtered Data Length: ${filteredData.length}');
    emit(TenantSearchSuccessState(searchList: filteredData));
  }
}
