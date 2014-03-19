
# CHECK_PSINFO - nagios_plugin for processinformations with perfdata

- download: https://bitbucket.org/maresystem/dogtown-nagios-plugins/



## Installation and Configuration

- see check_psinfo -h
- Requirements: 
  - python 2.5 -  2.x
  - psutil 0.6 or above for all modules, 0.2 for minimal checks (might
    fail on mem/users - check)



## Checks

- see check_psinfo -h


### Check for signs of Ebury - Rootkit

Please note: this is just a simple check on certain signs
in shared memory-segments that MIGHT give a hint, if a system 
is infected. rkhunter or chckrootkit would be better tools
for detection, but (as of feb 2014), both fail on detection. 

An additional check runs against the system's package-manager 

~~~

USAGE 

check_psinfo -h


~~~ 


** References **

- https://www.cert-bund.de/ebury-faq
- http://isc.sans.edu/diary/SSHD+rootkit+in+the+wild/15229
- https://www.mare-system.de/blog/page/1395263085/




