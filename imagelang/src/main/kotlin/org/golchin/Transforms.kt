package org.golchin

import java.awt.geom.AffineTransform
import java.awt.geom.Rectangle2D
import java.lang.Math.PI

typealias TransformFun = (Image) -> Image

infix fun TransformFun.then(other: TransformFun): TransformFun = { image -> other(this(image)) }

fun AffineTransform.toFun(): TransformFun = { image -> Image(image.transformedBounds(this), listOf(image), this) }

fun transform(block: AffineTransform.() -> Unit): TransformFun = AffineTransform().apply(block).toFun()

fun translate(x: Double = 0.0, y: Double = 0.0): TransformFun = transform {
    translate(x, y)
}

fun rotate(x: Double, y: Double, angle: Double): TransformFun = transform {
    translate(x, y)
    rotate(angle * PI / 180)
    translate(-x, -y)
}

fun rotate(angle: Double): TransformFun = { image ->
    rotate(image.bounds.centerX, image.bounds.centerY, angle)(image)
}

fun rotateBbox(angle: Double) = rotate(angle) then bbox

val bbox: TransformFun = { image ->
    translate(-image.bounds.x, -image.bounds.y)(image)
}

fun shearX(shearX: Double = 0.0) = transform {
    shear(shearX, 0.0)
}

fun shearY(shearY: Double = 0.0) = transform {
    shear(0.0, shearY)
}

fun scale(scaleX: Double = 1.0, scaleY: Double = 1.0): TransformFun = transform {
    scale(scaleX, scaleY)
}

val verticalMirror: TransformFun = { image ->
    val transformFun = scale(-1.0) then translate(image.bounds.width)
    transformFun(image)
}

val horizontalMirror: TransformFun = { image ->
    val transformFun = scale(scaleY = -1.0) then translate(y = image.bounds.height)
    transformFun(image)
}

fun clip(x: Double, y: Double, width: Double, height: Double): TransformFun = { image ->
    val bounds = Rectangle2D.Double(x, y, width, height)
    Image(bounds, image)
}

fun crop(x: Double, y: Double, width: Double, height: Double): TransformFun = clip(x, y, width, height) then bbox

fun clipOrCrop(x: Double, y: Double, width: Double, height: Double, useCrop: Boolean): TransformFun = { image ->
    val transformFun = if (useCrop) crop(x, y, width, height) else clip(x, y, width, height)
    transformFun(image)
}

fun lowerHalf(useCrop: Boolean = true): TransformFun = { image ->
    val height = image.bounds.height
    val y = image.bounds.y + height / 2
    clipOrCrop(image.bounds.x, y, image.bounds.width, height / 2, useCrop)(image)
}

fun upperHalf(useCrop: Boolean = true): TransformFun = { image ->
    val height = image.bounds.height
    clipOrCrop(image.bounds.x, image.bounds.y, image.bounds.width, height / 2, useCrop)(image)
}

val lowerHalf: TransformFun = lowerHalf()

val lowerHalfClip: TransformFun = lowerHalf(false)

fun center(useCrop: Boolean = true): TransformFun = { image ->
    val centerX = image.bounds.centerX
    val centerY = image.bounds.centerY
    val halfWidth = image.bounds.width / 4
    val halfHeight = image.bounds.height / 4
    val transform = clipOrCrop(centerX - halfWidth, centerY - halfHeight, 2 * halfWidth, 2 * halfHeight, useCrop)
    transform(image)
}

fun repeatOp(binOp: (Image, Image) -> Image, times: Int): TransformFun = { image ->
    if (times >= 1)
        reduce(binOp, image, generateSequence { image }.take(times - 1))
    else
        Image(listOf())
}

fun repeat(times: Int) = repeatOp(Image::besides, times)

fun verticalRepeat(times: Int) = repeatOp(Image::above, times)

fun grid(w: Int, h: Int) = repeat(w) then verticalRepeat(h)