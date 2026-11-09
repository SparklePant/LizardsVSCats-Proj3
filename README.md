COP4634 Project 3 - Hungry Lizard Crossing
Extra Credit: Unidirectional Crossing

This extra-credit implementation is provided in lizardsUni.cpp.
It sets UNIDIRECTIONAL = 1 and WORLDEND = 180 for submission.

The original bidirectional version remains in lizard.cpp, with
UNIDIRECTIONAL = 0 and WORLDEND = 180. It is unchanged.

Extra-credit synchronization:
- The existing driveway counting semaphore limits simultaneous crossings
  to MAX_LIZARD_CROSSING (four), regardless of direction.
- A second semaphore (emptyRoad) gives one direction exclusive control
  of the driveway until all admitted lizards in that direction leave.
- Direction-specific counters and mutexes track admitted lizards in
  each direction. The last lizard in a group releases emptyRoad.
- An arrival gate (arrivalGate) blocks newcomers while the first lizard
  in the opposite direction waits for the current group to finish.
  This prevents unlimited new arrivals from continually bypassing it.
- Semaphore waits block threads; there is no busy-wait loop.

Compilation on department Linux server:
  g++ -g -Wall -std=c++11 lizardsUni.cpp -o lizardsUni -pthread

Testing:
  ./lizardsUni -d
