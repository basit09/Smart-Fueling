import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

//constructor
  DatabaseService({this.uid});

  //collection Reference
  final CollectionReference BankdetailsCollection =
      Firestore.instance.collection('bankdetials');

  Future updateAccountData(String name, int accountNo, int cardNO) async {
    BankdetailsCollection.add({
      'Full Name' : name,
      'Account Number' : accountNo,
      'Card Number' : cardNO,
    });
    return await BankdetailsCollection.document(uid).setData({
      'Full Name': name,
      'Account Number': accountNo,
      'Card Number': cardNO,
    });
  }

  // get account details stream
  Stream<QuerySnapshot> get accountdetails {
    return BankdetailsCollection.snapshots();
  }
}
