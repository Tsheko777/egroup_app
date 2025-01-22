// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:egroup_app/api/transactions.dart';
import 'package:egroup_app/api/user.dart';
import 'package:egroup_app/components/common/button.dart';
import 'package:egroup_app/components/common/request_loader.dart';
import 'package:egroup_app/components/common/text.dart';
import 'package:egroup_app/components/dashboard/transfer_card.dart';
import 'package:egroup_app/state/gerneral_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool loading = false;
  var user;

  setLoading(value) {
    if (mounted) {
      setState(() {
        loading = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setLoading(true);
    getUser();
    getTransactions();
  }

  getUser() async {
    var result = await UserRequest().user(context, setLoading);
    setState(() {
      user = result;
    });
  }

  getTransactions() async {
    var result = await TransactionRequest().transactions(context);
    context.read<GerneralState>().setTransations(result);
  }

  @override
  Widget build(BuildContext context) {
    var transactions = context.watch<GerneralState>().transactins;
    return Stack(
      children: [
        loading
            ? const RequestLoader()
            : Scaffold(
                resizeToAvoidBottomInset: true,
                extendBodyBehindAppBar: true,
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: CText(
                    text: user != null && user.length > 0
                        ? "Welcome, ${user['firstname']}"
                        : "Loading ...",
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
                            text: "Transactions",
                            color: Colors.black,
                          )
                        ],
                      ),
                      transactions != null && transactions.length > 0
                          ? Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (int i = 0;
                                        i < transactions.length;
                                        i++) ...[
                                      TransferCard(
                                        transactions: transactions[i],
                                      )
                                    ],
                                  ],
                                ),
                              ),
                            )
                          : const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: CText(
                                    text: "No transactions",
                                  ),
                                ),
                              ],
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: CButton(
                                text: "Transfer",
                                onPressed: () {
                                  Navigator.pushNamed(context, "/transfer");
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
