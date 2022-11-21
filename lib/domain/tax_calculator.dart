import 'package:tax_calculator/data/annual_salary.dart';
import 'package:tax_calculator/data/investment.dart';
import 'package:tax_calculator/data/tax_payable.dart';
import 'package:tax_calculator/data/tax_return.dart';

class TaxCalculator {
  static double _totalNetTexable = 0.0;
  static double _totalActualInvestment = 0.0;
  static double _taxLeviableOnTotalIncome = 0.0;
  static double _maximumAllowableInvestment = 0.0;
  static double _maximumTaxRebate = 0.0;
  static double _actualTaxRebate = 0.0;

  static const double _oneLakh = 100000.0;
  static const double _threeLakh = 300000.0;
  static const double _fourLakh = 400000.0;
  static const double _fiveLakh = 500000.0;
  static const double _thirtyThousand = 30000.0;

  static TaxReturn calculateTax(
    AnnualSalary salary,
    Investment investment,
    TaxPayable taxPayable,
  ) {
    _calculateNetTaxableAmount(salary);
    _calculateTaxLeviableOnTotalIncome();
    _calculateActualInvestment(investment);
    _calculateMaximumInvestment();
    var restTaxAmount = _totalActualInvestment < _maximumAllowableInvestment
        ? _maximumAllowableInvestment - _totalActualInvestment
        : 0.0;
    // _taxLeviableOnTotalIncome += restTaxAmount;
    _actualTaxRebate = _totalActualInvestment < _maximumAllowableInvestment
        ? _totalActualInvestment * 0.15
        : _maximumTaxRebate;
    var totalTaxPayable =
        _actualTaxRebate + taxPayable.fromSalary + taxPayable.fromOthers;
    var restTaxAmountForPayable = _taxLeviableOnTotalIncome - totalTaxPayable;

    var taxReturn = TaxReturn(
      totalNetTexable: _totalNetTexable,
      totalActualInvestment: _totalActualInvestment,
      taxLeviableOnTotalIncome: _taxLeviableOnTotalIncome,
      maximumAllowableInvestment: _maximumAllowableInvestment,
      maximumTaxRebate: _maximumTaxRebate,
      actualTaxRebate: _actualTaxRebate,
      totalTaxPayable: totalTaxPayable,
      restTaxAmountForPayable: restTaxAmountForPayable,
    );
    return taxReturn;
  }

  static void _calculateMaximumInvestment() {
    _maximumAllowableInvestment = _totalNetTexable * 0.25;
    _maximumTaxRebate = _maximumAllowableInvestment * 0.15;
  }

  static void _calculateActualInvestment(Investment investment) {
    _totalActualInvestment =
        investment.providentFund + investment.dps + investment.others;
  }

  static void _calculateNetTaxableAmount(AnnualSalary salary) {
    var houseRent = salary.houseRentAllowance > _threeLakh
        ? salary.houseRentAllowance - _threeLakh
        : 0.0;

    var medicalPercent = salary.basicSalary * 0.1;
    var medical = salary.medicalAllowance > medicalPercent
        ? salary.medicalAllowance - medicalPercent
        : 0.0;
    var conveyance = salary.conveyanceAllowance > _thirtyThousand
        ? salary.conveyanceAllowance - _thirtyThousand
        : 0.0;

    _totalNetTexable = salary.basicSalary +
        houseRent +
        medical +
        conveyance +
        salary.otherAllowance +
        salary.overtimeAllowance +
        salary.providentFund +
        salary.festivalBonus;
  }

  static void _calculateTaxLeviableOnTotalIncome() {
    var totalIncome = _totalNetTexable;
    _taxLeviableOnTotalIncome = 0.0;

    if (totalIncome >= _threeLakh) totalIncome -= _threeLakh;

    if (totalIncome > 0.0) {
      if (totalIncome > _oneLakh) {
        _taxLeviableOnTotalIncome += _oneLakh * 0.05;
        totalIncome -= _oneLakh;
      } else {
        _taxLeviableOnTotalIncome += totalIncome * 0.05;
        totalIncome = 0.0;
      }
    }
    if (totalIncome > 0.0) {
      if (totalIncome > _threeLakh) {
        _taxLeviableOnTotalIncome += _threeLakh * 0.10;
        totalIncome -= _threeLakh;
      } else {
        _taxLeviableOnTotalIncome += totalIncome * 0.10;
        totalIncome = 0.0;
      }
    }
    if (totalIncome > 0.0) {
      if (totalIncome > _fourLakh) {
        _taxLeviableOnTotalIncome += _fourLakh * 0.15;
        totalIncome -= _fourLakh;
      } else {
        _taxLeviableOnTotalIncome += totalIncome * 0.15;
        totalIncome = 0.0;
      }
    }

    if (totalIncome > 0.0) {
      if (totalIncome > _fiveLakh) {
        _taxLeviableOnTotalIncome += _fiveLakh * 0.20;
        totalIncome -= _fiveLakh;
      } else {
        _taxLeviableOnTotalIncome += totalIncome * 0.20;
        totalIncome = 0.0;
      }
    }
    if (totalIncome > 0.0) {
      _taxLeviableOnTotalIncome += totalIncome * 0.25;
      totalIncome -= totalIncome;
    }
  }
}
