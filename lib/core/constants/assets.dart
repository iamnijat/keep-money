abstract class AppAssets {
  const AppAssets._();

  /// Images
  static const personalInfoThumbnail = 'assets/images/personal_info.svg';
  static const errorImage = 'assets/images/error.svg';
  static const introImage = 'assets/images/intro_image.svg';
  static const noTransactionImage = 'assets/images/no_transaction.svg';

  /// Icons
  static const dateIcon = 'assets/icons/birth_picker.svg';
  static const whiteDoneIcon = 'assets/icons/white_check_icon.svg';
  static const splashLogo = 'assets/icons/logo.png';

  // Transaction Types
  static const homeType = 'assets/icons/transaction_types/home.png';

  /// Asset Helper For Transaction Type
  static transactionImage(String type) =>
      'assets/icons/transaction_types/$type.png';

  /// Asset Helper For Avatar Image
  static avatarImage(String gender) => 'assets/icons/avatars/$gender.svg';
}
