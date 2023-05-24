import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/api/wallet/wallet.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/models/wallet/transaction_model.dart';
import 'package:fuleap/provider/transaction_provider.dart';
import 'package:fuleap/widget/general/extras.dart';
import 'package:fuleap/widget/general/transaction.dart';
import 'package:provider/provider.dart';

class TransactionsHolder extends StatefulWidget {
  TransactionsHolder({super.key, this.id});

  String? id;

  @override
  State<TransactionsHolder> createState() => _TransactionsHolderState();
}

class _TransactionsHolderState extends State<TransactionsHolder> {
  updateTransactions() async {
    if (getStorage(path: db_transaction(id: widget.id)) != null) {
      Provider.of<TransactionProvider>(context, listen: false)
          .updateTransactionProvider(getTransactions(attendant_id: widget.id)!);
    }
    await WalletApi(context).GetWallet(
      Endpoints.getTransactions,
      body: {
        'stationBranch': getUser()?.user?.meta?.stationBranch,
        ...(widget.id == null ? {} : {'pumpAttendant': widget.id})
      },
      storage: db_transaction(id: widget.id),
    );

    Provider.of<TransactionProvider>(context, listen: false)
        .updateTransactionProvider(getTransactions(attendant_id: widget.id)!);
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration.zero, () {
      updateTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    transactionModel? transactionsModel =
        context.watch<TransactionProvider>().transactions;

    return transactionsModel == null
        ? Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : transactionsModel.data?.length == 0
            ? Empty()
            : ListView.builder(
                itemCount: transactionsModel.data!.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (a, index) {
                  return history(
                    index: index,
                    data: transactionsModel.data![index],
                  );
                });
  }
}
