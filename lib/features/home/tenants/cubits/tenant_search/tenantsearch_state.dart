part of 'tenantsearch_cubit.dart';

@immutable
sealed class TenantsearchState {}

final class TenantsearchInitial extends TenantsearchState {}

final class TenantSearchSuccessState extends TenantsearchState {
  List<Tenant> searchList = [];

  TenantSearchSuccessState({required this.searchList});
}

final class SearchFailuareState extends TenantsearchState {}
