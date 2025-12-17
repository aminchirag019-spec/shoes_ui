enum RouterName {
  splashScreen('/SplashScreen', 'SplashScreen'),
  sliderScreen('/SliderScreen', 'SliderScreen'),
  loginScreen('/LoginScreen', 'LoginScreen'),
  signupScreen('/SignupScreen', 'SignupScreen'),
  forgotPassScreen('/ForgotPassScreen', 'ForgotPassScreen'),

  // Shell Route Screens
  homeScreen('/HomeScreen', 'HomeScreen'),
  favouriteScreen('/FavouriteScreen', 'FavouriteScreen'),
  notificationScreen('/NotificationScreen', 'NotificationScreen'),
  profileScreen('/ProfileScreen', 'ProfileScreen'),

  // Other Screens
  detailsScreen('/DetailsScreen', 'DetailsScreen'),
  mycartScreen('/MycartScreen', 'MycartScreen'),
  checkoutScreen('/CheckoutScreen', 'CheckoutScreen'),
  paymentCheckoutScreen('/PaymentCheckoutScreen', 'PaymentCheckoutScreen'),
  bestSellerScreen('/BestSellerScreen', 'BestSellerScreen'),
  accountSettingScreen('/AccountSettingScreen', 'AccountSettingScreen'),
  searchScreen('/SearchScreen', 'SearchScreen');

  final String path;
  final String name;

  const RouterName(this.path, this.name);
}
