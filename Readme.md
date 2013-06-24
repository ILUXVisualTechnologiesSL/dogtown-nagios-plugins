# Dogtown-Nagios-Plugins 

(c) copyright 2009-2013 dogtown@mare-system.de

these plugins are developed and tested using Debian and SLES
and RedHat but should work on any modern Unix.

for more help see $check_plugin.Readme, if available, or 
execute $check_plugin -h 


# Installation

- download / extract the repo
 - [Bitbucket ](https://bitbucket.org/maresystem/dogtown-nagios-plugins/src)
 - [download tar.gz](https://bitbucket.org/maresystem/dogtown-nagios-plugins/get/master.tar.gz) 
 - [download zip](https://bitbucket.org/maresystem/dogtown-nagios-plugins/get/master.zip)

~~~
    git clone https://bitbucket.org/maresystem/linux-docu.git
    
    wget -O dogtown-nagios-plugins.tar.gz https://bitbucket.org/maresystem/dogtown-nagios-plugins/get/master.tar.gz
    
    
~~~

- copy plugins to your local nagios-plugins-dir
- find infos / help in check_plugin.Readme or execute 
~~~ check_plugin -h ~~~
- config-examples might be found in the header of each plugin
- test / run them through nrpe or locally

# Requirements 

these plugins are either bash-based shellscripts or python-scripts
and should work on python 2.4 and above (but havent been tested
on python 3.x) and are well-tested on linux (mainly debian, sles and 
redhat)

for some plugins like check_psinfo / check_selenium you might need to 
install some more modules; you'll find those in contrib/. 
any other required python-lib should be installed using your preferred 
package-manager.



# License: 

- see License.txt
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
