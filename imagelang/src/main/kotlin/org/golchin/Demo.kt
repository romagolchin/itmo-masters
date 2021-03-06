package org.golchin

import java.awt.Color.*

fun main() {
    val penguin = FileImage("penguin.jpg")
    val penguins = penguin besides penguin
    penguins drawInto "2penguins.jpg"
    penguins drawInto "2penguins.png"

    val transform = lowerHalf then rotateBbox(90.0)
    transform(penguin) drawInto "lower_penguin_rotate_bbox.jpg"
    (lowerHalf then rotate(90.0))(penguin) drawInto "lower_penguin_rotate.jpg"
    lowerHalfClip(penguins) drawInto "lower_half_penguins.png"
    lowerHalfClip(lowerHalfClip(penguins)) drawInto "lower_half_penguins.png"
    val upperHalf = upperHalf(false)(lowerHalf(penguin))
    rotateBbox(60.0)(penguin) besides upperHalf drawInto "lower_and_upper.png"
    center(false)(center(false)(penguin)) drawInto "center_clip.png"

    (shearX(1.0) then shearY(1.0))(penguin) drawInto "shear.png"
    val verticallyMirrored = penguin besides verticalMirror(penguin)
    val horizontallyMirrored = verticallyMirrored above horizontalMirror(verticallyMirrored)
    horizontallyMirrored drawInto "mirrored.png"
    penguin behind translate(100.0, 200.0)(penguin) drawInto "behind.png"

    grid(3, 2)(penguin) drawInto "grid.png"
    repeat(-42)(penguin) drawInto "must_not_draw.png"

    val redTriangle = rotateBbox(-45.0)(Triangle(100.0, RED))
    val greenTriangle = verticalMirror(rotateBbox(-45.0)(Triangle(100.0, GREEN)))
    redTriangle besides greenTriangle drawInto "junit.png"

    Square(600.0, RED) behind Circle(300.0, GREEN) drawInto "square_and_circle.png"

    val bowTie = Polygon(WHITE, true, 1.0 to 1.0, 1.0 to -1.0, -1.0 to 1.0, -1.0 to -1.0)
    bbox(scaleEvenly(100.0)(bowTie)) drawInto "bow_tie.png"

    val line = Line(100.0, 100.0)
    line behind horizontalMirror(line) drawInto "diagonals.png"

    Star(100.0, YELLOW) drawInto "star.png"
}