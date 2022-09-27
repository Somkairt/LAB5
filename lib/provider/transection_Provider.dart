import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/model/transection.dart';

class transectionProvider with ChangeNotifier {
  //ชื่อรายการ,จำนวนเงิน,วันที่
  List<transection> transections = [
    transection(title: "หนังสือ", amount: 500, date: DateTime.now()),
    transection(title: "กระเป๋า", amount: 900, date: DateTime.now()),
    transection(title: "เสื้อผ้า", amount: 450, date: DateTime.now()),
  ];

  List<transection> gettransection() {
    return transections;
  }

  void addtransection(transection statement) {
    transections.add(statement);
  }
}
