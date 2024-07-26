import 'package:delivery_flutter/shared/format_cnpj_or_cpf.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("should format cnpj if is valid", () {
    // Arrange
    var cnpj = "06700795000127";

    // Act
    var result = formatCnpjOrCpf(cnpj);

    // Assert
    expect(result, "06.700.795/0001-27");
  });

  test("should format cpf if is valid", () {
    // Arrange
    var cpf = "58485359062";

    // Act
    var result = formatCnpjOrCpf(cpf);
    // Assert

    expect(result, "584.853.590-62");
  });

  test("should return non formatted string if is invalid", () {
    // Arrange
    var invalidCnpj = "0670079500012";
    var invalidCpf = "5848535906";

    // Act
    var resultCnpj = formatCnpjOrCpf(invalidCnpj);
    var resultCpf = formatCnpjOrCpf(invalidCpf);

    // Assert
    expect(resultCnpj, "0670079500012");
    expect(resultCpf, "5848535906");
  });
}
