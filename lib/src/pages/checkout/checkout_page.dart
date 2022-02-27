
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tkween/src/helpers/colors.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/helpers/screens.dart';
import 'package:tkween/src/helpers/snack_toast.dart';
import 'package:tkween/src/list_data/address_list.dart';
import 'package:tkween/src/list_data/coupon_list.dart';
import 'package:tkween/src/list_data/payment_list.dart';
import 'package:tkween/src/list_data/shipping_list.dart';
import 'package:tkween/src/models/checkout_model.dart';
import 'package:tkween/src/providers/cart_provider.dart';
import 'package:tkween/src/providers/checkout_provider.dart';
import 'package:tkween/src/widgets/address_card.dart';
import 'package:tkween/src/widgets/checkout_product_card.dart';
import 'package:tkween/src/widgets/custom_app_bar.dart';
import 'package:tkween/src/widgets/custom_elevated_button.dart';
import 'package:tkween/src/widgets/custom_loading_indicator.dart';
import 'package:tkween/src/widgets/custom_text_button.dart';
import 'package:tkween/src/widgets/empty_section.dart';


part 'screens/checkout_screen.dart';
part 'screens/checkout_success_screen.dart';
part 'widgets/build_address.dart';
part 'widgets/build_delivery_method.dart';
part 'widgets/build_label_section.dart';
part 'widgets/build_payment_method.dart';
part 'widgets/build_price_detail.dart';
part 'widgets/build_product.dart';
part 'widgets/footer_section.dart';
