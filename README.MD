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
