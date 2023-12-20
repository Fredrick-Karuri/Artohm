/// This class defines the variables used in the [modal_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ModalModel {
  String title;
  String date;
  String location;
  String description;
  String buttonText;

  ModalModel({
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.buttonText
  });
}
