import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @onboardingOneTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Marketi'**
  String get onboardingOneTitle;

  /// No description provided for @onboardingOneDesc.
  ///
  /// In en, this message translates to:
  /// **'Discover a world of endless possibilities and shop from the comfort of your fingertips. Browse through a wide range of products, from fashion and electronics to home essentials.'**
  String get onboardingOneDesc;

  /// No description provided for @onboardingTwoTitle.
  ///
  /// In en, this message translates to:
  /// **'Easy to Buy'**
  String get onboardingTwoTitle;

  /// No description provided for @onboardingTwoDesc.
  ///
  /// In en, this message translates to:
  /// **'Find the perfect item that suits your style and needs with secure payment options and fast delivery. Shopping has never been easier.'**
  String get onboardingTwoDesc;

  /// No description provided for @onboardingThreeTitle.
  ///
  /// In en, this message translates to:
  /// **'Wonderful User Experience'**
  String get onboardingThreeTitle;

  /// No description provided for @onboardingThreeDesc.
  ///
  /// In en, this message translates to:
  /// **'Start exploring now and experience the convenience of online shopping at its best.'**
  String get onboardingThreeDesc;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get remember_me;

  /// No description provided for @forgot_password_ques.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password_ques;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login;

  /// No description provided for @or_continue_with.
  ///
  /// In en, this message translates to:
  /// **'Or Continue With'**
  String get or_continue_with;

  /// No description provided for @are_you_new.
  ///
  /// In en, this message translates to:
  /// **'Are you new in Marketi?'**
  String get are_you_new;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @your_name.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get your_name;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgot_password;

  /// No description provided for @forgot_password_desc.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address to receive a verification code'**
  String get forgot_password_desc;

  /// No description provided for @send_code.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get send_code;

  /// No description provided for @verification_code.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verification_code;

  /// No description provided for @verification_code_desc.
  ///
  /// In en, this message translates to:
  /// **'Please enter the 6 digit code sent to: '**
  String get verification_code_desc;

  /// No description provided for @verify_code.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verify_code;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resend_code;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create New Password'**
  String get createNewPassword;

  /// No description provided for @newPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'New password must be different from last password'**
  String get newPasswordHint;

  /// No description provided for @savePassword.
  ///
  /// In en, this message translates to:
  /// **'Save Password'**
  String get savePassword;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations'**
  String get congratulations;

  /// No description provided for @passwordUpdatedMessage.
  ///
  /// In en, this message translates to:
  /// **'You have updated your password. Please log in again with your new password.'**
  String get passwordUpdatedMessage;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @nameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 3 characters'**
  String get nameMinLength;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get invalidEmail;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordUppercase.
  ///
  /// In en, this message translates to:
  /// **'an uppercase letter'**
  String get passwordUppercase;

  /// No description provided for @passwordLowercase.
  ///
  /// In en, this message translates to:
  /// **'a lowercase letter'**
  String get passwordLowercase;

  /// No description provided for @passwordNumber.
  ///
  /// In en, this message translates to:
  /// **'a number'**
  String get passwordNumber;

  /// No description provided for @passwordSpecial.
  ///
  /// In en, this message translates to:
  /// **'a special character'**
  String get passwordSpecial;

  /// No description provided for @passwordMustContain.
  ///
  /// In en, this message translates to:
  /// **'Password must contain {rules}'**
  String passwordMustContain(Object rules);

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @phoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phoneRequired;

  /// No description provided for @invalidEgyptianPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Egyptian phone number (11 digits)'**
  String get invalidEgyptianPhone;

  /// No description provided for @pinRequired.
  ///
  /// In en, this message translates to:
  /// **'PIN code is required'**
  String get pinRequired;

  /// No description provided for @pinDigitsOnly.
  ///
  /// In en, this message translates to:
  /// **'PIN must contain digits only'**
  String get pinDigitsOnly;

  /// No description provided for @pinInvalidLength.
  ///
  /// In en, this message translates to:
  /// **'PIN must be 6 digits'**
  String get pinInvalidLength;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please check your network.'**
  String get errorNetwork;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'The request took too long. Please try again.'**
  String get errorTimeout;

  /// No description provided for @errorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'You are not authorized to perform this action.'**
  String get errorUnauthorized;

  /// No description provided for @errorForbidden.
  ///
  /// In en, this message translates to:
  /// **'Access denied.'**
  String get errorForbidden;

  /// No description provided for @errorSessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please login again.'**
  String get errorSessionExpired;

  /// No description provided for @errorBadRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid request. Please check your input.'**
  String get errorBadRequest;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested data was not found.'**
  String get errorNotFound;

  /// No description provided for @errorConflict.
  ///
  /// In en, this message translates to:
  /// **'This data already exists.'**
  String get errorConflict;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get errorServer;

  /// No description provided for @errorCache.
  ///
  /// In en, this message translates to:
  /// **'Failed to load cached data.'**
  String get errorCache;

  /// No description provided for @errorDatabase.
  ///
  /// In en, this message translates to:
  /// **'Database error occurred.'**
  String get errorDatabase;

  /// No description provided for @errorValidation.
  ///
  /// In en, this message translates to:
  /// **'Please check the entered data.'**
  String get errorValidation;

  /// No description provided for @errorEmptyData.
  ///
  /// In en, this message translates to:
  /// **'No data available.'**
  String get errorEmptyData;

  /// No description provided for @errorCancelled.
  ///
  /// In en, this message translates to:
  /// **'The request was cancelled.'**
  String get errorCancelled;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorUnknown;

  /// No description provided for @otpResentSuccess.
  ///
  /// In en, this message translates to:
  /// **'A new verification code has been sent.'**
  String get otpResentSuccess;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @hiUser.
  ///
  /// In en, this message translates to:
  /// **'Hi {name}!'**
  String hiUser(Object name);

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'What are you looking for?'**
  String get searchHint;

  /// No description provided for @popular_product.
  ///
  /// In en, this message translates to:
  /// **'Popular Products'**
  String get popular_product;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get view_all;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @bestForYou.
  ///
  /// In en, this message translates to:
  /// **'Best for You'**
  String get bestForYou;

  /// No description provided for @brands.
  ///
  /// In en, this message translates to:
  /// **'Brands'**
  String get brands;

  /// No description provided for @allProducts.
  ///
  /// In en, this message translates to:
  /// **'All Products'**
  String get allProducts;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
