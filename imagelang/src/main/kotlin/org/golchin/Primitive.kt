package org.golchin

import java.awt.Color
import java.awt.Graphics2D
import java.awt.geom.AffineTransform
import java.awt.geom.Rectangle2D
import java.awt.image.BufferedImage
import java.io.File
import javax.imageio.ImageIO

abstract class Primitive(width: Int, height: Int) : Image(Rectangle2D.Double(0.0, 0.0, width.toDouble(), height.toDouble()))

abstract class Shape(width: Int, height: Int) : Primitive(width, height)

open class Rectangle(
    val width: Int,
    val height: Int,
    val color: Color = Color.BLACK,
    val isFilled: Boolean = true
) : Shape(width, height) {
    override fun draw(graphics: Graphics2D, transform: AffineTransform) {
        if (isFilled) {
            graphics.color = color
            graphics.fillRect(0, 0, width, height)
        } else {
            graphics.drawRect(0, 0, width, height)
        }
    }
}

class Square(size: Int, color: Color = Color.BLACK, isFilled: Boolean = true) : Rectangle(size, size, color, isFilled)

class FileImage(private val image: BufferedImage) : Primitive(image.width, image.height) {
    constructor(fileName: String) : this(ImageIO.read(File(fileName)))

    override fun draw(graphics: Graphics2D, transform: AffineTransform) {
        graphics.drawImage(image, 0, 0, image.width, image.height, null)
    }
}