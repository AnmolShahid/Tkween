
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
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
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('hi'),
    Locale('id')
  ];

  /// No description provided for @about_us.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get about_us;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @add_address.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get add_address;

  /// No description provided for @add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get add_to_cart;

  /// No description provided for @added_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Added to Cart'**
  String get added_to_cart;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @already_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an Account?'**
  String get already_have_an_account;

  /// No description provided for @apple_sign_in_clicked.
  ///
  /// In en, this message translates to:
  /// **'Apple Sign in Clicked!'**
  String get apple_sign_in_clicked;

  /// No description provided for @are_you_sure_want_to_quit.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to quit?'**
  String get are_you_sure_want_to_quit;

  /// No description provided for @authenticated_as.
  ///
  /// In en, this message translates to:
  /// **'Authenticated as: '**
  String get authenticated_as;

  /// No description provided for @available_coupon.
  ///
  /// In en, this message translates to:
  /// **'Available Coupon'**
  String get available_coupon;

  /// No description provided for @ebook.
  ///
  /// In en, this message translates to:
  /// **'E-Book'**
  String get ebook;

  /// No description provided for @book.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get book;

  /// No description provided for @bag.
  ///
  /// In en, this message translates to:
  /// **'Bag'**
  String get bag;

  /// No description provided for @blouse.
  ///
  /// In en, this message translates to:
  /// **'Blouse'**
  String get blouse;

  /// No description provided for @boys.
  ///
  /// In en, this message translates to:
  /// **'Boys'**
  String get boys;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @buy_now.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get buy_now;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get change_language;

  /// No description provided for @chat_with_us.
  ///
  /// In en, this message translates to:
  /// **'Chat With Us'**
  String get chat_with_us;

  /// No description provided for @check_your_email.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get check_your_email;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @choose_a_location.
  ///
  /// In en, this message translates to:
  /// **'Choose a location'**
  String get choose_a_location;

  /// No description provided for @choose_the_destination_address.
  ///
  /// In en, this message translates to:
  /// **'Choose the destination address'**
  String get choose_the_destination_address;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @connect_with_apple_id.
  ///
  /// In en, this message translates to:
  /// **'Connect with Apple ID'**
  String get connect_with_apple_id;

  /// No description provided for @connect_with_facebook.
  ///
  /// In en, this message translates to:
  /// **'Connect with Facebook'**
  String get connect_with_facebook;

  /// No description provided for @connect_with_google.
  ///
  /// In en, this message translates to:
  /// **'Connect with Google'**
  String get connect_with_google;

  /// No description provided for @contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact_us;

  /// No description provided for @create_new_password.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get create_new_password;

  /// No description provided for @data_is_too_short.
  ///
  /// In en, this message translates to:
  /// **'Data is too short'**
  String get data_is_too_short;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @delete_on_click.
  ///
  /// In en, this message translates to:
  /// **'Delete on click!'**
  String get delete_on_click;

  /// No description provided for @delivery_method.
  ///
  /// In en, this message translates to:
  /// **'Delivery Method'**
  String get delivery_method;

  /// No description provided for @delivery_status.
  ///
  /// In en, this message translates to:
  /// **'Delivery Status'**
  String get delivery_status;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @detail_address.
  ///
  /// In en, this message translates to:
  /// **'Detail Address'**
  String get detail_address;

  /// No description provided for @detail_profile.
  ///
  /// In en, this message translates to:
  /// **'Detail Profile'**
  String get detail_profile;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @dont_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an Account?'**
  String get dont_have_an_account;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @edit_on_click.
  ///
  /// In en, this message translates to:
  /// **'Edit on click!'**
  String get edit_on_click;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enter_your_promo_code.
  ///
  /// In en, this message translates to:
  /// **'Enter your promo code'**
  String get enter_your_promo_code;

  /// No description provided for @enter_your_registered_email_below_to_receive_password_reset_instruction.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered email below to receive password reset instruction'**
  String get enter_your_registered_email_below_to_receive_password_reset_instruction;

  /// No description provided for @estimated.
  ///
  /// In en, this message translates to:
  /// **'Estimated'**
  String get estimated;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// No description provided for @facebook_sign_in_clicked.
  ///
  /// In en, this message translates to:
  /// **'Facebook Sign in Clicked!'**
  String get facebook_sign_in_clicked;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @find_an_address.
  ///
  /// In en, this message translates to:
  /// **'Find an Address...'**
  String get find_an_address;

  /// No description provided for @flash_sale.
  ///
  /// In en, this message translates to:
  /// **'Flash Sale'**
  String get flash_sale;

  /// No description provided for @flat_shoes.
  ///
  /// In en, this message translates to:
  /// **'Flat Shoes'**
  String get flat_shoes;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @get_popular_fashion_from_home.
  ///
  /// In en, this message translates to:
  /// **'Get popular fashion from home'**
  String get get_popular_fashion_from_home;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @girls.
  ///
  /// In en, this message translates to:
  /// **'Girls'**
  String get girls;

  /// No description provided for @google_sign_in_clicked.
  ///
  /// In en, this message translates to:
  /// **'Google Sign in Clicked!'**
  String get google_sign_in_clicked;

  /// No description provided for @hat.
  ///
  /// In en, this message translates to:
  /// **'Hat'**
  String get hat;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @high_hills.
  ///
  /// In en, this message translates to:
  /// **'High Heels'**
  String get high_hills;

  /// No description provided for @highest_price_to_lowest_price.
  ///
  /// In en, this message translates to:
  /// **'Highest Price to Lowest Price'**
  String get highest_price_to_lowest_price;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @invalid_email_address_format.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address format'**
  String get invalid_email_address_format;

  /// No description provided for @invalid_number_format.
  ///
  /// In en, this message translates to:
  /// **'Invalid Number Format'**
  String get invalid_number_format;

  /// No description provided for @invalid_password_format.
  ///
  /// In en, this message translates to:
  /// **'Password must be more than 6 characters'**
  String get invalid_password_format;

  /// No description provided for @invalid_phone_number_format.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format'**
  String get invalid_phone_number_format;

  /// No description provided for @item_color.
  ///
  /// In en, this message translates to:
  /// **'Item Color'**
  String get item_color;

  /// No description provided for @item_size.
  ///
  /// In en, this message translates to:
  /// **'Item Size'**
  String get item_size;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @jacket.
  ///
  /// In en, this message translates to:
  /// **'Jacket'**
  String get jacket;

  /// No description provided for @jeans.
  ///
  /// In en, this message translates to:
  /// **'Jeans'**
  String get jeans;

  /// No description provided for @kids.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get kids;

  /// No description provided for @light_mode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get light_mode;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get log_out;

  /// No description provided for @looks_like_you_havent_added_any_item_to_your_cart_yet.
  ///
  /// In en, this message translates to:
  /// **'Looks like you haven\'t added any item to your cart yet'**
  String get looks_like_you_havent_added_any_item_to_your_cart_yet;

  /// No description provided for @lowest_price_to_highest_price.
  ///
  /// In en, this message translates to:
  /// **'Lowest Price to Highest Price'**
  String get lowest_price_to_highest_price;

  /// No description provided for @luxury.
  ///
  /// In en, this message translates to:
  /// **'Luxury'**
  String get luxury;

  /// No description provided for @men.
  ///
  /// In en, this message translates to:
  /// **'Men'**
  String get men;

  /// No description provided for @my_coupon.
  ///
  /// In en, this message translates to:
  /// **'My Coupon'**
  String get my_coupon;

  /// No description provided for @my_orders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get my_orders;

  /// No description provided for @newly_listed.
  ///
  /// In en, this message translates to:
  /// **'Newly Listed'**
  String get newly_listed;

  /// No description provided for @not_pay.
  ///
  /// In en, this message translates to:
  /// **'Not Pay'**
  String get not_pay;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @on_boarding_subtitle_1.
  ///
  /// In en, this message translates to:
  /// **'We Have a 100k++ Books. Choose Your desired books from our Book Shop.'**
  String get on_boarding_subtitle_1;

  /// No description provided for @on_boarding_subtitle_2.
  ///
  /// In en, this message translates to:
  /// **'Easy Checkout & Safe Payment method. Trusted by our customers from all over the world.'**
  String get on_boarding_subtitle_2;

  /// No description provided for @on_boarding_subtitle_3.
  ///
  /// In en, this message translates to:
  /// **'To make it easier for you to shop, we provide customer service if you have any questions.'**
  String get on_boarding_subtitle_3;

  /// No description provided for @on_boarding_title_1.
  ///
  /// In en, this message translates to:
  /// **'Great Books App'**
  String get on_boarding_title_1;

  /// No description provided for @on_boarding_title_2.
  ///
  /// In en, this message translates to:
  /// **'Online Payment'**
  String get on_boarding_title_2;

  /// No description provided for @on_boarding_title_3.
  ///
  /// In en, this message translates to:
  /// **'Customer Services'**
  String get on_boarding_title_3;

  /// No description provided for @on_delivery.
  ///
  /// In en, this message translates to:
  /// **'On Delivery'**
  String get on_delivery;

  /// No description provided for @only_characters_are_allowed.
  ///
  /// In en, this message translates to:
  /// **'Only characters are allowed'**
  String get only_characters_are_allowed;

  /// No description provided for @open_camera_tapped.
  ///
  /// In en, this message translates to:
  /// **'Open Camera tapped'**
  String get open_camera_tapped;

  /// No description provided for @open_gallery_tapped.
  ///
  /// In en, this message translates to:
  /// **'Open Gallery tapped'**
  String get open_gallery_tapped;

  /// No description provided for @or_continue_with_email.
  ///
  /// In en, this message translates to:
  /// **'or Continue with Email'**
  String get or_continue_with_email;

  /// No description provided for @or_login_with_email.
  ///
  /// In en, this message translates to:
  /// **'Login with Phone'**
  String get or_login_with_email;

  /// No description provided for @order_detail.
  ///
  /// In en, this message translates to:
  /// **'Order Detail'**
  String get order_detail;

  /// No description provided for @packaging.
  ///
  /// In en, this message translates to:
  /// **'Packaging'**
  String get packaging;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @payment_information.
  ///
  /// In en, this message translates to:
  /// **'Payment Information'**
  String get payment_information;

  /// No description provided for @payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get payment_method;

  /// No description provided for @payment_method_not_selected.
  ///
  /// In en, this message translates to:
  /// **'Payment Method Not Selected'**
  String get payment_method_not_selected;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @please_enter_a_value.
  ///
  /// In en, this message translates to:
  /// **'Please enter a value'**
  String get please_enter_a_value;

  /// No description provided for @please_enter_your_email_address.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address'**
  String get please_enter_your_email_address;

  /// No description provided for @please_enter_your_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get please_enter_your_password;

  /// No description provided for @please_enter_your_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get please_enter_your_phone_number;

  /// No description provided for @please_select_your_item_color.
  ///
  /// In en, this message translates to:
  /// **'Please select your item color'**
  String get please_select_your_item_color;

  /// No description provided for @please_select_your_item_size.
  ///
  /// In en, this message translates to:
  /// **'Please select your item size'**
  String get please_select_your_item_size;

  /// No description provided for @popularity.
  ///
  /// In en, this message translates to:
  /// **'Popularity'**
  String get popularity;

  /// No description provided for @press_again_to_exit.
  ///
  /// In en, this message translates to:
  /// **'Press again to Exit'**
  String get press_again_to_exit;

  /// No description provided for @price_total.
  ///
  /// In en, this message translates to:
  /// **'Price Total'**
  String get price_total;

  /// No description provided for @primary_address.
  ///
  /// In en, this message translates to:
  /// **'Primary Address'**
  String get primary_address;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @product_removed.
  ///
  /// In en, this message translates to:
  /// **'Product Removed'**
  String get product_removed;

  /// No description provided for @products_found.
  ///
  /// In en, this message translates to:
  /// **'Products Found'**
  String get products_found;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @profile_updated.
  ///
  /// In en, this message translates to:
  /// **'Profile Updated'**
  String get profile_updated;

  /// No description provided for @qty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get qty;

  /// No description provided for @read_more.
  ///
  /// In en, this message translates to:
  /// **'read more'**
  String get read_more;

  /// No description provided for @recent_transaction.
  ///
  /// In en, this message translates to:
  /// **'Recent Transaction'**
  String get recent_transaction;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @sandal.
  ///
  /// In en, this message translates to:
  /// **'Sandal'**
  String get sandal;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @search_anything_you_like.
  ///
  /// In en, this message translates to:
  /// **'Search anything you like'**
  String get search_anything_you_like;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get see_all;

  /// No description provided for @see_my_orders.
  ///
  /// In en, this message translates to:
  /// **'See My Orders'**
  String get see_my_orders;

  /// No description provided for @select_as_primary_address.
  ///
  /// In en, this message translates to:
  /// **'Select as Primary Address'**
  String get select_as_primary_address;

  /// No description provided for @select_as_primary_address_on_click.
  ///
  /// In en, this message translates to:
  /// **'Choose as Primary Address on click!'**
  String get select_as_primary_address_on_click;

  /// No description provided for @select_brand.
  ///
  /// In en, this message translates to:
  /// **'Select Brand'**
  String get select_brand;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @shipping_code.
  ///
  /// In en, this message translates to:
  /// **'Shipping Code'**
  String get shipping_code;

  /// No description provided for @shipping_fee.
  ///
  /// In en, this message translates to:
  /// **'Shipping Fee'**
  String get shipping_fee;

  /// No description provided for @shirt.
  ///
  /// In en, this message translates to:
  /// **'Shirt'**
  String get shirt;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// No description provided for @shopping_again.
  ///
  /// In en, this message translates to:
  /// **'Shopping Again'**
  String get shopping_again;

  /// No description provided for @shopping_bag_is_empty.
  ///
  /// In en, this message translates to:
  /// **'Shopping Bag is Empty'**
  String get shopping_bag_is_empty;

  /// No description provided for @shopping_date.
  ///
  /// In en, this message translates to:
  /// **'Shopping Date'**
  String get shopping_date;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @show_less.
  ///
  /// In en, this message translates to:
  /// **'show less'**
  String get show_less;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @singlet.
  ///
  /// In en, this message translates to:
  /// **'Singlet'**
  String get singlet;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @skirt.
  ///
  /// In en, this message translates to:
  /// **'Skirt'**
  String get skirt;

  /// No description provided for @sneaker.
  ///
  /// In en, this message translates to:
  /// **'Sneaker'**
  String get sneaker;

  /// No description provided for @socks.
  ///
  /// In en, this message translates to:
  /// **'Socks'**
  String get socks;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @sort_by.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sort_by;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get success;

  /// No description provided for @suit.
  ///
  /// In en, this message translates to:
  /// **'Suit'**
  String get suit;

  /// No description provided for @top_of_the_week.
  ///
  /// In en, this message translates to:
  /// **'Top of the week'**
  String get top_of_the_week;

  /// No description provided for @top_up.
  ///
  /// In en, this message translates to:
  /// **'Top Up'**
  String get top_up;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @total_payment.
  ///
  /// In en, this message translates to:
  /// **'Total Payment'**
  String get total_payment;

  /// No description provided for @tracking_order.
  ///
  /// In en, this message translates to:
  /// **'Tracking Order'**
  String get tracking_order;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @trendias_Shop.
  ///
  /// In en, this message translates to:
  /// **'Trendias Shop'**
  String get trendias_Shop;

  /// No description provided for @tshirt.
  ///
  /// In en, this message translates to:
  /// **'T-Shirt'**
  String get tshirt;

  /// No description provided for @use.
  ///
  /// In en, this message translates to:
  /// **'Use'**
  String get use;

  /// No description provided for @used.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get used;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get username;

  /// No description provided for @valid_until.
  ///
  /// In en, this message translates to:
  /// **'Valid Until:'**
  String get valid_until;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @watch.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get watch;

  /// No description provided for @we_have_sent_a_password_recovery_instruction_to_your_email.
  ///
  /// In en, this message translates to:
  /// **'We have sent a password recovery instruction to your email'**
  String get we_have_sent_a_password_recovery_instruction_to_your_email;

  /// No description provided for @women.
  ///
  /// In en, this message translates to:
  /// **'Women'**
  String get women;

  /// No description provided for @write_a_message.
  ///
  /// In en, this message translates to:
  /// **'Write a Message'**
  String get write_a_message;

  /// No description provided for @your_new_password_must_be_different_from_previously_used_passwords.
  ///
  /// In en, this message translates to:
  /// **'Your new password must be different from previously used passwords.'**
  String get your_new_password_must_be_different_from_previously_used_passwords;

  /// No description provided for @your_order_will_be_delivered_soon_thank_you_for_shopping.
  ///
  /// In en, this message translates to:
  /// **'Your order will be delivered soon.\nThank you for shopping!'**
  String get your_order_will_be_delivered_soon_thank_you_for_shopping;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'hi', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
    case 'id': return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
