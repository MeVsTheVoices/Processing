float brightness = 255;

void setup() {
    size (510, 510);
    background (255);
    noLoop();
}

void draw() {
    loadPixels();

    colorMode(HSB, 255);
    float centerX = width / 2;
    float centerY = height / 2;
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            pixels[i + j * width] = colorAtPoint(i, j);
        }
    }
    updatePixels();

    textAlign(RIGHT, BOTTOM);
    textSize(20);
    stroke(0);
    fill(0);
    text("Scroll or arrow keys to change brightness", width - 10, height - 10);
}

float distFromCenter(float x, float y) {
    float centerX = (width / 2) / 2;
    float centerY = (height / 2) / 2;
    return sqrt(pow(x - centerX, 2) + pow(y - centerY, 2));
}

float angleFromCenter(float x, float y) {
    float centerX = width / 2;
    float centerY = height / 2;
    return atan2(y - centerY, x - centerX);
}

color colorAtPoint(float i, float j) {
    float hue;
    float angle = angleFromCenter(i, j);
    if (angle < 0) {
        angle += TWO_PI;
    }
    hue = map(angle, 0, TWO_PI, 0, 255);
    return color (hue, distFromCenter(i, j), brightness);
}

void keyPressed() {
    if (keyCode == LEFT) {
        changeBrightness(-10);
    }
    if (keyCode == RIGHT) {
        changeBrightness(10);

    }
    redraw();
}

void mouseWheel(MouseEvent event) {
    changeBrightness(-event.getCount());
    redraw();
}

void changeBrightness(float amount) {
    brightness += amount;
    if (brightness < 0) {
        brightness = 0;
    }
    if (brightness > 255) {
        brightness = 255;
    }
}
```
void mousePressed() {
    color colorUnderMouse = colorAtPoint(mouseX, mouseY);
    println("Hue: " + hue(colorUnderMouse) + " Saturation: " + saturation(colorUnderMouse) + " Brightness: " + brightness(colorUnderMouse));
    println("Red: " + red(colorUnderMouse) + " Green: " + green(colorUnderMouse) + " Blue: " + blue(colorUnderMouse));
}