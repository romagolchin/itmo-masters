package org.golchin

import java.awt.Graphics2D
import java.awt.geom.AffineTransform
import java.awt.geom.Rectangle2D
import java.awt.image.BufferedImage
import java.io.File
import javax.imageio.ImageIO
import kotlin.math.ceil

open class Image(
    internal val bounds: Rectangle2D,
    private val children: Collection<Image>,
    private val transform: AffineTransform
) {
    constructor(children: Collection<Image>, affineTransform: AffineTransform) : this(calculateBounds(children), children, affineTransform)
    constructor(children: Collection<Image>) : this(children, IDENTITY_TRANSFORM)
    constructor(bounds: Rectangle2D, child: Image) : this(bounds, listOf(child), IDENTITY_TRANSFORM)
    constructor(bounds: Rectangle2D) : this(bounds, listOf(), IDENTITY_TRANSFORM)

    fun transformedBounds(transform: AffineTransform): Rectangle2D =
        transform.createTransformedShape(bounds).bounds2D

    infix fun drawInto(file: String) {
        val width = bounds.maxX.intCeil()
        val height = bounds.maxY.intCeil()
        val image = BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR)
        val graphics = image.createGraphics()
        draw(graphics, transform)
        ImageIO.write(image, getExtension(file), File(file))
        graphics.dispose()
    }

    private fun getExtension(file: String): String {
        val lastDotIndex = file.lastIndexOf('.')
        if (lastDotIndex < 0) return ""
        return file.substring(lastDotIndex + 1)
    }

    protected open fun draw(graphics: Graphics2D, transform: AffineTransform, ) {
        graphics.clip(bounds)
        val curClip = graphics.clip
        children.forEach { child ->
            graphics.transform = transform
            val childTransform = AffineTransform(transform)
            childTransform.concatenate(child.transform)
            child.draw(graphics, childTransform)
            graphics.clip = curClip
        }
    }

    infix fun besides(image: Image) : Image {
        val translate = translate(bounds.maxX.intCeil(), 0)
        return Image(listOf(this, translate(image)))
    }

    companion object {
        internal val IDENTITY_TRANSFORM = AffineTransform()

        private fun calculateBounds(children: Collection<Image>): Rectangle2D {
            var maxX = 0.0
            var maxY = 0.0
            for (child in children) {
                val childMaxX = child.bounds.maxX
                val childMaxY = child.bounds.maxY
                if (childMaxX > maxX) maxX = childMaxX
                if (childMaxY > maxY) maxY = childMaxY
            }
            return Rectangle2D.Double(0.0, 0.0, maxX, maxY)
        }
    }
}

internal fun Double.intCeil() = ceil(this).toInt()

fun main() {
    val penguin = FileImage("penguin.jpg")
    val penguins = penguin besides penguin
//    penguins drawInto "2penguins.jpg"
//    penguins drawInto "2penguins.png"
//    val transform = lowerHalf then rotateBbox(90)
//    transform(penguin) drawInto "lower_penguin_rotate_bbox.jpg"
//    (lowerHalf then rotate(90))(penguin) drawInto "lower_penguin_rotate.jpg"
//    lowerHalfClip(penguins) drawInto "lower_half_penguins.png"
//    lowerHalfClip(lowerHalfClip(penguins)) drawInto "lower_half_penguins.png"
    lowerHalfClip(rotate(90)(penguin)) besides upperHalf(false)(penguin) drawInto "lower_and_upper.png"
}