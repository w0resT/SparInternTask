// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Очистить корзину
  internal static let cartClear = L10n.tr("Localizable", "CART_CLEAR", fallback: "Очистить корзину")
  /// Перейти в каталог
  internal static let cartLinkToCatalog = L10n.tr("Localizable", "CART_LINK_TO_CATALOG", fallback: "Перейти в каталог")
  /// Состав заказа
  internal static let cartOrderComposition = L10n.tr("Localizable", "CART_ORDER_COMPOSITION", fallback: "Состав заказа")
  /// Ваша корзина пуста, выберите товар в каталоге, чтобы оформить заказ
  internal static let cartOrderEmpty = L10n.tr("Localizable", "CART_ORDER_EMPTY", fallback: "Ваша корзина пуста, выберите товар в каталоге, чтобы оформить заказ")
  /// Корзина
  internal static let mainCartTitle = L10n.tr("Localizable", "MAIN_CART_TITLE", fallback: "Корзина")
  /// Каталог
  internal static let mainCatalogTitle = L10n.tr("Localizable", "MAIN_CATALOG_TITLE", fallback: "Каталог")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
