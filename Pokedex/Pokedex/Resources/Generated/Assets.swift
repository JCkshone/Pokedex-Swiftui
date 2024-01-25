// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum PokedexResources {
  public enum Assets {
    public enum Common {
      public static let ach = ImageAsset(name: "Common/ach")
      public static let pokedex = ImageAsset(name: "Common/pokedex")
      public static let pokemonLogo = ImageAsset(name: "Common/pokemonLogo")
    }
    public enum Pokedex {
      public static let noData = ImageAsset(name: "Pokedex/no-data")
      public static let pokeball = ImageAsset(name: "Pokedex/pokeball")
    }
    public enum Types {
      public static let bugClear = ImageAsset(name: "Types/bug-clear")
      public static let bug = ImageAsset(name: "Types/bug")
      public static let darkClear = ImageAsset(name: "Types/dark-clear")
      public static let dark = ImageAsset(name: "Types/dark")
      public static let dragonClear = ImageAsset(name: "Types/dragon-clear")
      public static let dragon = ImageAsset(name: "Types/dragon")
      public static let electricClear = ImageAsset(name: "Types/electric-clear")
      public static let electric = ImageAsset(name: "Types/electric")
      public static let fairyClear = ImageAsset(name: "Types/fairy-clear")
      public static let fairy = ImageAsset(name: "Types/fairy")
      public static let fightingClear = ImageAsset(name: "Types/fighting-clear")
      public static let fighting = ImageAsset(name: "Types/fighting")
      public static let fireClear = ImageAsset(name: "Types/fire-clear")
      public static let fire = ImageAsset(name: "Types/fire")
      public static let flyingClear = ImageAsset(name: "Types/flying-clear")
      public static let flying = ImageAsset(name: "Types/flying")
      public static let ghostClear = ImageAsset(name: "Types/ghost-clear")
      public static let ghost = ImageAsset(name: "Types/ghost")
      public static let grassClear = ImageAsset(name: "Types/grass-clear")
      public static let grass = ImageAsset(name: "Types/grass")
      public static let groundClear = ImageAsset(name: "Types/ground-clear")
      public static let ground = ImageAsset(name: "Types/ground")
      public static let iceClear = ImageAsset(name: "Types/ice-clear")
      public static let ice = ImageAsset(name: "Types/ice")
      public static let normalClear = ImageAsset(name: "Types/normal-clear")
      public static let normal = ImageAsset(name: "Types/normal")
      public static let poisonClear = ImageAsset(name: "Types/poison-clear")
      public static let poison = ImageAsset(name: "Types/poison")
      public static let psychicClear = ImageAsset(name: "Types/psychic-clear")
      public static let psychic = ImageAsset(name: "Types/psychic")
      public static let rockClear = ImageAsset(name: "Types/rock-clear")
      public static let rock = ImageAsset(name: "Types/rock")
      public static let steelClear = ImageAsset(name: "Types/steel-clear")
      public static let steel = ImageAsset(name: "Types/steel")
      public static let waterClear = ImageAsset(name: "Types/water-clear")
      public static let water = ImageAsset(name: "Types/water")
    }

    // swiftlint:disable trailing_comma
    @available(*, deprecated, message: "All values properties are now deprecated")
    public static let allImages: [ImageAsset] = [
      Common.ach,
      Common.pokedex,
      Common.pokemonLogo,
      Pokedex.noData,
      Pokedex.pokeball,
      Types.bugClear,
      Types.bug,
      Types.darkClear,
      Types.dark,
      Types.dragonClear,
      Types.dragon,
      Types.electricClear,
      Types.electric,
      Types.fairyClear,
      Types.fairy,
      Types.fightingClear,
      Types.fighting,
      Types.fireClear,
      Types.fire,
      Types.flyingClear,
      Types.flying,
      Types.ghostClear,
      Types.ghost,
      Types.grassClear,
      Types.grass,
      Types.groundClear,
      Types.ground,
      Types.iceClear,
      Types.ice,
      Types.normalClear,
      Types.normal,
      Types.poisonClear,
      Types.poison,
      Types.psychicClear,
      Types.psychic,
      Types.rockClear,
      Types.rock,
      Types.steelClear,
      Types.steel,
      Types.waterClear,
      Types.water,
    ]
    // swiftlint:enable trailing_comma
  }
  public enum Colors {
    public enum Types {
      public static let bug = ColorAsset(name: "Types/Bug")
      public static let dark = ColorAsset(name: "Types/Dark")
      public static let dragon = ColorAsset(name: "Types/Dragon")
      public static let electric = ColorAsset(name: "Types/Electric")
      public static let fairy = ColorAsset(name: "Types/Fairy")
      public static let fighting = ColorAsset(name: "Types/Fighting")
      public static let fire = ColorAsset(name: "Types/Fire")
      public static let flying = ColorAsset(name: "Types/Flying")
      public static let ghost = ColorAsset(name: "Types/Ghost")
      public static let grass = ColorAsset(name: "Types/Grass")
      public static let ground = ColorAsset(name: "Types/Ground")
      public static let ice = ColorAsset(name: "Types/Ice")
      public static let normal = ColorAsset(name: "Types/Normal")
      public static let poison = ColorAsset(name: "Types/Poison")
      public static let psychic = ColorAsset(name: "Types/Psychic")
      public static let rock = ColorAsset(name: "Types/Rock")
      public static let steel = ColorAsset(name: "Types/Steel")
      public static let water = ColorAsset(name: "Types/Water")
    }

    // swiftlint:disable trailing_comma
    @available(*, deprecated, message: "All values properties are now deprecated")
    public static let allColors: [ColorAsset] = [
      Types.bug,
      Types.dark,
      Types.dragon,
      Types.electric,
      Types.fairy,
      Types.fighting,
      Types.fire,
      Types.flying,
      Types.ghost,
      Types.grass,
      Types.ground,
      Types.ice,
      Types.normal,
      Types.poison,
      Types.psychic,
      Types.rock,
      Types.steel,
      Types.water,
    ]
    // swiftlint:enable trailing_comma
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

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
