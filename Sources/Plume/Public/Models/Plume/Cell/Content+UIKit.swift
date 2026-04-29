#if canImport(UIKit)
import UIKit

extension Plume.Cell.Contents {
    /// Creates particle contents from a UIKit image.
    ///
    /// - Parameter uiimage: The image used to render the particle.
    internal init(uiimage: UIImage) {
        self.image = uiimage.cgImage
    }

    /// Creates particle contents from an asset catalog image resource.
    ///
    /// - Parameter resource: The image resource used to render the particle.
    @available(iOS 17.0, *)
    internal init(resource: ImageResource) {
        self.image = UIImage(resource: resource).cgImage
    }
}
#endif
