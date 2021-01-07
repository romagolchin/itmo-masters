package org.golchin

import java.awt.Color
import java.awt.Color.WHITE
import java.awt.Graphics2D
import java.awt.geom.*
import java.awt.image.BufferedImage
import java.io.File
import javax.imageio.ImageIO
import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin
import kotlin.math.tan

private fun createRectangle(width: Double, height: Double) = Rectangle2D.Double(0.0, 0.0, width, height)

abstract class Primitive(bounds: java.awt.Shape) : Image(bounds) {
    constructor(width: Double, height: Double) : this(createRectangle(width, height))
}

abstract class Shape(
    private val shape: java.awt.Shape,
    bounds: java.awt.Shape,
    private val color: Color,
    private val isFilled: Boolean = true
) : Primitive(bounds) {
    constructor(shape: java.awt.Shape, color: Color, isFilled: Boolean = true) :
            this(shape, shape, color, isFilled)

    override fun draw(graphics: Graphics2D, transform: AffineTransform) {
        graphics.color = color
        if (isFilled) {
            graphics.fill(shape)
        } else {
            graphics.draw(shape)
        }
    }
}

class Circle(radius: Double, color: Color = WHITE, isFilled: Boolean = true) :
    Shape(Ellipse2D.Double(0.0, 0.0, 2 * radius, 2 * radius), color, isFilled)

class Line(x0: Double, y0: Double, x1: Double, y1: Double, color: Color = WHITE) :
    Shape(Line2D.Double(x0, y0, x1, y1), color, false) {
    constructor(x: Double, y: Double, color: Color = WHITE) : this(0.0, 0.0, x, y, color)
}

open class Rectangle(
    width: Double,
    height: Double,
    color: Color = WHITE,
    isFilled: Boolean = true
) : Shape(createRectangle(width, height), color, isFilled)

class Square(size: Double, color: Color = WHITE, isFilled: Boolean = true) : Rectangle(size, size, color, isFilled)

open class Polygon(color: Color = WHITE, isFilled: Boolean = true, polygon: Path2D) : Shape(polygon, color, isFilled) {
    constructor(color: Color = WHITE, isFilled: Boolean = true, vararg points: Pair<Double, Double>) :
            this(color, isFilled, createPolygon(*points))
}

fun createPolygon(vararg points: Pair<Double, Double>): Path2D {
    require(points.size >= 3) { "At least 3 points required for polygon" }
    val path = Path2D.Double()
    path.moveTo(points[0].first, points[0].second)
    for (i in 1 until points.size) {
        path.lineTo(points[i].first, points[i].second)
    }
    path.closePath()
    return path
}

class Triangle(leg: Double, color: Color = WHITE, isFilled: Boolean = true) :
    org.golchin.Polygon(color, isFilled, 0.0 to leg, 0.0 to 0.0, leg to 0.0)

fun createStar(size: Double): Path2D {
    val cathetus = size * cos(2 * PI / 5)
    val distance = cathetus * tan(3 * PI / 10)
    val firstInternalPoint: Point2D = Point2D.Double(cathetus, -distance)
    val firstExternalPoint: Point2D = Point2D.Double(0.0, -distance - size * sin(2 * PI / 5))
    val rotate = AffineTransform()
    rotate.rotate(2 * PI / 5)
    val pointSequence: Sequence<Point2D> = generateSequence(sequenceOf(firstExternalPoint, firstInternalPoint)) { points ->
        points.map { rotate.transform(it, null) }
    }
        .take(5)
        .flatten()
    val points = pointSequence.map { it.x to it.y }.toList().toTypedArray()
    return createPolygon(*points)
}

fun star(size: Double, color: Color = WHITE, isFilled: Boolean = true) = bbox(Polygon(color, isFilled, createStar(size)))

class FileImage(private val image: BufferedImage) : Primitive(image.width.toDouble(), image.height.toDouble()) {
    constructor(fileName: String) : this(ImageIO.read(File(fileName)))

    override fun draw(graphics: Graphics2D, transform: AffineTransform) {
        graphics.drawImage(image, 0, 0, image.width, image.height, null)
    }
}