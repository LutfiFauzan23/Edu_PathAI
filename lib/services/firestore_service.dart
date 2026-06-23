// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// /// Service generik untuk akses Firestore.
// ///
// /// Struktur koleksi yang dipakai (skeleton, siap dikembangkan):
// ///   users/{uid}                          - profil dasar user
// ///   users/{uid}/portofolio/{itemId}       - sertifikat, proyek, dst
// ///   users/{uid}/assessments/{testId}      - hasil tes minat & bakat
// ///   users/{uid}/todos/{todoId}            - to-do list & kalender akademik
// ///   users/{uid}/internshipLogs/{logId}    - logbook magang/PKL
// ///   scholarships/{scholarshipId}          - katalog beasiswa (shared, read-only)
// ///   schools/{schoolId}                    - database sekolah/kampus (shared)
// class FirestoreService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // ---------- USER PROFILE ----------

//   Future<void> createUser(User user) async {
//     await _firestore.collection('users').doc(user.uid).set({
//       'uid': user.uid,
//       'name': user.displayName,
//       'email': user.email,
//       'photo': user.photoURL,
//       'xp': 0,
//       'level': 1,
//       'createdAt': FieldValue.serverTimestamp(),
//     }, SetOptions(merge: true));
//   }

//   Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String uid) {
//     return _firestore.collection('users').doc(uid).get();
//   }

//   Stream<DocumentSnapshot<Map<String, dynamic>>> watchUser(String uid) {
//     return _firestore.collection('users').doc(uid).snapshots();
//   }

//   Future<void> updateUser(String uid, Map<String, dynamic> data) {
//     return _firestore.collection('users').doc(uid).update(data);
//   }

//   // ---------- PORTOFOLIO DIGITAL ----------

//   CollectionReference<Map<String, dynamic>> _portfolioRef(String uid) =>
//       _firestore.collection('users').doc(uid).collection('portofolio');

//   Future<void> addPortfolioItem(String uid, Map<String, dynamic> item) {
//     return _portfolioRef(uid).add({
//       ...item,
//       'createdAt': FieldValue.serverTimestamp(),
//     });
//   }

//   Stream<QuerySnapshot<Map<String, dynamic>>> watchPortfolio(String uid) {
//     return _portfolioRef(uid).orderBy('createdAt', descending: true).snapshots();
//   }

//   Future<void> deletePortfolioItem(String uid, String itemId) {
//     return _portfolioRef(uid).doc(itemId).delete();
//   }

//   // ---------- TO-DO / KALENDER AKADEMIK ----------

//   CollectionReference<Map<String, dynamic>> _todoRef(String uid) =>
//       _firestore.collection('users').doc(uid).collection('todos');

//   Future<void> addTodo(String uid, Map<String, dynamic> todo) {
//     return _todoRef(uid).add({
//       ...todo,
//       'createdAt': FieldValue.serverTimestamp(),
//     });
//   }

//   Stream<QuerySnapshot<Map<String, dynamic>>> watchTodos(String uid) {
//     return _todoRef(uid).orderBy('dueDate').snapshots();
//   }

//   Future<void> toggleTodo(String uid, String todoId, bool isDone) {
//     return _todoRef(uid).doc(todoId).update({'isDone': isDone});
//   }

//   // ---------- LOGBOOK MAGANG / PKL ----------

//   CollectionReference<Map<String, dynamic>> _internshipLogRef(String uid) =>
//       _firestore.collection('users').doc(uid).collection('internshipLogs');

//   Future<void> addInternshipLog(String uid, Map<String, dynamic> log) {
//     return _internshipLogRef(uid).add({
//       ...log,
//       'createdAt': FieldValue.serverTimestamp(),
//     });
//   }

//   Stream<QuerySnapshot<Map<String, dynamic>>> watchInternshipLogs(String uid) {
//     return _internshipLogRef(uid).orderBy('date', descending: true).snapshots();
//   }

//   // ---------- BEASISWA (katalog bersama, read-only dari sisi app) ----------

//   Stream<QuerySnapshot<Map<String, dynamic>>> watchScholarships() {
//     return _firestore.collection('scholarships').snapshots();
//   }
// }
