PFont font;
int selectedFontIndex = 0;
String selectedFontName;

void setup() {
    size(1600, 250);
    background(255);

    for (String s : PFont.list()) {
        println(s);
    }
    selectedFontName = PFont.list()[selectedFontIndex];
    font = createFont(selectedFontName, 32);
}

void draw() {
    background(0);
    textFont(font);
    textSize(80);
    text(selectedFontName, 50, 80);
    textSize(32);
    text("mouse wheel to change font", 50, 150);
    text("or use arrow keys", 50, 200);
}

void mouseWheel(MouseEvent event) {
    selectedFontIndex += event.getCount();
    if (selectedFontIndex < 0)
        selectedFontIndex = PFont.list().length - 1;
    else if (selectedFontIndex >= PFont.list().length)
        selectedFontIndex = 0;
    selectedFontName = PFont.list()[selectedFontIndex];
    font = createFont(selectedFontName, 32);
}

void keyPressed() {
    if (keyCode == LEFT) {
        selectedFontIndex--;
        if (selectedFontIndex < 0)
            selectedFontIndex = PFont.list().length - 1;
    } else if (keyCode == RIGHT) {
        selectedFontIndex++;
        if (selectedFontIndex >= PFont.list().length)
            selectedFontIndex = 0;
    }
    selectedFontName = PFont.list()[selectedFontIndex];
    font = createFont(selectedFontName, 32);
}