# shutdown

launchd configuration to schedule shutdown of a mac osx operating system. 

Consists of several plist files to:

* warn
* wake up if sleeping
* shut down

If using 2 minutes grace period between wake up and shutdown, the energy management settings must not put the system to sleep before 3 minutes for this sequence to work.