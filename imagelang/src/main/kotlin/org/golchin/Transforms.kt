package org.golchin

import java.awt.geom.AffineTransform
import java.awt.geom.Rectangle2D
import java.lang.Math.PI

typealias TransformFun = (Image) -> Image

infix fun TransformFun.then(other: TransformFun): TransformFun {
    return { image -> other(this(image)) }
}

fun AffineTransform.toFun(): TransformFun {
    return { image -> Image(image.transformedBounds(this), listOf(image), this) }
}

fun translate(x: Int, y: Int): TransformFun {
    val affineTransform = AffineTransform()
    affineTransform.translate(x.toDouble(), y.toDouble())
    return affineTransform.toFun()
}

fun rotate(x: Int, y: Int, angle: Int): TransformFun {
    val affineTransform = AffineTransform()
    affineTransform.translate(x.toDouble(), y.toDouble())
    affineTransform.rotate(angle.toDouble() * PI / 180)
    affineTransform.translate(-x.toDouble(), -y.toDouble())
    return affineTransform.toFun()
}

fun rotate(angle: Int): TransformFun = { image ->
    rotate(image.bounds.centerX.toInt(), image.bounds.centerY.toInt(), angle)(image)
}

fun rotateBbox(angle: Int) = rotate(angle) then bbox

val bbox: TransformFun = { image ->
    translate(-image.bounds.x.intCeil(), -image.bounds.y.intCeil())(image)
}


fun clip(x: Int, y: Int, width: Int, height: Int): TransformFun {
    return { image ->
        val bounds = Rectangle2D.Double(x.toDouble(), y.toDouble(), width.toDouble(), height.toDouble())
        Image(bounds, image)
    }
}

fun crop(x: Int, y: Int, width: Int, height: Int): TransformFun = clip(x, y, width, height) then bbox

fun lowerHalf(useBbox: Boolean = true): TransformFun = { image ->
    val height = image.bounds.height
    val halfHeight = height / 2
    val afterClip = if (useBbox) bbox else { x -> x }
    val y = image.bounds.y + halfHeight
    val transform = clip(image.bounds.x.toInt(), y.toInt(), image.bounds.width.toInt(), halfHeight.toInt()) then afterClip
    transform(image)
}

fun upperHalf(useBbox: Boolean = true): TransformFun = { image ->
    val height = image.bounds.height
    val halfHeight = height / 2
    val afterClip = if (useBbox) bbox else { x -> x }
    val transform = clip(image.bounds.x.toInt(), image.bounds.y.toInt(), image.bounds.width.toInt(), halfHeight.toInt()) then afterClip
    transform(image)
}



val lowerHalf: TransformFun = lowerHalf()

val lowerHalfClip: TransformFun = lowerHalf(false)