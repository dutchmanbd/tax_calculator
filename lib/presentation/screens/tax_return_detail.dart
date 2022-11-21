import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tax_calculator/data/tax_return.dart';

class TaxReturnDetail extends StatefulWidget {
  final TaxReturn taxReturn;
  const TaxReturnDetail({super.key, required this.taxReturn});

  @override
  State<TaxReturnDetail> createState() => _TaxReturnDetailState();
}

class _TaxReturnDetailState extends State<TaxReturnDetail> {
  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(title: const Text("Tax Detail")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Total Net Taxable:",
                  style: textStyle,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.taxReturn.totalNetTexable.toStringAsFixed(2),
                  style: textStyle,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Maximum allowable investment:",
                  style: textStyle,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.taxReturn.maximumAllowableInvestment
                      .toStringAsFixed(2),
                  style: textStyle,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Actual Investment:",
                  style: textStyle,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.taxReturn.totalActualInvestment.toStringAsFixed(2),
                  style: textStyle,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Maximum Tax Rebate:",
                  style: textStyle,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.taxReturn.maximumTaxRebate.toStringAsFixed(2),
                  style: textStyle,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Actual Tax Rebate:",
                  style: textStyle,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.taxReturn.actualTaxRebate.toStringAsFixed(2),
                  style: textStyle,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Total Tax Amount:",
                  style: textStyle,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.taxReturn.taxLeviableOnTotalIncome.toStringAsFixed(2),
                  style: textStyle,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Total Payable:       ",
                  style: textStyle,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.taxReturn.totalTaxPayable.toStringAsFixed(2),
                  style: textStyle,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Need to pay:          ",
                  style: textStyle,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.taxReturn.restTaxAmountForPayable.toStringAsFixed(2),
                  style: textStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
