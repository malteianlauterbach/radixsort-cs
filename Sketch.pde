import java.util.concurrent.ConcurrentHashMap;
 
final int LEN = 100;
final int MIN = 1;
final int MAX = 100;
final int OFFSET = 10;
int swapCompareCost = 0;
 
int[] data = null;
SortingAlgorithm sorter;
ConcurrentHashMap<String, Integer> markerColors = new ConcurrentHashMap<>();
ConcurrentHashMap<String, Integer> markerIndices = new ConcurrentHashMap<>();
int compareIdxA = -1;
int compareIdxB = -1;
boolean compareOrSwap = false;
 
void setup() {
  size(640, 480);
  frameRate(120);
  colorMode(HSB, 360, 100, 100);
  ellipseMode(CENTER);
 
  data = newRandomArray();
}
 
void draw() {
  background(0);
 
  if (sorter != null) {
    sorter.step();
  }
 
  float barWidth = (width - 2.0 * OFFSET) / data.length;
  float barHeight = height - 2.0 * OFFSET - barWidth;
  float colorFactor = 360 / MAX;
  float xPos = OFFSET;
 
  for (int i = 0; i < data.length; i++) {
    fill(color(colorFactor * data[i], 100, 100));
    rect(xPos, height - OFFSET - barWidth, barWidth, -(barHeight / MAX) * data[i]);
 
    xPos += barWidth;
  }
 
  float radius = Math.max(5, barWidth / 2);
 
  for (java.util.Map.Entry<String, Integer> entry : markerIndices.entrySet()) {
    String markerName = entry.getKey();
    int markerIdx = entry.getValue();
 
    if (!markerColors.containsKey(markerName)) continue;
 
    color markerColor = markerColors.get(markerName);
 
    fill(markerColor);
    ellipse(OFFSET + barWidth * markerIdx + radius, height - OFFSET - radius, radius, radius);
  }
 
  if (compareIdxA < 0 || compareIdxB < 0) return;
 
  if (compareOrSwap) {
    fill(color(#FF0000));
 
    ellipse(OFFSET + barWidth * compareIdxA + radius, height - OFFSET, radius, radius);
    ellipse(OFFSET + barWidth * compareIdxB + radius, height - OFFSET, radius, radius);
  } else {
    fill(color(#00FF00));
 
    ellipse(OFFSET + barWidth * compareIdxA + radius, height - OFFSET, radius, radius);
    ellipse(OFFSET + barWidth * compareIdxB + radius, height - OFFSET, radius, radius);
  }
}
 
void clearMarkers() {
  compareIdxA = -1;
  compareIdxB = -1;
  markerColors.clear();
  markerIndices.clear();
}
 
void keyPressed() {
  switch (key) {
    case '0':
      swapCompareCost = 0;
      break;
    case '1':
      swapCompareCost = 100;
      break;
    case '2':
      swapCompareCost = 250;
      break;      
    case '3':
      swapCompareCost = 500;
      break;      
    case '4':
      swapCompareCost = 1000;
      break;      
    case 'r':
      if (sorter == null || sorter.isFinished()) {
        data = newRandomArray();
      }
      break;
    case ' ':
      if (sorter == null || sorter.isFinished()) {
        sorter = new SortingAlgorithmImplementation();    
        sorter.setData(data);
        sorter.start();
      }
      break;
  }
}
 
int[] newRandomArray() {
  int[] a = new int[LEN];
 
  for (int i = 0; i < a.length; i++) {
    a[i] = (int)Math.floor(Math.random() * (MAX - MIN) + MIN); 
  }
 
  return a;
}
