import 'package:get/get.dart';
import 'package:shop_ease/features/authentication/screens/login/login.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shop_ease/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shop_ease/features/authentication/screens/signup/signup.dart';
import 'package:shop_ease/features/authentication/screens/signup/verify_email.dart';
import 'package:shop_ease/features/personalization/screens/address/address.dart';
import 'package:shop_ease/features/personalization/screens/profile/profile.dart';
import 'package:shop_ease/features/personalization/screens/settings/settings.dart';
import 'package:shop_ease/features/shop/models/categories_model.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/features/shop/screens/all_products/all_products.dart';
import 'package:shop_ease/features/shop/screens/brands/all_brands.dart';
import 'package:shop_ease/features/shop/screens/cart/cart.dart';
import 'package:shop_ease/features/shop/screens/checkout/checkout.dart';
import 'package:shop_ease/features/shop/screens/home/home.dart';
import 'package:shop_ease/features/shop/screens/order/order.dart';
import 'package:shop_ease/features/shop/screens/product_detail/product_detail.dart';
import 'package:shop_ease/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:shop_ease/features/shop/screens/store/store.dart';
import 'package:shop_ease/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:shop_ease/features/shop/screens/wishlist/wishlist.dart';
import 'package:shop_ease/routes/routes.dart';


class AppRoutes {
  static final pages = [
    GetPage(name: ERoutes.home, page: () => HomeScreen()),
    GetPage(name: ERoutes.store, page: () => StoreScreen()),
    GetPage(name: ERoutes.favorites, page: () => FavoriteScreen()),
    GetPage(name: ERoutes.settings, page: () => SettingScreen()),
    GetPage(name: ERoutes.subCategories, page: () => SubCategoriesScreen(categoryModel:CategoryModel.empty())),
    GetPage(name: ERoutes.productReview, page: () => ProductReviewsScreen()),
    GetPage(name: ERoutes.productDetail, page: () => ProductDetailScreen(productModel: ProductModel.empty())),
    GetPage(name: ERoutes.order, page: () => OrderScreen()),
    GetPage(name: ERoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: ERoutes.cart, page: () => CartScreen()),
    GetPage(name: ERoutes.brand, page: () => AllBrandsScreen()),
    GetPage(name: ERoutes.allProducts, page: () => AllProductsScreen(title: '',)),
    GetPage(name: ERoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: ERoutes.userAddress, page: () => UserAddressScreen()),
    GetPage(name: ERoutes.signUp, page: () => SignupScreen()),
    GetPage(name: ERoutes.verifyEmail, page: () => VerifyEmailScreen()),
    GetPage(name: ERoutes.signIn, page: () => LoginScreen()),
    GetPage(name: ERoutes.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: ERoutes.onboarding, page: () => OnBoardingScreen()),
  ];
}
