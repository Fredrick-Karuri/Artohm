///SelectionPopupModelNew is common model
///used for setting data into dropdowns
// class SelectionPopupModel {
//   int? id;
//   String title;
//   dynamic value;
//   bool isSelected;

//   SelectionPopupModel({
//     this.id,
//     required this.title,
//     this.value,
//     this.isSelected = false,
//   });
// }

class SelectionPopupModel {
  static int _counter = 0;
  final int id;
  final String title;
  bool isSelected;
  dynamic value;

  SelectionPopupModel({
    required this.title,
    this.isSelected = false,
    this.value,
  })  : id = _counter++,
        super();
}
