// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log in`
  String get login_title {
    return Intl.message('Log in', name: 'login_title', desc: '', args: []);
  }

  /// `Phone number`
  String get phone_number_hint {
    return Intl.message(
      'Phone number',
      name: 'phone_number_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_hint {
    return Intl.message('Password', name: 'password_hint', desc: '', args: []);
  }

  /// `Confirm password`
  String get confirm_password_hint {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account `
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account ',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message('Sign up', name: 'sign_up', desc: '', args: []);
  }

  /// `Your Estates`
  String get your_estates_title {
    return Intl.message(
      'Your Estates',
      name: 'your_estates_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Booking request with total cost of {price}$ was successfully made.\nwaiting for landlord approval.`
  String booking_success(Object price) {
    return Intl.message(
      'Booking request with total cost of $price\$ was successfully made.\nwaiting for landlord approval.',
      name: 'booking_success',
      desc: '',
      args: [price],
    );
  }

  /// `Update was successfully made. Waiting for the landlord approval.`
  String get success {
    return Intl.message(
      'Update was successfully made. Waiting for the landlord approval.',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Property photos field is required, please upload at least one picture`
  String get photo_fail {
    return Intl.message(
      'Property photos field is required, please upload at least one picture',
      name: 'photo_fail',
      desc: '',
      args: [],
    );
  }

  /// `Your account was deleted by the admin`
  String get account_deleted_admin {
    return Intl.message(
      'Your account was deleted by the admin',
      name: 'account_deleted_admin',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please check your internet connection.`
  String get error_in {
    return Intl.message(
      'Something went wrong, please check your internet connection.',
      name: 'error_in',
      desc: '',
      args: [],
    );
  }

  /// `This is an admin account, please create a user account.`
  String get admin_error {
    return Intl.message(
      'This is an admin account, please create a user account.',
      name: 'admin_error',
      desc: '',
      args: [],
    );
  }

  /// `Your account was deleted by the admin or session was over.`
  String get sess_error {
    return Intl.message(
      'Your account was deleted by the admin or session was over.',
      name: 'sess_error',
      desc: '',
      args: [],
    );
  }

  /// `Request was successfully rejected.`
  String get request_suc {
    return Intl.message(
      'Request was successfully rejected.',
      name: 'request_suc',
      desc: '',
      args: [],
    );
  }

  /// `Request was successfully accepted.`
  String get AC {
    return Intl.message(
      'Request was successfully accepted.',
      name: 'AC',
      desc: '',
      args: [],
    );
  }

  /// `Your account was deleted by the admin or session has expired.`
  String get session_error {
    return Intl.message(
      'Your account was deleted by the admin or session has expired.',
      name: 'session_error',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please check your internet connection.`
  String get err_connection {
    return Intl.message(
      'Something went wrong, please check your internet connection.',
      name: 'err_connection',
      desc: '',
      args: [],
    );
  }

  /// `No chats yet`
  String get no_chats {
    return Intl.message('No chats yet', name: 'no_chats', desc: '', args: []);
  }

  /// `Landlord`
  String get default_landlord {
    return Intl.message(
      'Landlord',
      name: 'default_landlord',
      desc: '',
      args: [],
    );
  }

  /// `Type a message...`
  String get chat_hint {
    return Intl.message(
      'Type a message...',
      name: 'chat_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please wait until\nyour account\ncreation is approved`
  String get wait_approval_msg {
    return Intl.message(
      'Please wait until\nyour account\ncreation is approved',
      name: 'wait_approval_msg',
      desc: '',
      args: [],
    );
  }

  /// `WELCOME`
  String get welcome_title {
    return Intl.message('WELCOME', name: 'welcome_title', desc: '', args: []);
  }

  /// `Find your next space, feel at home`
  String get welcome_sub1 {
    return Intl.message(
      'Find your next space, feel at home',
      name: 'welcome_sub1',
      desc: '',
      args: [],
    );
  }

  /// `Where comfort meets convenience`
  String get welcome_sub2 {
    return Intl.message(
      'Where comfort meets convenience',
      name: 'welcome_sub2',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message('Contact', name: 'contact', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Reviews`
  String get Reviews {
    return Intl.message('Reviews', name: 'Reviews', desc: '', args: []);
  }

  /// `Requests`
  String get request {
    return Intl.message('Requests', name: 'request', desc: '', args: []);
  }

  /// `Rate this property`
  String get rate {
    return Intl.message('Rate this property', name: 'rate', desc: '', args: []);
  }

  /// `My houses`
  String get my_houses {
    return Intl.message('My houses', name: 'my_houses', desc: '', args: []);
  }

  /// `House reputation`
  String get house_reputation {
    return Intl.message(
      'House reputation',
      name: 'house_reputation',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get personal_info_title {
    return Intl.message(
      'Personal information',
      name: 'personal_info_title',
      desc: '',
      args: [],
    );
  }

  /// `You are about to delete this house, are you sure?`
  String get delet_house {
    return Intl.message(
      'You are about to delete this house, are you sure?',
      name: 'delet_house',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get first_name_hint {
    return Intl.message(
      'Enter your first name',
      name: 'first_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get last_name_hint {
    return Intl.message(
      'Enter your last name',
      name: 'last_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Identity card`
  String get identity_card_label {
    return Intl.message(
      'Identity card',
      name: 'identity_card_label',
      desc: '',
      args: [],
    );
  }

  /// `Profile picture`
  String get profile_picture_label {
    return Intl.message(
      'Profile picture',
      name: 'profile_picture_label',
      desc: '',
      args: [],
    );
  }

  /// `Birth date`
  String get birth_date_btn {
    return Intl.message(
      'Birth date',
      name: 'birth_date_btn',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next_btn {
    return Intl.message('Next', name: 'next_btn', desc: '', args: []);
  }

  /// `Already have an account `
  String get already_have_account {
    return Intl.message(
      'Already have an account ',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your identity card`
  String get err_upload_id {
    return Intl.message(
      'Please upload your identity card',
      name: 'err_upload_id',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your profile picture`
  String get err_upload_profile {
    return Intl.message(
      'Please upload your profile picture',
      name: 'err_upload_profile',
      desc: '',
      args: [],
    );
  }

  /// `Please select your birth date`
  String get err_select_birth {
    return Intl.message(
      'Please select your birth date',
      name: 'err_select_birth',
      desc: '',
      args: [],
    );
  }

  /// `Please login to chat`
  String get login_to_chat_msg {
    return Intl.message(
      'Please login to chat',
      name: 'login_to_chat_msg',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, check your internet connection.`
  String get err_generic {
    return Intl.message(
      'Something went wrong, check your internet connection.',
      name: 'err_generic',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get favourites {
    return Intl.message('Favourites', name: 'favourites', desc: '', args: []);
  }

  /// `No houses found`
  String get no_houses_found {
    return Intl.message(
      'No houses found',
      name: 'no_houses_found',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added any houses yet`
  String get no_my_houses_found {
    return Intl.message(
      'You haven\'t added any houses yet',
      name: 'no_my_houses_found',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search_hint {
    return Intl.message('Search...', name: 'search_hint', desc: '', args: []);
  }

  /// `Filtered`
  String get filtered_badge {
    return Intl.message('Filtered', name: 'filtered_badge', desc: '', args: []);
  }

  /// `Clear Filters`
  String get clear_filters {
    return Intl.message(
      'Clear Filters',
      name: 'clear_filters',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all_category {
    return Intl.message('All', name: 'all_category', desc: '', args: []);
  }

  /// `No houses found with the current filters`
  String get no_houses_filter {
    return Intl.message(
      'No houses found with the current filters',
      name: 'no_houses_filter',
      desc: '',
      args: [],
    );
  }

  /// `No houses found for category`
  String get no_houses_category {
    return Intl.message(
      'No houses found for category',
      name: 'no_houses_category',
      desc: '',
      args: [],
    );
  }

  /// `Hotel`
  String get hotel {
    return Intl.message('Hotel', name: 'hotel', desc: '', args: []);
  }

  /// `Room`
  String get room {
    return Intl.message('Room', name: 'room', desc: '', args: []);
  }

  /// `Duplex`
  String get duplex {
    return Intl.message('Duplex', name: 'duplex', desc: '', args: []);
  }

  /// `Villa`
  String get villa {
    return Intl.message('Villa', name: 'villa', desc: '', args: []);
  }

  /// `Suite`
  String get suite {
    return Intl.message('Suite', name: 'suite', desc: '', args: []);
  }

  /// `Apartment`
  String get apartment {
    return Intl.message('Apartment', name: 'apartment', desc: '', args: []);
  }

  /// `House`
  String get house {
    return Intl.message('House', name: 'house', desc: '', args: []);
  }

  /// `Others`
  String get others {
    return Intl.message('Others', name: 'others', desc: '', args: []);
  }

  /// `Bookings`
  String get Bookings {
    return Intl.message('Bookings', name: 'Bookings', desc: '', args: []);
  }

  /// `Your estate`
  String get Your_estate {
    return Intl.message('Your estate', name: 'Your_estate', desc: '', args: []);
  }

  /// `Chats`
  String get Chats {
    return Intl.message('Chats', name: 'Chats', desc: '', args: []);
  }

  /// `Apartment title..`
  String get apartment_title_hint {
    return Intl.message(
      'Apartment title..',
      name: 'apartment_title_hint',
      desc: '',
      args: [],
    );
  }

  /// `Property Photos`
  String get property_photos {
    return Intl.message(
      'Property Photos',
      name: 'property_photos',
      desc: '',
      args: [],
    );
  }

  /// `Property details`
  String get property_details {
    return Intl.message(
      'Property details',
      name: 'property_details',
      desc: '',
      args: [],
    );
  }

  /// `Bedrooms`
  String get bedrooms_hint {
    return Intl.message('Bedrooms', name: 'bedrooms_hint', desc: '', args: []);
  }

  /// `Bathrooms`
  String get bathrooms_hint {
    return Intl.message(
      'Bathrooms',
      name: 'bathrooms_hint',
      desc: '',
      args: [],
    );
  }

  /// `Living rooms`
  String get living_rooms_hint {
    return Intl.message(
      'Living rooms',
      name: 'living_rooms_hint',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category_hint {
    return Intl.message('Category', name: 'category_hint', desc: '', args: []);
  }

  /// `Area`
  String get area_hint {
    return Intl.message('Area', name: 'area_hint', desc: '', args: []);
  }

  /// `Price a day`
  String get price_hint {
    return Intl.message('Price a day', name: 'price_hint', desc: '', args: []);
  }

  /// `Description`
  String get description_hint {
    return Intl.message(
      'Description',
      name: 'description_hint',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post_button {
    return Intl.message('Post', name: 'post_button', desc: '', args: []);
  }

  /// `Error`
  String get error_title {
    return Intl.message('Error', name: 'error_title', desc: '', args: []);
  }

  /// `Please select a main image`
  String get select_main_image {
    return Intl.message(
      'Please select a main image',
      name: 'select_main_image',
      desc: '',
      args: [],
    );
  }

  /// `Please select a category`
  String get select_category {
    return Intl.message(
      'Please select a category',
      name: 'select_category',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Current bookings`
  String get currentbb {
    return Intl.message(
      'Current bookings',
      name: 'currentbb',
      desc: '',
      args: [],
    );
  }

  /// `Pending bookings`
  String get pending {
    return Intl.message(
      'Pending bookings',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled bookings`
  String get cancelled {
    return Intl.message(
      'Cancelled bookings',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `No bookings found`
  String get no_bookings {
    return Intl.message(
      'No bookings found',
      name: 'no_bookings',
      desc: '',
      args: [],
    );
  }

  /// `Press and hold for a single day book.`
  String get calendar_instruction {
    return Intl.message(
      'Press and hold for a single day book.',
      name: 'calendar_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get book_now {
    return Intl.message('Book Now', name: 'book_now', desc: '', args: []);
  }

  /// `Update booking`
  String get update_booking {
    return Intl.message(
      'Update booking',
      name: 'update_booking',
      desc: '',
      args: [],
    );
  }

  /// `You are about to cancel this booking, are you sure?`
  String get cancel_booking_msg {
    return Intl.message(
      'You are about to cancel this booking, are you sure?',
      name: 'cancel_booking_msg',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get uptd {
    return Intl.message('Update', name: 'uptd', desc: '', args: []);
  }

  /// `Reputation-based filter`
  String get reputation_filter_hint {
    return Intl.message(
      'Reputation-based filter',
      name: 'reputation_filter_hint',
      desc: '',
      args: [],
    );
  }

  /// `Descending order`
  String get descending_order {
    return Intl.message(
      'Descending order',
      name: 'descending_order',
      desc: '',
      args: [],
    );
  }

  /// `Ascending order`
  String get ascending_order {
    return Intl.message(
      'Ascending order',
      name: 'ascending_order',
      desc: '',
      args: [],
    );
  }

  /// `Price:`
  String get price_label {
    return Intl.message('Price:', name: 'price_label', desc: '', args: []);
  }

  /// `Area:`
  String get area_label {
    return Intl.message('Area:', name: 'area_label', desc: '', args: []);
  }

  /// `Bathrooms:`
  String get bathrooms_label {
    return Intl.message(
      'Bathrooms:',
      name: 'bathrooms_label',
      desc: '',
      args: [],
    );
  }

  /// `Livingrooms:`
  String get livingrooms_label {
    return Intl.message(
      'Livingrooms:',
      name: 'livingrooms_label',
      desc: '',
      args: [],
    );
  }

  /// `Bedrooms:`
  String get bedrooms_label {
    return Intl.message(
      'Bedrooms:',
      name: 'bedrooms_label',
      desc: '',
      args: [],
    );
  }

  /// `Min`
  String get min_hint {
    return Intl.message('Min', name: 'min_hint', desc: '', args: []);
  }

  /// `Max`
  String get max_hint {
    return Intl.message('Max', name: 'max_hint', desc: '', args: []);
  }

  /// `Search`
  String get search_button {
    return Intl.message('Search', name: 'search_button', desc: '', args: []);
  }

  /// `No chats yet`
  String get no_chat {
    return Intl.message('No chats yet', name: 'no_chat', desc: '', args: []);
  }

  /// `Type a message...`
  String get type_message_hint {
    return Intl.message(
      'Type a message...',
      name: 'type_message_hint',
      desc: '',
      args: [],
    );
  }

  /// `House booking requests`
  String get house_booking_requests {
    return Intl.message(
      'House booking requests',
      name: 'house_booking_requests',
      desc: '',
      args: [],
    );
  }

  /// `Update booking requests`
  String get update_booking_requests {
    return Intl.message(
      'Update booking requests',
      name: 'update_booking_requests',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications_title {
    return Intl.message(
      'Notifications',
      name: 'notifications_title',
      desc: '',
      args: [],
    );
  }

  /// `New notification`
  String get new_notification {
    return Intl.message(
      'New notification',
      name: 'new_notification',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load notifications`
  String get load_failed {
    return Intl.message(
      'Failed to load notifications',
      name: 'load_failed',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get try_again {
    return Intl.message('Try Again', name: 'try_again', desc: '', args: []);
  }

  /// `No notifications yet`
  String get no_notifications {
    return Intl.message(
      'No notifications yet',
      name: 'no_notifications',
      desc: '',
      args: [],
    );
  }

  /// `When you get notifications, they'll appear here`
  String get no_notifications_subtitle {
    return Intl.message(
      'When you get notifications, they\'ll appear here',
      name: 'no_notifications_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `From: {start}`
  String from_date(Object start) {
    return Intl.message(
      'From: $start',
      name: 'from_date',
      desc: '',
      args: [start],
    );
  }

  /// `To: {end}`
  String to_date(Object end) {
    return Intl.message('To: $end', name: 'to_date', desc: '', args: [end]);
  }

  /// `Benefit: {amount}$`
  String benefit(Object amount) {
    return Intl.message(
      'Benefit: $amount\$',
      name: 'benefit',
      desc: '',
      args: [amount],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Field is required`
  String get field_required {
    return Intl.message(
      'Field is required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `Current`
  String get currenthaf {
    return Intl.message('Current', name: 'currenthaf', desc: '', args: []);
  }

  /// `You're about to accept this request, are you sure?`
  String get confirm_accept {
    return Intl.message(
      'You\'re about to accept this request, are you sure?',
      name: 'confirm_accept',
      desc: '',
      args: [],
    );
  }

  /// `You're about to reject this request, are you sure?`
  String get confirm_reject {
    return Intl.message(
      'You\'re about to reject this request, are you sure?',
      name: 'confirm_reject',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `User name:`
  String get user_name_label {
    return Intl.message(
      'User name:',
      name: 'user_name_label',
      desc: '',
      args: [],
    );
  }

  /// `Phone number:`
  String get phone_number_label {
    return Intl.message(
      'Phone number:',
      name: 'phone_number_label',
      desc: '',
      args: [],
    );
  }

  /// `Birth date:`
  String get birth_date_label {
    return Intl.message(
      'Birth date:',
      name: 'birth_date_label',
      desc: '',
      args: [],
    );
  }

  /// `ID card:`
  String get id_card_label {
    return Intl.message('ID card:', name: 'id_card_label', desc: '', args: []);
  }

  /// `App Theme`
  String get app_theme {
    return Intl.message('App Theme', name: 'app_theme', desc: '', args: []);
  }

  /// `Light theme`
  String get light_theme {
    return Intl.message('Light theme', name: 'light_theme', desc: '', args: []);
  }

  /// `Dark theme`
  String get dark_theme {
    return Intl.message('Dark theme', name: 'dark_theme', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Your balance:`
  String get your_balance {
    return Intl.message(
      'Your balance:',
      name: 'your_balance',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `About us`
  String get about_us {
    return Intl.message('About us', name: 'about_us', desc: '', args: []);
  }

  /// `Log out`
  String get logout {
    return Intl.message('Log out', name: 'logout', desc: '', args: []);
  }

  /// `Delete account`
  String get delete_account {
    return Intl.message(
      'Delete account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `bayan wehbeh`
  String get bayan {
    return Intl.message('bayan wehbeh', name: 'bayan', desc: '', args: []);
  }

  /// `amina ainia`
  String get amina {
    return Intl.message('amina ainia', name: 'amina', desc: '', args: []);
  }

  /// `alaa helal`
  String get alaa {
    return Intl.message('alaa helal', name: 'alaa', desc: '', args: []);
  }

  /// `sarah sedekah`
  String get sarah {
    return Intl.message('sarah sedekah', name: 'sarah', desc: '', args: []);
  }

  /// `bayan al-kheder`
  String get kheder {
    return Intl.message('bayan al-kheder', name: 'kheder', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
