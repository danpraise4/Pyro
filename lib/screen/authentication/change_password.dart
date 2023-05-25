// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fuleap/api/account/account.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/api/authentication/authentication.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/helpers/utils.dart';
import 'package:fuleap/models/user/user_model.dart';
import 'package:fuleap/screen/wraper.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/inpute.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:validatorless/validatorless.dart';

import '../../helpers/constants.dart';
import '../../widget/page/page_wrap.dart';

class changePassword extends StatefulWidget {
  const changePassword({super.key});

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var cnewPassword = TextEditingController();
  var pinController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool sendCode = false;

  SendCode() async {
    var x = await AccountApi(context).PostAccount(Endpoints.forgotPassword,
        body: {
          "email": getUser()?.user!.email,
          "modeOfReset": "email",
        },
        message:
            "Token Sent!! to ${getUser()?.user!.email}\nCheck your email to get it");
    setState(() {
      sendCode = true;
    });
  }

  @override
  void initState() {
    super.initState();
    SendCode();
  }

  @override
  Widget build(BuildContext context) {
    return wrapPage(
      appBar: customAppBar(context).titleAppBar(title: "Change Password"),
      children: sendCode
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      children: [
                        inputeField(
                          oldPassword,
                          hint: "Enter Password",
                          showVisibilityTogle: true,
                          label: "Old Password",
                          required: true,
                          validator: Validatorless.multiple([
                            Validatorless.required("Password is required"),
                            Validatorless.min(6, "Must be 6 digits or more")
                          ]),
                        ),
                        inputeField(
                          newPassword,
                          hint: passwordHint,
                          showVisibilityTogle: true,
                          label: "New Password",
                          required: true,
                          validator: Validatorless.multiple([
                            Validatorless.required("Password is required"),
                            Validatorless.min(6, "Must be 6 digits or more")
                          ]),
                        ),
                        inputeField(
                          cnewPassword,
                          hint: passwordHint,
                          showVisibilityTogle: true,
                          label: "Confirm Password",
                          required: true,
                          validator: Validatorless.multiple([
                            Validatorless.required("Password is required"),
                            Validatorless.min(6, "Must be 6 digits or more")
                          ]),
                        ),
                      ],
                    )),
                customButton(
                    onClick: () async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      String pass = oldPassword.text;
                      String npass = newPassword.text;
                      String cpass = cnewPassword.text;

                      if (npass != cpass) {
                        showMessage(context,
                            title: "Passwords don't match",
                            message: "the Passwords entered do not match",
                            buttonText: "Close");
                        return;
                      }

                      pinController.text = '';
                      String? pin = await showBarModalBottomSheet(
                        expand: false,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (_, set) {
                            return Container(
                              height: 250,
                              color: white_,
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: const Text(
                                        "Enter PIN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: pinPut(
                                        size: 6,
                                        controller: pinController,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 30, horizontal: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (!formKey.currentState!
                                                  .validate()) {
                                                return;
                                              }

                                              if (pinController.text.isEmpty ||
                                                  pinController.text.length !=
                                                      6) {
                                                showMessage(context,
                                                    title: "Error",
                                                    message: "PIN Error field",
                                                    buttonText: "Close");
                                                return;
                                              }

                                              Navigator.pop(context,
                                                  (pinController.text));
                                            },
                                            child: const Text(
                                              "Confirm",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      );

                      if (pin == null) {
                        return;
                      }

                      context.loaderOverlay.show();
                      await AccountApi(context)
                          .PostAccount(Endpoints.resetPassword, body: {
                        "token": pin,
                        "password": npass,
                        "confirmPassword": cpass
                      });
                      context.loaderOverlay.hide();
                    },
                    isActive: true,
                    isLoading: false,
                    text: "Change Password")
              ],
            )
          : Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }
}
