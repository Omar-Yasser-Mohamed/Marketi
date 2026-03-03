// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get onboardingOneTitle => 'Welcome to Marketi';

  @override
  String get onboardingOneDesc =>
      'Discover a world of endless possibilities and shop from the comfort of your fingertips. Browse through a wide range of products, from fashion and electronics to home essentials.';

  @override
  String get onboardingTwoTitle => 'Easy to Buy';

  @override
  String get onboardingTwoDesc =>
      'Find the perfect item that suits your style and needs with secure payment options and fast delivery. Shopping has never been easier.';

  @override
  String get onboardingThreeTitle => 'Wonderful User Experience';

  @override
  String get onboardingThreeDesc =>
      'Start exploring now and experience the convenience of online shopping at its best.';

  @override
  String get next => 'Next';

  @override
  String get getStarted => 'Get Started';

  @override
  String get password => 'Password';

  @override
  String get remember_me => 'Remember Me';

  @override
  String get forgot_password_ques => 'Forgot Password?';

  @override
  String get login => 'Log In';

  @override
  String get or_continue_with => 'Or Continue With';

  @override
  String get are_you_new => 'Are you new in Marketi?';

  @override
  String get register => 'Register';

  @override
  String get your_name => 'Your Name';

  @override
  String get full_name => 'Full Name';

  @override
  String get phone_number => 'Phone Number';

  @override
  String get email => 'Email';

  @override
  String get confirm_password => 'Confirm Password';

  @override
  String get signup => 'Sign Up';

  @override
  String get forgot_password => 'Forgot Password';

  @override
  String get forgot_password_desc =>
      'Please enter your email address to receive a verification code';

  @override
  String get send_code => 'Send Code';

  @override
  String get verification_code => 'Verification Code';

  @override
  String get verification_code_desc =>
      'Please enter the 6 digit code sent to: ';

  @override
  String get verify_code => 'Verify Code';

  @override
  String get resend_code => 'Resend Code';

  @override
  String get createNewPassword => 'Create New Password';

  @override
  String get newPasswordHint =>
      'New password must be different from last password';

  @override
  String get savePassword => 'Save Password';

  @override
  String get congratulations => 'Congratulations';

  @override
  String get passwordUpdatedMessage =>
      'You have updated your password. Please log in again with your new password.';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get nameMinLength => 'Name must be at least 3 characters';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get invalidEmail => 'Enter a valid email address';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 8 characters';

  @override
  String get passwordUppercase => 'an uppercase letter';

  @override
  String get passwordLowercase => 'a lowercase letter';

  @override
  String get passwordNumber => 'a number';

  @override
  String get passwordSpecial => 'a special character';

  @override
  String passwordMustContain(Object rules) {
    return 'Password must contain $rules';
  }

  @override
  String get confirmPasswordRequired => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get phoneRequired => 'Phone number is required';

  @override
  String get invalidEgyptianPhone =>
      'Enter a valid Egyptian phone number (11 digits)';

  @override
  String get pinRequired => 'PIN code is required';

  @override
  String get pinDigitsOnly => 'PIN must contain digits only';

  @override
  String get pinInvalidLength => 'PIN must be 6 digits';

  @override
  String get verificationCodeSentSuccessfully =>
      'Verification code sent successfully';

  @override
  String get errorNetwork =>
      'No internet connection. Please check your network.';

  @override
  String get errorTimeout => 'The request took too long. Please try again.';

  @override
  String get errorUnauthorized =>
      'You are not authorized to perform this action.';

  @override
  String get errorForbidden => 'Access denied.';

  @override
  String get errorSessionExpired =>
      'Your session has expired. Please login again.';

  @override
  String get errorBadRequest => 'Invalid request. Please check your input.';

  @override
  String get errorNotFound => 'The requested data was not found.';

  @override
  String get errorConflict => 'This data already exists.';

  @override
  String get errorServer => 'Server error. Please try again later.';

  @override
  String get errorCache => 'Failed to load cached data.';

  @override
  String get errorDatabase => 'Database error occurred.';

  @override
  String get errorValidation => 'Please check the entered data.';

  @override
  String get errorEmptyData => 'No data available.';

  @override
  String get errorCancelled => 'The request was cancelled.';

  @override
  String get errorUnknown => 'Something went wrong. Please try again.';

  @override
  String get otpResentSuccess => 'A new verification code has been sent.';

  @override
  String get home => 'Home';

  @override
  String get cart => 'Cart';

  @override
  String get favorites => 'Favorites';

  @override
  String get profile => 'Profile';

  @override
  String hiUser(Object name) {
    return 'Hi $name!';
  }

  @override
  String get searchHint => 'What are you looking for?';

  @override
  String get popular_product => 'Popular Products';

  @override
  String get view_all => 'View all';

  @override
  String get category => 'Category';

  @override
  String get bestForYou => 'Best for You';

  @override
  String get brands => 'Brands';

  @override
  String get allProducts => 'All Products';

  @override
  String get price => 'Price';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get add => 'Add';

  @override
  String get rating => 'Rating';

  @override
  String get description => 'Description';

  @override
  String get soldBy => 'Sold By';

  @override
  String averageRating(Object count) {
    return 'Average rating based on $count ratings from trusted sources';
  }

  @override
  String get categories => 'Categories';
}
