// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(amount) => "Benefit: \$${amount}";

  static String m1(price) =>
      "Booking request with total cost of \$${price} was successfully made.\nwaiting for landlord approval.";

  static String m2(start) => "From: ${start}";

  static String m3(end) => "To: ${end}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AC": MessageLookupByLibrary.simpleMessage(
      "Request was successfully accepted.",
    ),
    "Bookings": MessageLookupByLibrary.simpleMessage("Bookings"),
    "Chats": MessageLookupByLibrary.simpleMessage("Chats"),
    "Reviews": MessageLookupByLibrary.simpleMessage("Reviews"),
    "Your_estate": MessageLookupByLibrary.simpleMessage("Your estate"),
    "accept": MessageLookupByLibrary.simpleMessage("Accept"),
    "account_deleted_admin": MessageLookupByLibrary.simpleMessage(
      "Your account was deleted by the admin",
    ),
    "admin_error": MessageLookupByLibrary.simpleMessage(
      "This is an admin account, please create a user account.",
    ),
    "all_category": MessageLookupByLibrary.simpleMessage("All"),
    "already_have_account": MessageLookupByLibrary.simpleMessage(
      "Already have an account ",
    ),
    "apartment": MessageLookupByLibrary.simpleMessage("Apartment"),
    "apartment_title_hint": MessageLookupByLibrary.simpleMessage(
      "apartment title..",
    ),
    "area_hint": MessageLookupByLibrary.simpleMessage("area"),
    "area_label": MessageLookupByLibrary.simpleMessage("Area:"),
    "ascending_order": MessageLookupByLibrary.simpleMessage("Ascending order"),
    "bathrooms_hint": MessageLookupByLibrary.simpleMessage("bathrooms"),
    "bathrooms_label": MessageLookupByLibrary.simpleMessage("Bathrooms:"),
    "bedrooms_hint": MessageLookupByLibrary.simpleMessage("bedrooms"),
    "bedrooms_label": MessageLookupByLibrary.simpleMessage("Bedrooms:"),
    "benefit": m0,
    "birth_date_btn": MessageLookupByLibrary.simpleMessage("Birth date"),
    "book_now": MessageLookupByLibrary.simpleMessage("Book Now"),
    "booking_success": m1,
    "calendar_instruction": MessageLookupByLibrary.simpleMessage(
      "Press and hold for a single day book.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("cancel"),
    "cancel_booking_msg": MessageLookupByLibrary.simpleMessage(
      "You are about to cancel this booking, are you sure?",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled bookings"),
    "category_hint": MessageLookupByLibrary.simpleMessage("category"),
    "chat_hint": MessageLookupByLibrary.simpleMessage("Type a message..."),
    "clear_filters": MessageLookupByLibrary.simpleMessage("Clear Filters"),
    "confirm_accept": MessageLookupByLibrary.simpleMessage(
      "You\'re about to accept this request, are you sure?",
    ),
    "confirm_password_hint": MessageLookupByLibrary.simpleMessage(
      "Confirm password",
    ),
    "confirm_reject": MessageLookupByLibrary.simpleMessage(
      "You\'re about to reject this request, are you sure?",
    ),
    "contact": MessageLookupByLibrary.simpleMessage("contact"),
    "currentbb": MessageLookupByLibrary.simpleMessage("Current bookings"),
    "currenthaf": MessageLookupByLibrary.simpleMessage("current"),
    "default_landlord": MessageLookupByLibrary.simpleMessage("Landlord"),
    "delet_house": MessageLookupByLibrary.simpleMessage(
      "You are about to delete this house, are you sure?",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "descending_order": MessageLookupByLibrary.simpleMessage(
      "Descending order",
    ),
    "description_hint": MessageLookupByLibrary.simpleMessage("description"),
    "dont_have_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account ",
    ),
    "duplex": MessageLookupByLibrary.simpleMessage("Duplex"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "err_connection": MessageLookupByLibrary.simpleMessage(
      "Something went wrong, please check your internet connection.",
    ),
    "err_generic": MessageLookupByLibrary.simpleMessage(
      "Something went wrong, check your internet connection.",
    ),
    "err_select_birth": MessageLookupByLibrary.simpleMessage(
      "Please select your birth date",
    ),
    "err_upload_id": MessageLookupByLibrary.simpleMessage(
      "Please upload your identity card",
    ),
    "err_upload_profile": MessageLookupByLibrary.simpleMessage(
      "Please upload your profile picture",
    ),
    "error_in": MessageLookupByLibrary.simpleMessage(
      "something went wrong, please check your internet connection.",
    ),
    "error_title": MessageLookupByLibrary.simpleMessage("Error"),
    "favourites": MessageLookupByLibrary.simpleMessage("Favourites"),
    "field_required": MessageLookupByLibrary.simpleMessage("Field is required"),
    "filtered_badge": MessageLookupByLibrary.simpleMessage("Filtered"),
    "first_name_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your first name",
    ),
    "from_date": m2,
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "hotel": MessageLookupByLibrary.simpleMessage("Hotel"),
    "house": MessageLookupByLibrary.simpleMessage("House"),
    "house_booking_requests": MessageLookupByLibrary.simpleMessage(
      "House booking requests",
    ),
    "house_reputation": MessageLookupByLibrary.simpleMessage(
      "House reputation",
    ),
    "identity_card_label": MessageLookupByLibrary.simpleMessage(
      "Identity card",
    ),
    "last_name_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your last name",
    ),
    "living_rooms_hint": MessageLookupByLibrary.simpleMessage("living rooms"),
    "livingrooms_label": MessageLookupByLibrary.simpleMessage("Livingrooms:"),
    "load_failed": MessageLookupByLibrary.simpleMessage(
      "Failed to load notifications",
    ),
    "location": MessageLookupByLibrary.simpleMessage("location"),
    "login_title": MessageLookupByLibrary.simpleMessage("Log in"),
    "login_to_chat_msg": MessageLookupByLibrary.simpleMessage(
      "Please login to chat",
    ),
    "max_hint": MessageLookupByLibrary.simpleMessage("Max"),
    "min_hint": MessageLookupByLibrary.simpleMessage("Min"),
    "my_houses": MessageLookupByLibrary.simpleMessage("My houses"),
    "new_notification": MessageLookupByLibrary.simpleMessage(
      "New notification",
    ),
    "next_btn": MessageLookupByLibrary.simpleMessage("Next"),
    "no_bookings": MessageLookupByLibrary.simpleMessage("No bookings found"),
    "no_chat": MessageLookupByLibrary.simpleMessage("No chats yet"),
    "no_chats": MessageLookupByLibrary.simpleMessage("No chats yet"),
    "no_houses_category": MessageLookupByLibrary.simpleMessage(
      "No houses found for category",
    ),
    "no_houses_filter": MessageLookupByLibrary.simpleMessage(
      "No houses found with the current filters",
    ),
    "no_houses_found": MessageLookupByLibrary.simpleMessage("No houses found"),
    "no_my_houses_found": MessageLookupByLibrary.simpleMessage(
      "You haven\'t added any houses yet",
    ),
    "no_notifications": MessageLookupByLibrary.simpleMessage(
      "No notifications yet",
    ),
    "no_notifications_subtitle": MessageLookupByLibrary.simpleMessage(
      "When you get notifications, they\'ll appear here",
    ),
    "notifications_title": MessageLookupByLibrary.simpleMessage(
      "Notifications",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "others": MessageLookupByLibrary.simpleMessage("Others"),
    "password_hint": MessageLookupByLibrary.simpleMessage("Password"),
    "pending": MessageLookupByLibrary.simpleMessage("Pending bookings"),
    "personal_info_title": MessageLookupByLibrary.simpleMessage(
      "Personal information",
    ),
    "phone_number_hint": MessageLookupByLibrary.simpleMessage("Phone number"),
    "photo_fail": MessageLookupByLibrary.simpleMessage(
      "Property photos field is required, please upload at least one picture",
    ),
    "post_button": MessageLookupByLibrary.simpleMessage("Post"),
    "price_hint": MessageLookupByLibrary.simpleMessage("price a day"),
    "price_label": MessageLookupByLibrary.simpleMessage("Price:"),
    "profile_picture_label": MessageLookupByLibrary.simpleMessage(
      "Profile picture",
    ),
    "property_details": MessageLookupByLibrary.simpleMessage(
      "Property details",
    ),
    "property_photos": MessageLookupByLibrary.simpleMessage("Property Photos"),
    "rate": MessageLookupByLibrary.simpleMessage("Rate this property"),
    "reject": MessageLookupByLibrary.simpleMessage("Reject"),
    "reputation_filter_hint": MessageLookupByLibrary.simpleMessage(
      "reputation-based filter",
    ),
    "request": MessageLookupByLibrary.simpleMessage("requests"),
    "request_suc": MessageLookupByLibrary.simpleMessage(
      "Request was successfully rejected.",
    ),
    "room": MessageLookupByLibrary.simpleMessage("Room"),
    "search_button": MessageLookupByLibrary.simpleMessage("search"),
    "search_hint": MessageLookupByLibrary.simpleMessage("Search..."),
    "select_category": MessageLookupByLibrary.simpleMessage(
      "Please select a category",
    ),
    "select_main_image": MessageLookupByLibrary.simpleMessage(
      "Please select a main image",
    ),
    "sess_error": MessageLookupByLibrary.simpleMessage(
      "Your account was deleted by the admin or session was over.",
    ),
    "session_error": MessageLookupByLibrary.simpleMessage(
      "Your account was deleted by the admin or session has expired.",
    ),
    "sign_up": MessageLookupByLibrary.simpleMessage("sign up"),
    "success": MessageLookupByLibrary.simpleMessage(
      "update was successfully made. waiting for the landlord aproval.",
    ),
    "suite": MessageLookupByLibrary.simpleMessage("Suite"),
    "to_date": m3,
    "try_again": MessageLookupByLibrary.simpleMessage("Try Again"),
    "type_message_hint": MessageLookupByLibrary.simpleMessage(
      "Type a message...",
    ),
    "update_booking": MessageLookupByLibrary.simpleMessage("Update booking"),
    "update_booking_requests": MessageLookupByLibrary.simpleMessage(
      "Update booking requests",
    ),
    "uptd": MessageLookupByLibrary.simpleMessage("Update"),
    "villa": MessageLookupByLibrary.simpleMessage("Villa"),
    "wait_approval_msg": MessageLookupByLibrary.simpleMessage(
      "Please wait until\nyour account\ncreation is approved",
    ),
    "welcome_sub1": MessageLookupByLibrary.simpleMessage(
      "Find your next space, feel at home",
    ),
    "welcome_sub2": MessageLookupByLibrary.simpleMessage(
      "Where comfort meets convenience",
    ),
    "welcome_title": MessageLookupByLibrary.simpleMessage("WELCOME"),
    "your_estates_title": MessageLookupByLibrary.simpleMessage("Your Estates"),
  };
}
