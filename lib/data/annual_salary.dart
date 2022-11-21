class AnnualSalary {
  double basicSalary, houseRentAllowance, medicalAllowance;
  double conveyanceAllowance, otherAllowance, overtimeAllowance;
  double providentFund = 0.0, festivalBonus;

  AnnualSalary({
    required this.basicSalary,
    required this.houseRentAllowance,
    required this.medicalAllowance,
    required this.conveyanceAllowance,
    required this.festivalBonus,
    this.otherAllowance = 0.0,
    this.overtimeAllowance = 0.0,
    this.providentFund = 0.0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnnualSalary &&
        other.medicalAllowance == medicalAllowance &&
        other.overtimeAllowance == overtimeAllowance &&
        other.festivalBonus == festivalBonus;
  }

  @override
  int get hashCode =>
      medicalAllowance.hashCode ^
      overtimeAllowance.hashCode ^
      festivalBonus.hashCode;

  @override
  String toString() => """
AnnualSalary(
  basicSalary: $basicSalary,
  houseRentAllowance: $houseRentAllowance,
  medicalAllowance: $medicalAllowance,
  conveyanceAllowance: $conveyanceAllowance, 
  otherAllowance: $otherAllowance,
  overtimeAllowance: $overtimeAllowance,
  providentFund: $providentFund,
  festivalBonus: $festivalBonus
)
""";
}
// this.basicSalary,
//     this.houseRentAllowance,
//     this.medicalAllowance,
//     this.,
//     this.otherAllowance,
//     this.overtimeAllowance,
//     this.providentFund,
//     this.,