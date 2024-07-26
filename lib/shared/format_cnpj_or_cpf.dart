import 'package:brasil_fields/brasil_fields.dart';

String formatCnpjOrCpf(String cpfOrCnpj) {
  if (UtilBrasilFields.isCNPJValido(cpfOrCnpj)) {
    return UtilBrasilFields.obterCnpj(cpfOrCnpj);
  } else if (UtilBrasilFields.isCPFValido(cpfOrCnpj)) {
    return UtilBrasilFields.obterCpf(cpfOrCnpj);
  } else {
    return cpfOrCnpj;
  }
}
