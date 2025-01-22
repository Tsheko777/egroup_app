import 'package:egroup_app/components/common/text.dart';
import 'package:flutter/material.dart';

class TransferCard extends StatefulWidget {
  final transactions;
  const TransferCard({super.key, this.transactions});

  @override
  State<TransferCard> createState() => _TransferCardState();
}

class _TransferCardState extends State<TransferCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, .05),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CText(
                      fontWeight: FontWeight.bold,
                      text: widget.transactions['beneficiaryReference'],
                    ),
                  ),
                  CText(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    text: "-R ${widget.transactions['amount'].toString()}.00",
                  ),
                ],
              ),
              const Row(
                children: [
                  CText(text: 'Electronic Transfer'),
                ],
              ),
              Row(
                children: [
                  CText(
                      text: widget.transactions['created_at_formatted']
                          .toString()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
