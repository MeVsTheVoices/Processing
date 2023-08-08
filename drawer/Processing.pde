PrintWriter output = null;
BufferedReader input = null;
ArrayList<Int> xPositions = new ArrayList<Int>();
ArrayList<Int> yPositions = new ArrayList<Int>();
int current = 0;


void setup() {
    size(800, 800);
    background(255);
    
    input = createReader("positions.txt");
    String line = null;
    try {
        if (input == null) {
            println("File didn't exist");
            throw new IOException();
        }
        while ((line = input.readLine()) != null) {
            String[] pieces = split(line, ',');
            int x = int(pieces[0]);
            int y = int(pieces[1]);
            xPositions.append(x);
            yPositions.append(y);
        }
        input.close();
    } catch (IOException e) {
        println("File didn't exist " + e);
    } catch (ArrayIndexOutOfBoundsException e) {
        println("Array out of bounds " + e);
        exit();
    }

}

void draw() {
    fill(0);
    if (current < xPositions.size()) {
        ellipse(xPositions.get(current), yPositions.get(current), 10, 10);
        current++;
    }
    else {
        current = 0;
    }
}

void exit() {
    if (output != null) {
        println("Closing file");
        output.flush();
        output.close();
    }
    println("Exiting");
}

void mouseDragged() {
    fill(255, 0, 0);
    if (output == null) {
        output = createWriter("positions.txt");
    }
    output.println(mouseX + "," + mouseY);
    ellipse(mouseX, mouseY, 10, 10);
}