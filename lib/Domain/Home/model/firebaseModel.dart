// ignore_for_file: file_names

class FireBaseModel {
  final String id;
  final String title;
  final String rupees;
  final String category;

  FireBaseModel(
      {required this.id,
      required this.title,
      required this.rupees,
      required this.category});
  factory FireBaseModel.fromMap(Map<String, dynamic> data, String documentId) {
    return FireBaseModel(
      id: documentId,
      title: data['title'] ?? '',
      rupees: data['rupees'] ?? '',
      category: data['category'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {'title': title, 'rupees': rupees, 'category': category};
  }
}
