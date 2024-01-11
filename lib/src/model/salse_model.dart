import 'dart:convert';

SaleModel saleModelFromJson(String str) => SaleModel.fromJson(json.decode(str));

class SaleModel {
  int? statusCode;
  List<Datum>? data;
  int? totalCount;

  SaleModel({
    this.statusCode,
    this.data,
    this.totalCount,
  });

  factory SaleModel.fromJson(Map<String, dynamic> json) => SaleModel(
        statusCode: json["StatusCode"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        totalCount: json["total_count"],
      );
}

class Datum {
  int? index;
  String? id;
  String? voucherNo;
  DateTime? date;
  String? ledgerName;
  double? totalGrossAmtRounded;
  double? totalTaxRounded;
  double? grandTotalRounded;
  String? customerName;
  double? totalTax;
  String? status;
  double? grandTotal;
  bool? isBillwised;
  String? billwiseStatus;

  Datum({
    this.index,
    this.id,
    this.voucherNo,
    this.date,
    this.ledgerName,
    this.totalGrossAmtRounded,
    this.totalTaxRounded,
    this.grandTotalRounded,
    this.customerName,
    this.totalTax,
    this.status,
    this.grandTotal,
    this.isBillwised,
    this.billwiseStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        index: json["index"],
        id: json["id"],
        voucherNo: json["VoucherNo"],
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
        ledgerName: json["LedgerName"],
        totalGrossAmtRounded: json["TotalGrossAmt_rounded"]?.toDouble(),
        totalTaxRounded: json["TotalTax_rounded"],
        grandTotalRounded: json["GrandTotal_Rounded"]?.toDouble(),
        customerName: json["CustomerName"],
        totalTax: json["TotalTax"],
        status: json["Status"],
        grandTotal: json["GrandTotal"]?.toDouble(),
        isBillwised: json["is_billwised"],
        billwiseStatus:json["billwise_status"],
      );
}





