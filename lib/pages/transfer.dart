import 'package:egroup_app/components/common/button.dart';
import 'package:egroup_app/components/common/request_loader.dart';
import 'package:egroup_app/components/common/text.dart';
import 'package:egroup_app/components/transfer/transfer_form.dart';
import 'package:egroup_app/logic/transfer_logic.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String bank = "";
  final accountName = TextEditingController();
  final accountNumber = TextEditingController();
  final beneficiaryReference = TextEditingController();
  final myReference = TextEditingController();
  final amount = TextEditingController();
  bool loading = false;
  String error = "";

  setLoading(value) {
    setState(() {
      loading = value;
    });
  }

  setError(value) {
    setState(() {
      error = value;
    });
  }

  setBank(value) {
    setState(() {
      bank = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        loading
            ? const RequestLoader()
            : Scaffold(
                resizeToAvoidBottomInset: true,
                extendBodyBehindAppBar: true,
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          const Icon(color: Colors.white, Icons.chevron_left)),
                  title: const CText(
                    text: "Transfer",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.orange,
                  scrolledUnderElevation: 0,
                  /* systemOverlayStyle: SystemUiOverlayStyle.dark, */
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const Row(
                        children: [
                          CText(
                            fontWeight: FontWeight.bold,
                            text: "Pay Beneficiary",
                            color: Colors.black,
                            fontSize: 15,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TrasnferForm(
                        accountName: accountName,
                        accountNumber: accountNumber,
                        beneficiaryReference: beneficiaryReference,
                        myReference: myReference,
                        amount: amount,
                        setBank: setBank,
                        bank: bank,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      error != ""
                          ? Row(
                              children: [
                                Expanded(
                                    child:
                                        CText(color: Colors.red, text: error))
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: CButton(
                                text: "Transfer",
                                onPressed: () async {
                                  String result =
                                      await TransferLogic().transfer(
                                    context,
                                    bank,
                                    accountName,
                                    accountNumber,
                                    beneficiaryReference,
                                    myReference,
                                    amount,
                                    setLoading,
                                  );
                                  setError(result);
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
      ],
    );
  }
}
