import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  CollectionReference colRef = Firestore.instance.collection("news");
  Stream get allNews {
    return colRef.snapshots();
  }

  Stream get flutter {
    return colRef.where("icon", isEqualTo: "flutter").snapshots();
  }

  Stream get react {
    return colRef.where("icon", isEqualTo: "react").snapshots();
  }

  Stream get angular {
    return colRef.where("icon", isEqualTo: "angular").snapshots();
  }

  Stream get vue {
    return colRef.where("icon", isEqualTo: "vue").snapshots();
  }

  Stream get firebase {
    return colRef.where("icon", isEqualTo: "firebase").snapshots();
  }

  Stream get nodejs {
    return colRef.where("icon", isEqualTo: "nodejs").snapshots();
  }

  Stream get javascript {
    return colRef.where("icon", isEqualTo: "javascript").snapshots();
  }

  Stream get aws {
    return colRef.where("icon", isEqualTo: "aws").snapshots();
  }
}
