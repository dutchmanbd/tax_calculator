class TaxReturn {
  double totalNetTexable;
  double totalActualInvestment;
  double taxLeviableOnTotalIncome;
  double maximumAllowableInvestment;
  double maximumTaxRebate;
  double actualTaxRebate;
  double totalTaxPayable;
  double restTaxAmountForPayable;
  TaxReturn({
    required this.totalNetTexable,
    required this.totalActualInvestment,
    required this.taxLeviableOnTotalIncome,
    required this.maximumAllowableInvestment,
    required this.maximumTaxRebate,
    required this.actualTaxRebate,
    required this.totalTaxPayable,
    required this.restTaxAmountForPayable,
  });
}
