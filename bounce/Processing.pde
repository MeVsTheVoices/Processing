ArrayList<Ball> balls = new ArrayList<Ball>();
Ball selectedBall = null;
float [] selectedBallMouseOffset = new float[2];

class Ball {
    float x, y, speedX, speedY;
    int sizeX, sizeY;
    color c;
    
    Ball(float x, float y, float speedX, float speedY, color c, int sizeX, int sizeY) {
        this.x = x;
        this.y = y;
        this.speedX = speedX;
        this.speedY = speedY;
        this.c = c;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
    }
    
    void move() {
        x += speedX;
        y += speedY;
    }
    
    void bounce() {
        if (x < (sizeX/2) || x > (width - (sizeX/2))) {
        speedX *= -1;
        }
        if (y < (sizeY/2) || y > (height - (sizeY/2))) {
        speedY *= -1;
        }
    }
    
    void display() {
        fill(c);
        ellipse(x, y, sizeX, sizeY);
    }

    boolean collide(Ball b) {
        float distance = dist(x, y, b.x, b.y);
        if (distance < (sizeX/2) + (b.sizeX/2)) {
            return true;
        } else {
            return false;
        }
    }
}

void setup() {
    size(800, 800);
    background(0);
    for (int i = 0; i < 10; i++) {
        int size = int(random(40, 80));
        float x = random(size/2, (width - (size/2)));
        float y = random(height/ 2, (height - (size/2)));
        float speedX = random(-5, 5);
        float speedY = random(-5, 5);
        color c = color(random(255), random(255), random(255));
        Ball b = new Ball(x, y, random(1, 4), random(1, 4), c, size, size);
        balls.add(b);
    }
}

void draw() {
    background(0);
    for (Ball b : balls) {
        b.move();
        b.bounce();
        b.display();
    }
}

void mousePressed() {
    for (Ball b : balls) {
        if (mouseX < (b.x + (b.sizeX/2)) && mouseX > (b.x - (b.sizeX/2)) && mouseY < (b.y + (b.sizeY/2)) && mouseY > (b.y - (b.sizeY/2))) {
            b.speedX = 0;
            b.speedY = 0;
            selectedBall = b;
            selectedBallMouseOffset[0] = int(mouseX - b.x); 
            selectedBallMouseOffset[1] = mouseY - b.y;
        }
    }
}

void mouseDragged() {
    if (selectedBall != null) {
        selectedBall.x = mouseX - selectedBallMouseOffset[0];
        selectedBall.y = mouseY - selectedBallMouseOffset[1];
    }
}

void mouseReleased() {
    float deltaX = mouseX - pmouseX;
    float deltaY = mouseY - pmouseY;
    try {
        selectedBall.speedX = deltaX;
        selectedBall.speedY = deltaY;
    } catch (NullPointerException e) {
        println("No ball selected");
    }
    selectedBall = null;
}