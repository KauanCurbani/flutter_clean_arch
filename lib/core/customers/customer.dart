class Customer {
  String id;
  String name;
  String? tradeName;
  String status;
  String purchaseStatus;
  String cnpj;
  String externalCode;
  String? activityBranchName;
  DateTime? lastOrderDate;

  Customer({
    required this.id,
    required this.name,
    this.tradeName,
    required this.status,
    required this.purchaseStatus,
    required this.cnpj,
    required this.externalCode,
    this.activityBranchName,
    this.lastOrderDate,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      tradeName: json['tradeName'],
      status: json['status'],
      purchaseStatus: json['purchaseStatus'],
      cnpj: json['cnpj'],
      externalCode: json['externalCode'],
      activityBranchName: json['activityBranchName'],
      lastOrderDate: json['lastOrderDate'] != null
          ? DateTime.parse(json['lastOrderDate'])
          : null,
    );
  }
}
