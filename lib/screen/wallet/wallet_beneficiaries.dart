import 'package:flutter/material.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

class walletBeneficiary extends StatefulWidget {
  const walletBeneficiary({super.key});

  @override
  State<walletBeneficiary> createState() => _walletBeneficiaryState();
}

class _walletBeneficiaryState extends State<walletBeneficiary> {
  @override
  Widget build(BuildContext context) {
    return wrapPage(
      appBar: customAppBar(context).titleAppBar(title: "Beneficiary"),
      children: const Column(
        children: [],
      ),
    );
  }
}
