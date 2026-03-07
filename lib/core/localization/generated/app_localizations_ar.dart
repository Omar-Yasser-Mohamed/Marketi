// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get onboardingOneTitle => 'مرحبًا بك في ماركتي';

  @override
  String get onboardingOneDesc =>
      'اكتشف عالمًا مليئًا بالإمكانيات وتسوق بكل سهولة من مكانك. تصفح مجموعة واسعة من المنتجات من الأزياء والإلكترونيات إلى مستلزمات المنزل.';

  @override
  String get onboardingTwoTitle => 'سهولة الشراء';

  @override
  String get onboardingTwoDesc =>
      'اعثر على المنتج المثالي الذي يناسب ذوقك واحتياجاتك مع خيارات دفع آمنة وتوصيل سريع. التسوق أصبح أسهل من أي وقت مضى.';

  @override
  String get onboardingThreeTitle => 'تجربة مستخدم رائعة';

  @override
  String get onboardingThreeDesc =>
      'ابدأ الاستكشاف الآن واستمتع بتجربة تسوق إلكتروني مريحة وسلسة.';

  @override
  String get next => 'التالي';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get password => 'كلمة المرور';

  @override
  String get remember_me => 'تذكرني';

  @override
  String get forgot_password_ques => 'هل نسيت كلمة المرور؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get or_continue_with => 'أو المتابعة باستخدام';

  @override
  String get are_you_new => 'هل أنت جديد في ماركتي؟';

  @override
  String get register => 'إنشاء حساب';

  @override
  String get your_name => 'اسمك';

  @override
  String get full_name => 'الاسم بالكامل';

  @override
  String get phone_number => 'رقم الهاتف';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get confirm_password => 'تأكيد كلمة المرور';

  @override
  String get signup => 'إنشاء حساب';

  @override
  String get forgot_password => 'نسيت كلمة المرور';

  @override
  String get forgot_password_desc =>
      'من فضلك أدخل بريدك الإلكتروني لاستلام رمز التحقق';

  @override
  String get send_code => 'إرسال الرمز';

  @override
  String get verification_code => 'رمز التحقق';

  @override
  String get verification_code_desc =>
      'من فضلك أدخل رمز التحقق المكوّن من 6 أرقام المرسل إلى: ';

  @override
  String get verify_code => 'تأكيد الرمز';

  @override
  String get resend_code => 'إعادة إرسال الرمز';

  @override
  String get createNewPassword => 'إنشاء كلمة مرور جديدة';

  @override
  String get newPasswordHint =>
      'يجب أن تكون كلمة المرور الجديدة مختلفة عن السابقة';

  @override
  String get savePassword => 'حفظ كلمة المرور';

  @override
  String get congratulations => 'تهانينا';

  @override
  String get passwordUpdatedMessage =>
      'تم تحديث كلمة المرور بنجاح. يُرجى تسجيل الدخول مرة أخرى باستخدام كلمة المرور الجديدة.';

  @override
  String get nameRequired => 'الاسم مطلوب';

  @override
  String get nameMinLength => 'الاسم لازم يكون 3 حروف على الأقل';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get invalidEmail => 'أدخل بريد إلكتروني صحيح';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordMinLength => 'كلمة المرور لازم تكون 8 حروف على الأقل';

  @override
  String get passwordUppercase => 'حرف كبير';

  @override
  String get passwordLowercase => 'حرف صغير';

  @override
  String get passwordNumber => 'رقم';

  @override
  String get passwordSpecial => 'رمز خاص';

  @override
  String passwordMustContain(Object rules) {
    return 'كلمة المرور يجب أن تحتوي على $rules';
  }

  @override
  String get confirmPasswordRequired => 'من فضلك أكد كلمة المرور';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get phoneRequired => 'رقم الهاتف مطلوب';

  @override
  String get invalidEgyptianPhone => 'أدخل رقم هاتف مصري صحيح (11 رقم)';

  @override
  String get pinRequired => 'رمز PIN مطلوب';

  @override
  String get pinDigitsOnly => 'رمز PIN يجب أن يحتوي على أرقام فقط';

  @override
  String get pinInvalidLength => 'رمز PIN يجب أن يكون 6 أرقام';

  @override
  String get verificationCodeSentSuccessfully => 'تم إرسال رمز التحقق بنجاح';

  @override
  String get errorNetwork => 'لا يوجد اتصال بالإنترنت. تأكد من الشبكة.';

  @override
  String get errorTimeout => 'الطلب استغرق وقتًا طويلاً. حاول مرة أخرى.';

  @override
  String get errorUnauthorized => 'غير مصرح لك بتنفيذ هذا الإجراء.';

  @override
  String get errorForbidden => 'تم رفض الوصول.';

  @override
  String get errorSessionExpired => 'انتهت صلاحية الجلسة. سجل الدخول مرة أخرى.';

  @override
  String get errorBadRequest => 'طلب غير صالح. تحقق من البيانات.';

  @override
  String get errorNotFound => 'لم يتم العثور على البيانات المطلوبة.';

  @override
  String get errorConflict => 'هذه البيانات موجودة بالفعل.';

  @override
  String get errorServer => 'خطأ في الخادم. حاول لاحقًا.';

  @override
  String get errorCache => 'فشل تحميل البيانات المحفوظة.';

  @override
  String get errorDatabase => 'حدث خطأ في قاعدة البيانات.';

  @override
  String get errorValidation => 'تحقق من البيانات المدخلة.';

  @override
  String get errorEmptyData => 'لا توجد بيانات.';

  @override
  String get errorCancelled => 'تم إلغاء الطلب.';

  @override
  String get errorUnknown => 'حدث خطأ غير متوقع. حاول مرة أخرى.';

  @override
  String get otpResentSuccess => 'تم إرسال رمز تحقق جديد.';

  @override
  String get home => 'الرئيسية';

  @override
  String get cart => 'السلة';

  @override
  String get favorites => 'المفضلة';

  @override
  String get profile => 'حسابي';

  @override
  String hiUser(Object name) {
    return 'مرحبًا $name!';
  }

  @override
  String get searchHint => 'بتدور على إيه؟';

  @override
  String get popular_product => 'المنتجات الأكثر شهرة';

  @override
  String get view_all => 'عرض الكل';

  @override
  String get category => 'فئة';

  @override
  String get bestForYou => 'الأفضل لك';

  @override
  String get brands => 'العلامات التجارية';

  @override
  String get allProducts => 'جميع المنتجات';

  @override
  String get price => 'السعر';

  @override
  String get addToCart => 'أضف إلى السلة';

  @override
  String get add => 'إضافة';

  @override
  String get rating => 'التقييم';

  @override
  String get description => 'الوصف';

  @override
  String get soldBy => 'يُباع بواسطة';

  @override
  String averageRating(Object count) {
    return 'متوسط التقييم بناءً على $count تقييمًا من مصادر موثوقة';
  }

  @override
  String get categories => 'الفئات';

  @override
  String ahlan(Object name) {
    return 'أهلاً, $name!';
  }

  @override
  String get orders => 'الطلبات';

  @override
  String get wishlist => 'المفضلة';

  @override
  String get payment => 'الدفع';

  @override
  String get address => 'العنوان';

  @override
  String get language => 'اللغة';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get theme => 'المظهر';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get lightMode => 'الوضع الفاتح';

  @override
  String get settings => 'الإعدادات';

  @override
  String get logout => 'تسجيل الخروج';
}
