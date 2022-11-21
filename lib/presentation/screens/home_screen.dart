import 'package:flutter/material.dart';
import 'package:tax_calculator/data/annual_salary.dart';
import 'package:tax_calculator/data/investment.dart';
import 'package:tax_calculator/data/tax_payable.dart';
import 'package:tax_calculator/domain/tax_calculator.dart';
import 'package:tax_calculator/presentation/screens/tax_return_detail.dart';

import '../../data/tax_return.dart';
import '../widgets/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AnnualSalary _annualSalary = AnnualSalary(
    basicSalary: 0.0,
    houseRentAllowance: 0.0,
    medicalAllowance: 0.0,
    conveyanceAllowance: 0.0,
    festivalBonus: 0.0,
  );
  final Investment _investment = Investment(dps: 0.0, others: 0.0);
  final TaxPayable _payable = TaxPayable(fromSalary: 0.0, fromOthers: 0.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tax Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Salary Breakdown",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'Basic Salary',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _annualSalary.basicSalary = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'House Rent Allowance',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _annualSalary.houseRentAllowance = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'Medical Allowance',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _annualSalary.medicalAllowance = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'Conveyance Allowance',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _annualSalary.conveyanceAllowance = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'Other\'s Allowance',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _annualSalary.otherAllowance = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'Overtime Allowance',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _annualSalary.overtimeAllowance = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'Provident Fund',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _annualSalary.providentFund = double.parse(value);
                    _investment.providentFund = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'Festival Bonus',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _annualSalary.festivalBonus = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              const Text(
                "Investment Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'DPS',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _investment.dps = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'Others',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _investment.others = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              const Text(
                "Tax Payable",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'Deducted from salary',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _payable.fromSalary = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              MyTextFiled(
                hintText: 'Deducted from other',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _payable.fromOthers = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    TaxReturn taxReturn = TaxCalculator.calculateTax(
                      _annualSalary,
                      _investment,
                      _payable,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) =>
                                TaxReturnDetail(taxReturn: taxReturn)));
                  },
                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
