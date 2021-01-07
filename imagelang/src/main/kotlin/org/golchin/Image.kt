package org.golchin

import java.awt.Graphics2D
import java.awt.RenderingHints
import java.awt.geom.AffineTransform
import java.awt.geom.Area
import java.awt.geom.Rectangle2D
import java.awt.image.BufferedImage
import java.io.File
import javax.imageio.ImageIO
import kotlin.math.ceil

open class Image(
    private val bounds: java.awt.Shape,
    internal val bbox: Rectangle2D,
    private val children: Collection<Image>,
    private val transform: AffineTransform
) {
    constructor(bounds: java.awt.Shape, children: Collection<Image>, affineTransform: AffineTransform) : this(bounds, bounds.bounds2D, children, affineTransform)
    constructor(children: Collection<Image>, affineTransform: AffineTransform) : this(calculateBounds(children), children, affineTransform)
    constructor(children: Collection<Image>) : this(children, IDENTITY_TRANSFORM)
    constructor(bounds: java.awt.Shape, child: Image) : this(bounds, listOf(child), IDENTITY_TRANSFORM)
    constructor(bounds: java.awt.Shape) : this(bounds, listOf(), IDENTITY_TRANSFORM)

    fun transformedBounds(transform: AffineTransform): Rectangle2D =
        transform.createTransformedShape(bounds).bounds2D

    infix fun drawInto(file: String) {
        val width = ceil(bbox.maxX).toInt()
        val height = ceil(bbox.maxY).toInt()
        if (width > 0 && height > 0) {
            val image = BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR)
            val graphics = image.createGraphics()
            graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON)
            draw(graphics, transform)
            ImageIO.write(image, getFormatName(file), File(file))
            graphics.dispose()
        }
    }

    private fun getFormatName(file: String): String {
        val lastDotIndex = file.lastIndexOf('.')
        if (lastDotIndex < 0) return "png"
        return file.substring(lastDotIndex + 1)
    }

    protected open fun draw(graphics: Graphics2D, transform: AffineTransform) {
        graphics.clip(bbox)
        graphics.transform = transform
        val curClip = graphics.clip
        for (child in children) {
            graphics.transform = transform
            graphics.clip = curClip
            val childTransform = AffineTransform(transform)
            childTransform.concatenate(child.transform)
            child.draw(graphics, childTransform)
        }
    }

    infix fun besides(image: Image) : Image {
        val translate = translate(bbox.maxX)
        return Image(listOf(this, translate(image)))
    }

    infix fun above(image: Image) : Image {
        val translate = translate(y = bbox.maxY)
        return Image(listOf(this, translate(image)))
    }

    infix fun behind(image: Image): Image = Image(listOf(this, image))

    companion object {
        private val IDENTITY_TRANSFORM = AffineTransform()

        private fun calculateBounds(children: Collection<Image>): java.awt.Shape {
            val area = Area()
            return children.fold(area) { acc: Area, image: Image ->
                acc.add(Area(image.bounds.bounds2D))
                acc
            }
        }
    }
}

fun reduce(binOp: (Image, Image) -> Image, image: Image, images: Sequence<Image>) = images.fold(image, binOp)