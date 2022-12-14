import CompositeImageAsset
import UniqueIdentifierProvider

/// Represents one texture atlas within a game editor's asset library.
///
/// On the editor, a texture atlas is simply a named collection of individual images that can be
/// assigned to sprites. No actual texture packing or subregion coordinate calculation takes place
/// until the asset is exported for runtime (game) use. Likewise, in-editor preview of sprites
/// textured with the atlas is done by assigning the individual image whole; no "shared texture"
/// exists yet and no texture coordinate mapping takes place.
public final class TextureAtlasAsset: CompositeImageAsset {

  public typealias Options = TextureAtlasOptions

  /// Creates a new texture atlas from an array of image asset identifiers.
  ///
  /// Throws if a unique ID cannot be obtained for the new instance (virtually impossible barring
  /// a bug in the unique identifier logic or its dependencies).
  public init(dependencies: [String], identifierProvider: UniqueIdentifierProvider, options: TextureAtlasOptions) throws {
    self.name = options.name
    self.scaleFactor = options.scaleFactor
    self.dependencies = dependencies
    self.identifier = try identifierProvider.newIdentifier()
  }

  /// The unique IDs of the image assets that act as sources for the atlas's submiages. Images can
  /// be added and removed at will during editing; texture packing and generation of subimage
  /// texture coordinates does not take place until the atlas is exported into a runtime (game)
  /// format.
  public var dependencies: [String]

  /// The user-facing name of the atlas in the library. Can be changed at will, and is lost when
  /// exporting the atlas into a runtime (game) format.
  public var name: String

  /// The unique identifier assigned to the atlas on creation. Immutable. Uniquely identifies the
  /// atlas both during editing as well as at runtime (game execution).
  public let identifier: String

  /// The assumed scale factor (mapping factor between screen points ad source image pixels) for all
  /// images that make up the atlas. Immutable.
  public let scaleFactor: Float
}

// MARK: - Supporting Types

/// Groups the intialization options for a texture atlas.
public struct TextureAtlasOptions: CompositeImageAssetOptions {

  public let name: String

  public let scaleFactor: Float

  public init(name: String, scaleFactor: Float) {
    self.name = name
    self.scaleFactor = scaleFactor
  }
}
