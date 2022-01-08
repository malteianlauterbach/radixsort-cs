/*
 You have two helper methods available, which you must also use for the visualization to work correctly:

    The int compare(int idxA, int idxB) method compares the array entries at locations idxA and idxB and returns the following:
        Return value > 0 if array[idxA] > array[idxB].
        return value < 0, if array[idxA] < array[idxB]
        return value 0, if array[idxA] = array[idxB]
    The method void swap(int idxA, int idxB) swaps the two array entries at the positions idxA and idxB.

Additionally you can define markers, which e.g. mark the already sorted area. For this you can use the following methods:

    The method void marker(String name, color col) creates a new marker with the given name and color.
    The method void mark(String name, int idx) places the marker with the given name at the given index
    The method void unmark(String name) deletes the marker with the given name

In the interface you have the following keyboard shortcuts:

    0 - 4 set the speed at which the sorting algorithm runs (0 = fastest, 4 = slowest).
    r creates a new random array if the simulation is not running.
    Spacebar starts the simulation.

*/
public void sort() {
    System.out.println("Radix in Java");
    int[] input = { 181, 51, 11, 33, 11, 39, 60, 2, 27, 24, 12 }; //Sample data for GUI-less test runs and console debugging

    System.out.println("Unsorted");
    System.out.println(Arrays.toString(input));
    radixSort(input);

    System.out.println("Sorted");
    System.out.println(Arrays.toString(input));
    }
    public void radixSort(int[] input) {
        final int RADIX = 10;
        
        // We declare a new bin to assign elements to.[partition phase, Part I]
        List<Integer>[] bucket = new ArrayList[RADIX];
        
        for (int i = 0; i < bucket.length; i++) {
            bucket[i] = new ArrayList<Integer>();
        }
    
        // We sort the bucket [partitioning phase, Part II].
        boolean maxLength = false;
        int tmp = -1, placement = 1;
        while (!maxLength) {
            maxLength = true;
            
            
            for (integer i : input) {
            tmp = i / placement;
            bucket[tmp % RADIX].add(i);
            if (maxLength && tmp > 0) {
                maxLength = false;
            }
            }
            
            // Now we group the bin in our sorted list, empty it [collection phase, Part I].
            int a = 0;
            for (int b = 0; b < RADIX; b++) {
            for (integer i : bucket[b]) {
                input[a++] = i;
                
            }
            bucket[b].clear();
            }
            
            // And go to the next place until we have stepped through all of them [Collection Phase, Part I
            placement *= RADIX;
    
        }
    }
}
