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
    return 'Hi, $name!';
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

  @override
  String ahlan(Object name) {
    return 'Ahlan, $name!';
  }

  @override
  String get orders => 'Orders';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get payment => 'Payment';

  @override
  String get paymentFailed => 'Payment failed. Please try again.';

  @override
  String get completePayment => 'Complete Payment';

  @override
  String get address => 'Address';

  @override
  String get language => 'Language';

  @override
  String get signOut => 'Sign Out';

  @override
  String get theme => 'Theme';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get settings => 'Settings';

  @override
  String get logout => 'Log out';

  @override
  String get logoutConfirmation => 'Are you sure you want to log out?';

  @override
  String get cancel => 'Cancel';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get yourCartIsEmpty => 'Your Cart is Empty';

  @override
  String get cartEmptyDescription =>
      'Check our big offers, fresh products and fill your cart with items';

  @override
  String get startShopping => 'Start Shopping';

  @override
  String get egp => 'EGP';

  @override
  String get productsOnCart => 'Products on Cart';

  @override
  String get suptotal => 'Subtotal';

  @override
  String get items => 'items';

  @override
  String get checkout => 'Checkout';

  @override
  String get favoritesEmptyTitle => 'No favorites yet';

  @override
  String get favoritesEmptyDescription =>
      'Save items you like by tapping the heart icon so you can find them quickly later.';

  @override
  String get itemsInYourWishList => 'items in your wishlist';

  @override
  String get selectLocation => 'Select Location';

  @override
  String get selectLocationDescription =>
      'Choose your delivery location to see available products and pricing.';

  @override
  String get currentLocation => 'Current Location';

  @override
  String get selectedLocation => 'Selected Location';

  @override
  String get confirmLocation => 'Confirm Location';

  @override
  String get useCurrentLocation => 'Use Current Location';

  @override
  String get pickLocationOnMap => 'Pick Location on Map';

  @override
  String get noLocationSelected => 'No location selected';

  @override
  String get search => 'Search';

  @override
  String get change => 'Change';

  @override
  String get mobile => 'Mobile';

  @override
  String get deliveryTime => 'Delivery Time';

  @override
  String get withinTwoDays => 'Within 2 days';

  @override
  String get cashOnDelivery => 'Cash on Delivery';

  @override
  String get details => 'Details';

  @override
  String get orderSummary => 'Order Summary';

  @override
  String subtotalWithItems(Object itemsCount) {
    return 'Subtotal ($itemsCount items)';
  }

  @override
  String get total => 'Total';

  @override
  String get deliveryFees => 'Delivery Fees';

  @override
  String get placeOrder => 'Place Order';

  @override
  String get pleaseCompleteAllFields =>
      'Please select a delivery location and enter a mobile number to place your order';

  @override
  String get notes => 'Notes';

  @override
  String get notesHint => 'Add notes...';

  @override
  String get unknownLocation => 'Unknown Location';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get loading => 'Loading...';

  @override
  String get gettingLocation => 'Getting your location...';

  @override
  String get selectPaymentMethod => 'Select Payment Method';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get cashOnDeliveryDescription => 'Pay cash on delivery.';

  @override
  String get onlinePayment => 'Online Payment';

  @override
  String get onlinePaymentDescription => 'via credit card Stripe';

  @override
  String get orderPlacedSuccessfully => 'Order Placed Successfully';

  @override
  String get orderSuccessDescription =>
      'Your order has been placed successfully. You can track your order from the orders section.';

  @override
  String get continueShopping => 'Continue Shopping';

  @override
  String get myOrders => 'My Orders';

  @override
  String get viewDetails => 'View Details';

  @override
  String get delivered => 'Delivered';

  @override
  String get pending => 'Pending';

  @override
  String get paid => 'Paid';

  @override
  String get noOrdersTitle => 'No orders yet';

  @override
  String get noOrdersDescription =>
      'You haven\'t placed any orders yet. Start exploring and fill your life with Marketi products!';

  @override
  String get orderDetails => 'Order Details';

  @override
  String get orderTracking => 'Order Tracking';

  @override
  String get shippingAddress => 'Shipping Address';

  @override
  String get downloadInvoice => 'Download Invoice';

  @override
  String get tax => 'Tax';

  @override
  String get free => 'Free';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get shippingFee => 'Shipping Fee';

  @override
  String get totalAmount => 'Total Amount';

  @override
  String get downloadingInvoice => 'Downloading invoice...';

  @override
  String get noBrandsFound => 'No brands found';

  @override
  String get noCategoriesFound => 'No categories found';

  @override
  String get noProductsFound => 'No products found';

  @override
  String get productsFromSameBrand => 'Products from the same brand';

  @override
  String get reviews => 'Reviews';

  @override
  String get noReviews => 'No reviews yet';

  @override
  String get verifiedBuyer => 'Verified Buyer';

  @override
  String get noSearchResultsTitle => 'No results found';

  @override
  String get noSearchResultsDescription =>
      'We couldn\'t find what you are looking for. Try checking the spelling or use different keywords.';

  @override
  String get startSearchingTitle => 'Start Searching';

  @override
  String get startSearchingDescription =>
      'Search for your favorite products, categories, or brands.';

  @override
  String searchResultsCount(int count) {
    return 'Results ($count)';
  }
}
