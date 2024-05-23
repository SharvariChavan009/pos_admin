import '../../data/tenant_data.dart';

abstract class TenantListState{}

final class TenantListInitialState extends TenantListState{}

final class TenantListLoadingState extends TenantListState{}
final class TenantListSuccessState extends TenantListState{
  List<Tenant>? tenant;
  TenantListSuccessState({required this.tenant});
}

final class TenantListFailureState extends TenantListState{}