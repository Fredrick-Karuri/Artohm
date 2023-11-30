/// This class defines the variables used in the [onboarding_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// class OnboardingModel {}

class OnboardingPage {
  final String imagePath;
  final String logoPath;
  final String message;
  final String buttonText;
  final String routeName;

  OnboardingPage({
    required this.imagePath,
    required this.logoPath,
    required this.message,
    required this.buttonText,
    required this.routeName,
  });
}
