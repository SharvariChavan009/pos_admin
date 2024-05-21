import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/routes/router.dart';
import 'package:pos_admin/features/auth/presentation/bloc/email_validation/email_validation_bloc.dart';
import 'package:pos_admin/features/auth/presentation/login_page.dart';

import 'core/common/colors.dart';
import 'features/auth/domain/repository/login_repository.dart';
import 'features/auth/presentation/bloc/password_validation/password_validation_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider<EmailTextFieldValidationBloc>(
          create: (context) =>
              EmailTextFieldValidationBloc(borderColor: AppColors.secondaryColor),
        ),
        BlocProvider<PasswordValidationBloc>(
          create: (context) =>
              PasswordValidationBloc(borderColor: AppColors.secondaryColor),
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
