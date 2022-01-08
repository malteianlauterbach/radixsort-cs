abstract class SortingAlgorithm extends Thread {
  public int[] data;
  private boolean finished = true;
  private volatile boolean threadShouldWait = true;
 
  public void setData(int[] data) {
    this.data = data;
  }
 
  public abstract void sort();
 
  public void run() {
    clearMarkers();
    finished = false;
    this.sort();    
    finished = true;
    clearMarkers();
  }
 
  public boolean isFinished() {
    return finished;
  }
 
  public void step() {
    this.threadShouldWait = false;
  }
 
  private void sleepFor(int milliSeconds) {
    try {
      Thread.sleep(milliSeconds);
    } catch (InterruptedException e) {
    }
  }
 
  private void waitForNextStep() {
    while(this.threadShouldWait == true) {
      sleepFor(1);
    }
 
    this.threadShouldWait = true;
  }
 
  public void marker(String name, color col) {
    markerColors.put(name, col);
  }
 
  public void mark(String name, int idx) {
    waitForNextStep();
 
    markerIndices.put(name, idx);
  }
 
  public void unmark(String name) {
    waitForNextStep();
 
    markerIndices.remove(name);
  }
 
  public int compare(int idxA, int idxB) {
    if (idxA == idxB) return 0;
 
    waitForNextStep();
 
    compareIdxA = idxA;
    compareIdxB = idxB;
    compareOrSwap = false;
 
    sleepFor(swapCompareCost);
 
    return this.data[idxA] - this.data[idxB];
  }
 
  public void swap(int idxA, int idxB) {
    if (idxA == idxB) return;
 
    waitForNextStep();
 
    compareIdxA = idxA;
    compareIdxB = idxB;
    compareOrSwap = true;
 
    sleepFor(swapCompareCost);
 
    int tmp = this.data[idxA];
    this.data[idxA] = this.data[idxB];
    this.data[idxB] = tmp;
  }
}
