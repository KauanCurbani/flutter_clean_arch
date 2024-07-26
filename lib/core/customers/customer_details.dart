class CustomerDetail {
  String id;
  String externalCode;
  String cnpj;
  String ie;
  String name;
  String tradeName;
  String street;
  String district;
  String city;
  String state;
  String zipCode;
  List<PhoneNumber> phones;
  String? contactName;
  bool blocked;
  String? email;
  String? activityBranchName;
  bool simplesNacional;
  String type;
  bool appliedSt;
  List<PaymentPlan> paymentPlans;
  String partnerId;
  double creditLimit;

  CustomerDetail({
    required this.id,
    required this.externalCode,
    required this.cnpj,
    required this.ie,
    required this.name,
    required this.tradeName,
    required this.street,
    required this.district,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.phones,
    this.contactName,
    required this.blocked,
    this.email,
    this.activityBranchName,
    required this.simplesNacional,
    required this.type,
    required this.appliedSt,
    required this.paymentPlans,
    required this.partnerId,
    required this.creditLimit,
  });

  factory CustomerDetail.fromJson(Map<String, dynamic> json) {
    return CustomerDetail(
      id: json['id'],
      externalCode: json['externalCode'],
      cnpj: json['cnpj'],
      ie: json['ie'],
      name: json['name'],
      tradeName: json['tradeName'],
      street: json['street'],
      district: json['district'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      phones: List<PhoneNumber>.from(
          json['phones'].map((x) => PhoneNumber.fromJson(x))),
      contactName: json['contactName'],
      blocked: json['blocked'],
      email: json['email'],
      activityBranchName: json['activityBranchName'],
      simplesNacional: json['simplesNacional'],
      type: json['type'],
      appliedSt: json['appliedSt'] ?? false,
      paymentPlans: List<PaymentPlan>.from(
          json['paymentPlans'].map((x) => PaymentPlan.fromJson(x))),
      partnerId: json['partnerId'],
      creditLimit: json['creditLimit'].toDouble(),
    );
  }
}

class PhoneNumber {
  String phoneNumberId;
  String phoneNumber;
  dynamic verified;
  String type;

  PhoneNumber({
    required this.phoneNumberId,
    required this.phoneNumber,
    required this.verified,
    required this.type,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> json) {
    return PhoneNumber(
      phoneNumberId: json['phoneNumberId'],
      phoneNumber: json['phoneNumber'],
      verified: json['verified'],
      type: json['type'],
    );
  }
}

class PaymentPlan {
  String id;
  String description;

  PaymentPlan({
    required this.id,
    required this.description,
  });

  factory PaymentPlan.fromJson(Map<String, dynamic> json) {
    return PaymentPlan(
      id: json['id'],
      description: json['description'],
    );
  }
}
