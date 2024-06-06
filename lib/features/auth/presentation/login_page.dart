import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/u_validations_all.dart';
import 'package:pos_admin/core/routes/router.dart';
import 'package:pos_admin/features/auth/domain/repository/login_repository.dart';
import 'package:pos_admin/features/auth/presentation/bloc/email_validation/email_validation_bloc.dart';
import 'package:pos_admin/features/auth/presentation/bloc/login_state.dart';
import '../../../core/common/images/images_constant.dart';
import '../../../core/common/widgets/c_text_field.dart';
import '../../../core/common/colors.dart';
import '../../../core/common/widgets/custom_snackbar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../../core/common/widgets/label.dart';
import '../../../core/common/widgets/w_custom_button.dart';
import 'bloc/email_validation/email_validation_event.dart';
import 'bloc/email_validation/email_validation_state.dart';
import 'bloc/login_event.dart';
import 'bloc/password_validation/password_validation_bloc.dart';
import 'bloc/password_validation/password_validation_event.dart';
import 'bloc/password_validation/password_validation_state.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          OverlayManager.showSnackbar(context,
              type: ContentType.failure,
              title: "Login Failed",
              message: "Please try again!");
        }
        if(state is LoginSuccess) {
          router.go('/home');
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Full-screen background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Centered Card widget
            Center(
              child: SizedBox(

                width: 400,
                height: 430,
                child: Card(
                  elevation: 5,
                  color: AppColors.darkColor.withOpacity(0.8), // Adjust opacity as needed
                  margin: EdgeInsets.all(16),
                  child: LoginColumn(context),
                ),
              ),
            ),
          ],
        ),
      ));
  }
}



Widget LoginColumn(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(
        height: 30,
      ),
      AutoSizeText(
            "Admin",
            textAlign: TextAlign.center,
            minFontSize: 10,
            maxFontSize: 30,
            maxLines: 1,
            style: CustomLabels.body1TextStyle(
                fontSize: 30, fontWeight: CustomLabels.smallFontWeight,color: AppColors.whiteColor),
          ),
      const SizedBox(
        height: 15,
      ),

      AutoSizeText(
       "Sign IN",
        textAlign: TextAlign.center,
        minFontSize: 13,
        maxFontSize: 18,
        style: CustomLabels.bodyTextStyle(
            fontSize: 15,
            fontFamily: CustomLabels.primaryFont,
            letterSpacing: .5,
            color: AppColors.iconColor),
        maxLines: 1,
      ),
      const SizedBox(
        height: 30,
      ),
      BlocBuilder<EmailTextFieldValidationBloc, TextfieldValidationState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                backGroundColor: AppColors.darkColor,
                controller: emailController,
                hintText: 'Email',
                cursorColor: AppColors.baseColor,
                borderColor: (state is TextFieldValidationSuccess ||
                    state is TextfieldValidationInitial)
                    ? AppColors.baseColor
                    : Colors.red,
              ),
              Padding(
                padding: (state is TextFieldValidationSuccess ||
                    state is TextfieldValidationInitial)
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(
                    left: 8, top: 5, right: 0, bottom: 0),
                child: Visibility(
                  visible: state is TextfieldValidationFailure,
                  child: AutoSizeText(
                    (state is TextFieldValidationSuccess ||
                        state is TextfieldValidationInitial)
                        ? ''
                        : "Please enter valid email address.",
                    minFontSize: 10,
                    maxFontSize: 14,
                    textAlign: TextAlign.left,
                    style: CustomLabels.body1TextStyle(
                        fontFamily: CustomLabels.primaryFont,
                        color: Colors.red),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      const SizedBox(
        height: 20,
      ),
      BlocBuilder<PasswordValidationBloc, PasswordValidationState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                inputType: CustomTextInputType.password,
                cursorColor: AppColors.baseColor,
                borderColor: (state is PasswordValidationSuccess ||
                    state is PasswordValidationInitial)
                    ? AppColors.baseColor
                    : Colors.red,
              ),
              Padding(
                padding: (state is PasswordValidationSuccess ||
                    state is PasswordValidationInitial)
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(
                    left: 8, top: 0, right: 0, bottom: 5),
                child: Visibility(
                  visible: state is PasswordValidationFailure,
                  child: AutoSizeText(
                    (state is PasswordValidationSuccess ||
                        state is PasswordValidationInitial)
                        ? ''
                        : "Please enter a valid password.",
                    minFontSize: 10,
                    maxFontSize: 14,
                    textAlign: TextAlign.left,
                    style: CustomLabels.body1TextStyle(
                        fontFamily: CustomLabels.primaryFont,
                        color: Colors.red),
                    maxLines: 1,
                  ),
                ),
              ),
              SizedBox(
                height: (state is PasswordValidationSuccess ||
                    state is PasswordValidationInitial)
                    ? 20
                    : 0,
              ),
            ],
          );
        },
      ),
      GestureDetector(
        onTap: () {
          // BlocProvider.of<MenuNameBloc>(context).add(MenuNameSelected(
          //     context: context, menuName: Screens.forgotPasswordScreen));
        },
        child: AutoSizeText(
          'Forgot Password?',
          textAlign: TextAlign.right,
          minFontSize: 13,
          maxFontSize: 18,
          style: CustomLabels.bodyTextStyle(
              fontSize: 13,
              fontFamily: CustomLabels.primaryFont,
              letterSpacing: 0,
              color: AppColors.baseColor),
          maxLines: 1,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomButton(
        text: 'Login',
        activeButtonColor: AppColors.baseColor,
        textStyle: CustomLabels.bodyTextStyle(
            fontSize: 14, color: AppColors.whiteColor),
        onPressed: () {
          BlocProvider.of<PasswordValidationBloc>(context)
              .add(PasswordValidationPressedEvent(passwordController.text));
          BlocProvider.of<EmailTextFieldValidationBloc>(context)
              .add(TextfieldValidationEvent(emailController.text));
          if (ValidationsAll.isValidEmail(emailController.text) &&
              ValidationsAll.isValidPassword(passwordController.text)) {
            BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
              email: emailController.text,
              password: passwordController.text,
            ));
          }
        },
      ),
    ],
  );
}
