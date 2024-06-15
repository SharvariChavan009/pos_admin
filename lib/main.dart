import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/cubits/Textfield_validation/textfield_validation_cubit.dart';
import 'package:pos_admin/core/common/cubits/confirm_password/confirmpassword_cubit.dart';
import 'package:pos_admin/core/common/cubits/email_validation/email_cubit.dart';
import 'package:pos_admin/core/common/cubits/mobile_validation/mobile_validation_cubit.dart';
import 'package:pos_admin/core/common/cubits/password_validation/login_cubit.dart';
import 'package:pos_admin/core/common/cubits/role_dropdown_validation/role_dropdown_cubit.dart';

import 'package:pos_admin/core/routes/router.dart';
import 'package:pos_admin/features/auth/presentation/bloc/email_validation/email_validation_bloc.dart';
import 'package:pos_admin/features/auth/presentation/login_page.dart';
import 'package:pos_admin/features/home/logout/bloc/logout_bloc.dart';
import 'package:pos_admin/features/home/presentation/bloc/menu_name_bloc.dart';
import 'package:pos_admin/features/home/roles/bloc/role_list/role_list_bloc.dart';
import 'package:pos_admin/features/home/tenants/bloc/tenant_list/tenant_list_bloc.dart';
import 'package:pos_admin/features/home/tenants/cubits/tenant_search/tenantsearch_cubit.dart';
import 'package:pos_admin/features/home/users/bloc/new_user/new_user_bloc.dart';
import 'package:pos_admin/features/home/users/cubits/search/search_cubit.dart';
import 'core/common/colors.dart';
import 'features/auth/domain/repository/login_repository.dart';
import 'features/auth/presentation/bloc/password_validation/password_validation_bloc.dart';
import 'features/home/users/bloc/user_list/user_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => MenuNameBloc()),
        BlocProvider(create: (context) => UserListBloc()),
        BlocProvider(create: (context) => TenantListBloc()),
        BlocProvider(create: (context) => RoleListBloc()),
        BlocProvider(create: (context) => NewUserBloc()),
        BlocProvider(create: (context) => LogoutBloc()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => TenantsearchCubit()),

        // Validation Cubits

        BlocProvider(create: (context) => EmailCubit()),
        BlocProvider(create: (context) => MobileValidationCubit()),
        BlocProvider(create: (context) => PasswordCubit()),
        BlocProvider(create: (context) => TextfieldValidationCubit()),
        BlocProvider(create: (context) => RoleDropdownCubit()),
        BlocProvider(create: (context) => ConfirmpasswordCubit()),


        
        // -----------
        BlocProvider<PasswordValidationBloc>(
          create: (context) =>
              PasswordValidationBloc(borderColor: AppColors.secondaryColor),
        ),
        BlocProvider<EmailTextFieldValidationBloc>(
          create: (context) => EmailTextFieldValidationBloc(
              borderColor: AppColors.secondaryColor),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'POS-Admin',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
