// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(amount) => "الربح: ${amount}\$";

  static String m1(price) =>
      "تم تقديم طلب الحجز بتكلفة إجمالية قدرها ${price}\$ بنجاح.\nبانتظار موافقة صاحب العقار.";

  static String m2(start) => "من: ${start}";

  static String m3(end) => "إلى: ${end}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AC": MessageLookupByLibrary.simpleMessage("تم قبول الطلب بنجاح."),
    "Bookings": MessageLookupByLibrary.simpleMessage("الحجوزات"),
    "Chats": MessageLookupByLibrary.simpleMessage("المحادثات"),
    "Reviews": MessageLookupByLibrary.simpleMessage("المراجعات"),
    "Your_estate": MessageLookupByLibrary.simpleMessage("عقاراتي"),
    "accept": MessageLookupByLibrary.simpleMessage("قبول"),
    "account_deleted_admin": MessageLookupByLibrary.simpleMessage(
      "لقد تم حذف حسابك من قبل المسؤول",
    ),
    "admin_error": MessageLookupByLibrary.simpleMessage(
      "هذا حساب مسؤول، يرجى إنشاء حساب مستخدم.",
    ),
    "all_category": MessageLookupByLibrary.simpleMessage("الكل"),
    "already_have_account": MessageLookupByLibrary.simpleMessage(
      "لديك حساب بالفعل؟ ",
    ),
    "apartment": MessageLookupByLibrary.simpleMessage("شقة"),
    "apartment_title_hint": MessageLookupByLibrary.simpleMessage(
      "عنوان الشقة..",
    ),
    "area_hint": MessageLookupByLibrary.simpleMessage("المساحة"),
    "area_label": MessageLookupByLibrary.simpleMessage("المساحة:"),
    "ascending_order": MessageLookupByLibrary.simpleMessage("ترتيب تصاعدي"),
    "bathrooms_hint": MessageLookupByLibrary.simpleMessage("الحمامات"),
    "bathrooms_label": MessageLookupByLibrary.simpleMessage("الحمامات:"),
    "bedrooms_hint": MessageLookupByLibrary.simpleMessage("غرف النوم"),
    "bedrooms_label": MessageLookupByLibrary.simpleMessage("غرف النوم:"),
    "benefit": m0,
    "birth_date_btn": MessageLookupByLibrary.simpleMessage("تاريخ الميلاد"),
    "book_now": MessageLookupByLibrary.simpleMessage("احجز الآن"),
    "booking_success": m1,
    "calendar_instruction": MessageLookupByLibrary.simpleMessage(
      "اضغط مطولاً للحجز ليوم واحد.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "cancel_booking_msg": MessageLookupByLibrary.simpleMessage(
      "أنت على وشك إلغاء هذا الحجز، هل أنت متأكد؟",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage("حجوزات ملغاة"),
    "category_hint": MessageLookupByLibrary.simpleMessage("الفئة"),
    "chat_hint": MessageLookupByLibrary.simpleMessage("اكتب رسالة..."),
    "clear_filters": MessageLookupByLibrary.simpleMessage("مسح الفلاتر"),
    "confirm_accept": MessageLookupByLibrary.simpleMessage(
      "أنت على وشك قبول هذا الطلب، هل أنت متأكد؟",
    ),
    "confirm_password_hint": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور",
    ),
    "confirm_reject": MessageLookupByLibrary.simpleMessage(
      "أنت على وشك رفض هذا الطلب، هل أنت متأكد؟",
    ),
    "contact": MessageLookupByLibrary.simpleMessage("تواصل"),
    "currentbb": MessageLookupByLibrary.simpleMessage("الحجوزات الحالية"),
    "currenthaf": MessageLookupByLibrary.simpleMessage("الحالية"),
    "default_landlord": MessageLookupByLibrary.simpleMessage("صاحب العقار"),
    "delet_house": MessageLookupByLibrary.simpleMessage(
      "أنت على وشك حذف هذا المنزل، هل أنت متأكد؟",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "descending_order": MessageLookupByLibrary.simpleMessage("ترتيب تنازلي"),
    "description_hint": MessageLookupByLibrary.simpleMessage("الوصف"),
    "dont_have_account": MessageLookupByLibrary.simpleMessage(
      "ليس لديك حساب؟ ",
    ),
    "duplex": MessageLookupByLibrary.simpleMessage("دوبلكس"),
    "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "err_connection": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما، يرجى التحقق من اتصال الإنترنت.",
    ),
    "err_generic": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما، تحقق من اتصال الإنترنت الخاص بك.",
    ),
    "err_select_birth": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار تاريخ ميلادك",
    ),
    "err_upload_id": MessageLookupByLibrary.simpleMessage(
      "يرجى تحميل بطاقة الهوية الخاصة بك",
    ),
    "err_upload_profile": MessageLookupByLibrary.simpleMessage(
      "يرجى تحميل صورتك الشخصية",
    ),
    "error_in": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما، يرجى التحقق من اتصال الإنترنت.",
    ),
    "error_title": MessageLookupByLibrary.simpleMessage("خطأ"),
    "favourites": MessageLookupByLibrary.simpleMessage("المفضلة"),
    "field_required": MessageLookupByLibrary.simpleMessage("هذا الحقل مطلوب"),
    "filtered_badge": MessageLookupByLibrary.simpleMessage("مُصفّى"),
    "first_name_hint": MessageLookupByLibrary.simpleMessage("أدخل اسمك الأول"),
    "from_date": m2,
    "home": MessageLookupByLibrary.simpleMessage("المنزل"),
    "hotel": MessageLookupByLibrary.simpleMessage("فندق"),
    "house": MessageLookupByLibrary.simpleMessage("منزل"),
    "house_booking_requests": MessageLookupByLibrary.simpleMessage(
      "طلبات حجز المنازل",
    ),
    "house_reputation": MessageLookupByLibrary.simpleMessage("سمعة المنزل"),
    "identity_card_label": MessageLookupByLibrary.simpleMessage("بطاقة الهوية"),
    "last_name_hint": MessageLookupByLibrary.simpleMessage("أدخل اسمك الأخير"),
    "living_rooms_hint": MessageLookupByLibrary.simpleMessage("غرف المعيشة"),
    "livingrooms_label": MessageLookupByLibrary.simpleMessage("غرف المعيشة:"),
    "load_failed": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل الإشعارات",
    ),
    "location": MessageLookupByLibrary.simpleMessage("الموقع"),
    "login_title": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "login_to_chat_msg": MessageLookupByLibrary.simpleMessage(
      "يرجى تسجيل الدخول للدردشة",
    ),
    "max_hint": MessageLookupByLibrary.simpleMessage("الأقصى"),
    "min_hint": MessageLookupByLibrary.simpleMessage("الأدنى"),
    "my_houses": MessageLookupByLibrary.simpleMessage("منازلي"),
    "new_notification": MessageLookupByLibrary.simpleMessage("إشعار جديد"),
    "next_btn": MessageLookupByLibrary.simpleMessage("التالي"),
    "no_bookings": MessageLookupByLibrary.simpleMessage("لا توجد حجوزات"),
    "no_chat": MessageLookupByLibrary.simpleMessage("لا توجد محادثات بعد"),
    "no_chats": MessageLookupByLibrary.simpleMessage("لا توجد محادثات بعد"),
    "no_houses_category": MessageLookupByLibrary.simpleMessage(
      "لا توجد منازل لهذه الفئة",
    ),
    "no_houses_filter": MessageLookupByLibrary.simpleMessage(
      "لا توجد منازل مطابقة للفلاتر الحالية",
    ),
    "no_houses_found": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على منازل",
    ),
    "no_my_houses_found": MessageLookupByLibrary.simpleMessage(
      "لم تقم بإضافة أي منازل بعد",
    ),
    "no_notifications": MessageLookupByLibrary.simpleMessage(
      "لا توجد إشعارات بعد",
    ),
    "no_notifications_subtitle": MessageLookupByLibrary.simpleMessage(
      "عندما تتلقى إشعارات، ستظهر هنا",
    ),
    "notifications_title": MessageLookupByLibrary.simpleMessage("الإشعارات"),
    "ok": MessageLookupByLibrary.simpleMessage("موافق"),
    "others": MessageLookupByLibrary.simpleMessage("أخرى"),
    "password_hint": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "pending": MessageLookupByLibrary.simpleMessage("حجوزات قيد الانتظار"),
    "personal_info_title": MessageLookupByLibrary.simpleMessage(
      "المعلومات الشخصية",
    ),
    "phone_number_hint": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "photo_fail": MessageLookupByLibrary.simpleMessage(
      "حقل صور العقار مطلوب، يرجى تحميل صورة واحدة على الأقل",
    ),
    "post_button": MessageLookupByLibrary.simpleMessage("نشر"),
    "price_hint": MessageLookupByLibrary.simpleMessage("السعر لليوم الواحد"),
    "price_label": MessageLookupByLibrary.simpleMessage("السعر:"),
    "profile_picture_label": MessageLookupByLibrary.simpleMessage(
      "الصورة الشخصية",
    ),
    "property_details": MessageLookupByLibrary.simpleMessage("تفاصيل العقار"),
    "property_photos": MessageLookupByLibrary.simpleMessage("صور العقار"),
    "rate": MessageLookupByLibrary.simpleMessage("تقييم هذا العقار"),
    "reject": MessageLookupByLibrary.simpleMessage("رفض"),
    "reputation_filter_hint": MessageLookupByLibrary.simpleMessage(
      "تصفية بناءً على السمعة",
    ),
    "request": MessageLookupByLibrary.simpleMessage("الطلبات"),
    "request_suc": MessageLookupByLibrary.simpleMessage("تم رفض الطلب بنجاح."),
    "room": MessageLookupByLibrary.simpleMessage("غرفة"),
    "search_button": MessageLookupByLibrary.simpleMessage("بحث"),
    "search_hint": MessageLookupByLibrary.simpleMessage("بحث..."),
    "select_category": MessageLookupByLibrary.simpleMessage("يرجى اختيار فئة"),
    "select_main_image": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار صورة رئيسية",
    ),
    "sess_error": MessageLookupByLibrary.simpleMessage(
      "تم حذف حسابك من قبل المسؤول أو انتهت صلاحية الجلسة.",
    ),
    "session_error": MessageLookupByLibrary.simpleMessage(
      "تم حذف حسابك من قبل المسؤول أو انتهت صلاحية الجلسة.",
    ),
    "sign_up": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "success": MessageLookupByLibrary.simpleMessage(
      "تم التحديث بنجاح. بانتظار موافقة صاحب العقار.",
    ),
    "suite": MessageLookupByLibrary.simpleMessage("جناح"),
    "to_date": m3,
    "try_again": MessageLookupByLibrary.simpleMessage("أعد المحاولة"),
    "type_message_hint": MessageLookupByLibrary.simpleMessage("اكتب رسالة..."),
    "update_booking": MessageLookupByLibrary.simpleMessage("تحديث الحجز"),
    "update_booking_requests": MessageLookupByLibrary.simpleMessage(
      "طلبات تحديث الحجز",
    ),
    "uptd": MessageLookupByLibrary.simpleMessage("تحديث"),
    "villa": MessageLookupByLibrary.simpleMessage("فيلا"),
    "wait_approval_msg": MessageLookupByLibrary.simpleMessage(
      "يرجى الانتظار حتى\nيتم قبول إنشاء\nحسابك",
    ),
    "welcome_sub1": MessageLookupByLibrary.simpleMessage(
      "جد مساحتك القادمة، واشعر وكأنك في منزلك",
    ),
    "welcome_sub2": MessageLookupByLibrary.simpleMessage(
      "حيث تلتقي الراحة مع التميز",
    ),
    "welcome_title": MessageLookupByLibrary.simpleMessage("مرحباً بك"),
    "your_estates_title": MessageLookupByLibrary.simpleMessage("عقاراتك"),
  };
}
