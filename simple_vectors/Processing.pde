PVector position;
float size = 80;

void setup() {
    size(400, 400);
    background(0);
    noStroke();
    fill(255);
    position = new PVector(random (0 + (size / 2), width - (size / 2)), random (0 + (size / 2), height - (size / 2)));
}

void draw() {
    background(0);
    fill(255);
    ellipse(position.x, position.y, size, size);
}

void mouseMoved() {
    position.x += pmouseX - mouseX;
    if (position.x < 0 + (size / 2))
        position.x = 0 + (size / 2);
    if (position.x > width - (size / 2))
        position.x = width - (size / 2);
    position.y += pmouseY - mouseY;
    if (position.y < 0 + (size / 2))
        position.y = 0 + (size / 2);
    if (position.y > height - (size / 2))
        position.y = height - (size / 2);
}