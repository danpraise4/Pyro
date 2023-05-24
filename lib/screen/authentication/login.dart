// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/api/authentication/authentication.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/models/user/user_model.dart';
import 'package:fuleap/screen/wraper.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/inpute.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:validatorless/validatorless.dart';

import '../../helpers/constants.dart';
import '../../widget/page/page_wrap.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return wrapPage(
      appBar: null,
      children: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          fuleapLogo(showMore: true),
          Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                children: [
                  inputeField(
                    emailController,
                    hint: emailHint,
                    label: username,
                    required: true,
                    validator: Validatorless.multiple([
                      Validatorless.required("Email is required"),
                      Validatorless.email("invalide email")
                    ]),
                  ),
                  inputeField(
                    passwordController,
                    hint: passwordHint,
                    showVisibilityTogle: true,
                    label: password,
                    required: true,
                    validator: Validatorless.multiple([
                      Validatorless.required("Password is required"),
                      Validatorless.min(6, "Must be 6 digits or more")
                    ]),
                  ),
                ],
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(rememberMe), Text(forgotPassword)]),
          ),
          customButton(
              onClick: () async {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                context.loaderOverlay.show();
                CreateUserModel Model = CreateUserModel(
                    email: emailController.text,
                    password: passwordController.text,
                    loginOption: 'email',
                    pushNotificationId: '12345678901234567890');

                var x = await Authentication(context)
                    .Login(Endpoints.login, body: Model.toJson());

                context.loaderOverlay.hide();
                if (x != null) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const Wraper()),
                      (route) => false);
                }
              },
              isActive: true,
              isLoading: false,
              text: signIn)
        ],
      ),
    );
  }
}
