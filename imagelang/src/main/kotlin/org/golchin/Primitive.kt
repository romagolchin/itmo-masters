package org.golchin

import java.awt.Color
import java.awt.Graphics2D
import java.awt.Polygon
import java.awt.geom.AffineTransform
import java.awt.geom.Point2D
import java.awt.geom.Rectangle2D
import java.awt.image.BufferedImage
import java.io.File
import javax.imageio.ImageIO

abstract class Primitive(width: Int, height: Int) : Image(Rectangle2D.Double(0.0, 0.0, width.toDouble(), height.toDouble()))

abstract class Shape(width: Int, height: Int, val color: Color, val isFilled: Boolean = true) : Primitive(width, height)

open class Rectangle(
    private val width: Int,
    private val height: Int,
    color: Color = Color.BLACK,
    isFilled: Boolean = true
) : Shape(width, height, color, isFilled) {
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

class Triangle(private val leg: Int, color: Color = Color.BLACK, isFilled: Boolean = true) : Shape(leg, leg, color, isFilled) {
    override fun draw(graphics: Graphics2D, transform: AffineTransform) {
        val xs = intArrayOf(0, 0, leg)
        val ys = intArrayOf(leg, 0, 0)
        val polygon = Polygon(xs, ys, 3)
        graphics.color = color
        if (isFilled) {
            graphics.drawPolygon(polygon)
        } else {
            graphics.fillPolygon(polygon)
        }
    }
}

class FileImage(private val image: BufferedImage) : Primitive(image.width, image.height) {
    constructor(fileName: String) : this(ImageIO.read(File(fileName)))

    override fun draw(graphics: Graphics2D, transform: AffineTransform) {
        graphics.drawImage(image, 0, 0, image.width, image.height, null)
    }
}