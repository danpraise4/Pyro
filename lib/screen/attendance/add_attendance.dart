// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fuleap/api/account/account.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/helpers/utils.dart';

import 'package:fuleap/widget/general/button.dart';

import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:validatorless/validatorless.dart';

import '../../helpers/constants.dart';
import '../../widget/general/app_bar.dart';
import '../../widget/general/inpute.dart';

// ignore: camel_case_types
class addAttendants extends StatefulWidget {
  const addAttendants({super.key});

  @override
  State<addAttendants> createState() => _addAttendantsState();
}

// ignore: camel_case_types
class _addAttendantsState extends State<addAttendants> {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var lastController = TextEditingController();

  var firstController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  String? pomp;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return wrapPage(
      inScroll: true,
      appBar: customAppBar(context).titleAppBar(
        title: "Create",
      ),
      children: Container(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                inputeField(
                  firstController,
                  inputeType: TextInputType.name,
                  hint: "Enter First Name",
                  label: "First Name",
                  required: true,
                  validator: Validatorless.multiple([
                    Validatorless.required("First Name is required"),
                  ]),
                ),
                inputeField(
                  lastController,
                  inputeType: TextInputType.name,
                  hint: "Enter Last Name",
                  label: "Last Name",
                  required: true,
                  validator: Validatorless.multiple([
                    Validatorless.required("Last Name is required"),
                  ]),
                ),
                inputeField(
                  phoneController,
                  inputeType: TextInputType.phone,
                  hint: "Enter Phone Number",
                  label: "Phone Number",
                  required: true,
                  validator: Validatorless.multiple([
                    Validatorless.required("Phone is required"),
                    Validatorless.min(11, "Invalide phone"),
                    Validatorless.max(11, "Invalide phone")
                  ]),
                ),
                inputeField(
                  emailController,
                  inputeType: TextInputType.emailAddress,
                  hint: "Enter Email Name",
                  label: "Email",
                  required: true,
                  validator: Validatorless.multiple([
                    Validatorless.required("Email is required"),
                    Validatorless.email("Invalide email")
                  ]),
                ),
                inputeField(
                  passwordController,
                  showVisibilityTogle: true,
                  inputeType: TextInputType.text,
                  hint: "Enter Password",
                  label: "Password",
                  required: true,
                  validator: Validatorless.multiple([
                    Validatorless.required("Password is required"),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 15),
                  child: const Row(
                    children: [
                      Text("Assign Pump"),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      border: inputeBorder,
                      color: lightBlue_,
                      borderRadius: inputeRadius),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      pomp ?? "Assign Pump",
                      style: const TextStyle(color: gray_),
                    ),
                    items: <String>[
                      '1',
                      '2',
                      '3',
                      '4',
                      '5',
                      '6',
                      '7',
                      '8',
                      '9',
                      '10',
                      '11',
                      '12'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (x) {
                      setState(() {
                        pomp = x;
                      });
                    },
                  ),
                ),
                customButton(
                  isActive: true,
                  isLoading: false,
                  onClick: () async {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }

                    if (pomp == null) {
                      showMessage(context,
                          title: "Error",
                          message:
                              "You have not assigned this attendant to a pump yet",
                          buttonText: "Close");
                      return;
                    }

                    String lname = lastController.text;
                    String fname = firstController.text;
                    String phone = phoneController.text;
                    String email = emailController.text;
                    String password = passwordController.text;

                    // context.loaderOverlay.show();

                    var x = {
                      "firstName": lname,
                      "lastName": fname,
                      "phoneNumber": phone,
                      "password": password,
                      "branchId": getUser()?.user?.meta?.stationBranch,
                      "email": email
                    };

                    await AccountApi(context).PostAccount(
                        Endpoints.getAttendance,
                        body: x,
                        message: "Attedant Create Successfully");
                    //context.loaderOverlay.hide();
                  },
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  text: "Add Attendant",
                ),
                const SizedBox(
                  height: 150,
                )
              ],
            )),
      ),
    );
  }
}
