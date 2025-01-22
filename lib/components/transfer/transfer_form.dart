import 'package:egroup_app/components/common/phoneinput.dart';
import 'package:egroup_app/components/common/text.dart';
import 'package:egroup_app/components/common/textinput.dart';
import 'package:flutter/material.dart';

class TrasnferForm extends StatefulWidget {
  final TextEditingController accountName;
  final TextEditingController accountNumber;
  final TextEditingController beneficiaryReference;
  final TextEditingController myReference;
  final TextEditingController amount;
  final Function setBank;
  final String bank;

  const TrasnferForm(
      {super.key,
      required this.accountName,
      required this.accountNumber,
      required this.beneficiaryReference,
      required this.myReference,
      required this.amount,
      required this.setBank,
      required this.bank});

  @override
  State<TrasnferForm> createState() => _TrasnferFormState();
}

class _TrasnferFormState extends State<TrasnferForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Row(
            children: [
              CText(text: "Bank"),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(0, 0, 1, .05),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          focusColor: Colors.black,
                          icon: const Icon(Icons.money),
                          hint: widget.bank == ""
                              ? const CText(text: 'Select Bank')
                              : CText(text: widget.bank),
                          items: <String>[
                            "FNB",
                            "Standard bank",
                            "ABSA",
                            "Nedbank"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            widget.setBank(newValue!);
                          },
                        ),
                      )),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            children: [
              CText(text: "Account Name"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CInput(
                text: "Account Name",
                icon: Icons.person,
                obscure: false,
                controller: widget.accountName,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            children: [
              CText(text: "Account Number"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CPhone(
                text: "Account Number",
                icon: Icons.numbers,
                obscure: false,
                controller: widget.accountNumber,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            children: [
              CText(text: "Benficiary Reference"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CInput(
                text: "Benficiary Reference ",
                icon: Icons.person,
                obscure: false,
                controller: widget.beneficiaryReference,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            children: [
              CText(text: "My Reference "),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CInput(
                text: "My Reference",
                icon: Icons.person,
                obscure: false,
                controller: widget.myReference,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            children: [
              CText(text: "Amount"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CPhone(
                text: "Amount",
                icon: Icons.money,
                obscure: false,
                controller: widget.amount,
              )
            ],
          )
        ],
      ),
    );
  }
}
