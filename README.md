# AyeVDI - Virtualized Deployment IaaS 
(Infrastructure as a Service for Scientific and Cognitive Computing - IaaS2C2 -> IaaS2aC2 -> IaSaC)

#### AyeVDI - Virtualized Deployment IaaS (VDI) by AyeAI

Copyright (C) 2019-2020 Abhishek Choudhary<br>
AyeVDI is claimed as a trademark and a businessmark by
the author in Inida and other geographies.<br>

NOTICE:
To all WHO IT MAY CONCERN,
Greetings,
All artifacts and methods in this project are offered with 
NO WARRANTY, and ZERO LIABILITY (Limited to INR 1/- only),
subject to the jurisdictions of courts in Hyderabad, India,
and solely in accordance with AyeAI SPL version 1, or later,
as expressed at the following URL and at the most current version
of https://raw.githubusercontent.com/ayeai/spl/master/LICENSE
incuding its clauses of automatic implicit update of license,
and unless in conflict with the terms and conditions of GNU GPL v2
shall apply with no retort to other GPL licenses, AND, These
terms and conditions are implied read, understood and accepted
by the access, or usage of these artifacts and methods which
must STRICTLY be IN ACCORDANCE, and this notice must be 
reproduced in derivatives along with the original assertions
of copyrights.

Note: These instructions are based on Ubuntu 18.04 LTS which is supported by Canonical until April 2023 (Ref: https://web.archive.org/web/20200102083315/https://ubuntu.com/community/canonical https://web.archive.org/web/20200104055852/https://ubuntu.com/about/release-cycle). Support of other distros, including future Ubuntu releases, is pertinent to resource availability.

## Simple introduction !!
While we wait for more descriptive articles to be written, here's some quick information on how to get started. AyeVDI is a virtuaized desktop IaaS. The core objective of AyeVDI is to deliver seamless application, desktop and service virtualization including HyperScale, Scientific and Cognitive Computing. We aspire to offer optimal and hardened convergence of VDI and HPC with utmost fluidity in user experience, with focussed support for Machine Learning, Deep Learning, Internet of Things, Robotics, Medical Devices and Healthcare Applications (fundamental building blocks for #ai4all and #ai4socialgood).

The core of AyeVDI consists of containers running domain targeted and role / scenario specific images. These are currently run on docker but the abstraction layers in the design allows for other containerization platforms to be used as well, such as Singularity, and our upcoming AyeCons platform. With OCI standards in vogue, compliant container platforms from any vendor / project suffice for the core functionality. As one implementation of our abstraction layer, the AyeVDI core functionality will be offered as Kubernetes pods as well - but thats for one of the next upcoming releases subject to project constraints. All our images for the containers are hosted on dockerhub and other public image registeries.

The core is encapsulated inside AyeVDI nodes. AyeVDI nodes are essentially the minimal concrete units of compute, storage and I/O. As of the current release we are treating server nodes as the only nodes, but the configuration granularity is being refined incrementally and may include independent memory or IO nodes as well, apart from acceleration and other bespoke nodes.  

The nodes stand behind load balancers which keep the service levels optimal.

The highest level abstraction is of the zoners / orchetrators - AI based optimizers for AyeVDI, which are also in the pipeline for near future releases.
```
 O   -->  |   |   |   _________________________________________________       ___________
/|\  -->  |   |   |   | :Node                                         |  ...  | :Node 1 |
/ \  -->  |   |   |   |   -AyeVDI services                            |       -----------
Users     |   |   |   |     +Ephemeral sessions                       |       ___________
          |   |   |   |     +Shell terminal                           |  ...  | :Node 2 |
 O   -->  |   |   |   |     +GUI terminal                             |       -----------
/|\  -->  |   |   |   |     +Garbage collector                        |            .
/ \  -->  |   |   |   |     +Policy services                          |            .
Users     |   | L |   |                                               |            .
          |   | O |   |   -AyeSec tools                               |            .
 O   -->  |   | A |   |     +Secure web scripts                       |            .
/|\  -->  |   | D |   |     +Logging & forensics                      |
/ \  -->  | Z |   |   |     +OSTs for ssl automation                  |
Users     | O | B |   |     +OSTs for vpn automation                  |
          | N | A |   |                                               |
 O   -->  | E | L |   |   -AyeLearn tools                             |
/|\  -->  | R | A |   |     +VOIP automation                          |
/ \  -->  | S | N |   |     +Conferencing                             |
Users     |   | C |   |     +Screen sharing                           |
          |   | E |   |     +Multicasting                             |
 O   -->  |   | R |   |     +ValidCV Automation                       |            .
/|\  -->  |   | S |   |   _____________________        ___________    |            .
/ \  -->  |   |   |   |   | :Core             |  ...   | :Core 1 |    |            .
Users     |   |   |   |   |   -Images         |        -----------    |            .
          |   |   |   |   |   -Containers     |        ___________    |            .
 O   -->  |   |   |   |   |   -AyeVDI drivers |  ...   | :Core n |    |       ___________
/|\  -->  |   |   |   |   ---------------------        -----------    |  ...  | :Node n |
/ \  -->  |   |   |   -------------------------------------------------       -----------
Users
```

## Quick start guide

Caution: Please backup your data including server / system configuartion prior to executing any of the software / tools given on this page. There are no warranties  and no libility whatsoever and you are using these software / tools at your own risk, subject to latest AyeAI SPL license and applicable copyright notices.

### 2 step setup - should take less than 5 mins (unless you are accessing internet from a Mars settlement! Are you?)
So get going - just copy the one liner commands from the steps below onto any internet connected system.
At present we support only Ubuntu 18.04 LTS, but check back soon for other distributions!

You can use virtual machines on public cloud or on-premise (private) systems. AyeVDI scales across all scenarios. We will soon show you how AyeVPN allows you to create a hybrid-cloud based deployment easily. That's another "coming soon" feature! 

Note: For non-internet deployments we are rolling out DVD and BlueRay releases, subject to legal compliance.

#### First step : Enable AyeSec secure web scripts
Note: The security at this stage is being improved AyeQu (Quantum Computing utilities by AyeAI)
```
ayesh=$(tempfile) && wget https://raw.githubusercontent.com/ayevdi/ayevdi/master/ost/ayevdi-sfrom-init -O${ayesh} -q && . ${ayesh}
```

#### Second step : Setting up the node services - need to do this only once per node
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-setup
```
Great! Congratulations. You have AyeVDI working on your system now. Just point your browser to your server and start using AyeVDI.

#### Do you want to autoload AyeVDI - well the following OST can take care of it
Notice: This will ayesh init to your .bashrc
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/host/ayevdi-host-autoload
```

Really? Yes. That's it. Do drop us a kind word if you liked it. Of course, donations and crowd funding offers are welcome. Please see https://ayeai.xyz for details

One more thing could be useful - getting some persistent storage in emphemeral sessions. While most storage cloud vendors will tell you how to configure their services on a system, we are creating OSTs to make your experience seamless.

#### Activating persistent disk services
Note: AyeAI does not guarantee success of these integrations and does not control other vendors services. Check original instructions from the provider. Any access must be in absolute compliance of the laws and of the license agreements with the provider. The usage of services from other vendors does not impact terms of license from AyeAI and AyeAI does not represent the third party vendors in any manner.

Example: Yandex Disk
```
export AYEDISK_PROFILE=https://raw.githubusercontent.com/obonac/ayevdi/master/Yandesk.Disk && sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/container/ayedisk-profile-activate
```

## Advanced setup and configurations
Now let us look at some advanced features and fine grained configuration.

### AyeVDI host based setup - useful for debug and test

#### Setup a bare minimal AyeVDI system for remote shell and desktop from the host
WARNING: This is only for R&D and is not a recommended production setup
NOTE: This OST can take quite a long time on a slow system, or on a low bandwidth network
Note: This is the original native ayevdi. Please see the updated docker based version.
CAUTION: Do NOT execute this on a production server
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/setup/ayevdi-setup-basic
```
#### Launch a host based GUI session
Note: This will provide a GUI from the host on port 6080
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/init/ayevdi-init
```
#### Launch a host based shell session on port 4203
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/ayeuser/ayevdi-ayeuser-shell 4203
```

### AyeVDI Images

#### Create base image for AyeVDI
Execute the following command to generate AyeVDI image.
Note: This script requires user interaction. Push will only work with account auth
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/image/ayevdi-image-gen
```


### Working with AyeVDI pools
Note: Pools are defined per exposed port / service. A single node may offer multiple ports.
Replace the repo with the url to your clone


#### Create a pool for port 9999
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-create 9999 https://github.com/ayevdi/ayevdi
```
#### Edit the pool for port 9999
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-edit 9999 https://github.com/ayevdi/ayevdi
```
#### Copy a pool from port 9999 to port 9998
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-copy 9999 9998 https://github.com/ayevdi/ayevdi
```
#### See the pools list
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-ls
```
#### Mark for deletion the pool for port 9999
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-rm 9999
```
#### Mark all pools for deletion
```
sourcefrom https://github.com/ayevdi/ayevdi/blob/master/pool/ayevdi-pool-rm-all
```
### Utils
Some quick utilities for both AyeVDI users and developers 

#### Get lines and md5sum
```
(cat | tee >(echo LINES=$(wc -l)) >(echo CSUM=$(md5sum)) >/dev/null) && echo ""
```

#### Release fatal error lockdown
TBD: This should be replaced with field data gathering utility (including confidentialilty review)
```
rm ${HOME}/.ayevdi/ayevdi-error.fatal
```

### Building modules

#### Shellinabox compilation
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/build/ayevdi-build-siab
```
#### Shellinabox installation
```
sudo dpkg -r shellinabox && sudo dpkg -i ayebuild/shellinabox_2.21_amd64.deb
```

### Testing

#### Test rr scheduler algo and integration
NOTE: This requires a pool for port 9999 to have been created. It can be a dummy pool
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/sched/ayevdi-sched-rr-test
```
#### Test node policy to stop abandoned containers
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-stop-abandoned-test
```
#### Test node policy to limit runtime of containers
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-policy-timeout-test
```

### Administration and management

#### Find runtime statistics of containers
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-runstats
```

#### See active containers with labels
```
while [ 1 ]; do clear; sudo docker ps --format "{{.ID}} {{.Labels}}"; sleep 1; done
```


### Internship projects

#### Convert bash scripts in AyeVDI to Python
See the link https://zwischenzugs.com/2016/08/29/bash-to-python-converter/ and convert the sripts here

#### Convert to Perl, Javascript / Node.js

### bit.ly mappings
```
https://raw.githubusercontent.com/ayevdi/ayevdi/master/ayeuser/ayevdi-ayeuser-shell,https://raw.githubusercontent.com/ayevdi/ayevdi/master/ayeuser/ayevdi-ayeuser-shell
https://raw.githubusercontent.com/ayevdi/ayevdi/master/lib/ayevdi-functions,https://raw.githubusercontent.com/ayevdi/ayevdi/master/lib/ayevdi-functions
https://raw.githubusercontent.com/ayevdi/ayevdi/master/host/ayevdi-host-user-setup,https://raw.githubusercontent.com/ayevdi/ayevdi/master/host/ayevdi-host-user-setup
https://raw.githubusercontent.com/ayevdi/ayevdi/master/image/ayevdi-image-common,https://raw.githubusercontent.com/ayevdi/ayevdi/master/image/ayevdi-image-common
https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-policy-timeout,https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-policy-timeout
https://raw.githubusercontent.com/ayevdi/ayevdi/master/container/ayedisk-profile-activate,https://raw.githubusercontent.com/ayevdi/ayevdi/master/container/ayedisk-profile-activate
https://raw.githubusercontent.com/ayevdi/ayevdi/master/ayeuser/ayevdi-ayeuser-shell,https://raw.githubusercontent.com/ayevdi/ayevdi/master/ayeuser/ayevdi-ayeuser-shell
https://raw.githubusercontent.com/ayevdi/ayevdi/master/build/ayevdi-build-siab,https://raw.githubusercontent.com/ayevdi/ayevdi/master/build/ayevdi-build-siab
https://raw.githubusercontent.com/ayevdi/ayevdi/master/docker/ayevdi-docker,https://raw.githubusercontent.com/ayevdi/ayevdi/master/docker/ayevdi-docker
https://raw.githubusercontent.com/ayevdi/ayevdi/master/docker/ayevdi-docker-stub,https://raw.githubusercontent.com/ayevdi/ayevdi/master/docker/ayevdi-docker-stub
https://raw.githubusercontent.com/ayevdi/ayevdi/master/doc/ayevdi-header-samples,https://raw.githubusercontent.com/ayevdi/ayevdi/master/doc/ayevdi-header-samples
https://raw.githubusercontent.com/ayevdi/ayevdi/master/host/ayevdi-host-autoload,https://raw.githubusercontent.com/ayevdi/ayevdi/master/host/ayevdi-host-autoload
https://raw.githubusercontent.com/ayevdi/ayevdi/master/host/ayevdi-host-user-setup,https://raw.githubusercontent.com/ayevdi/ayevdi/master/host/ayevdi-host-user-setup
https://raw.githubusercontent.com/ayevdi/ayevdi/master/image/ayevdi-image-common,https://raw.githubusercontent.com/ayevdi/ayevdi/master/image/ayevdi-image-common
https://raw.githubusercontent.com/ayevdi/ayevdi/master/image/ayevdi-image-gen,https://raw.githubusercontent.com/ayevdi/ayevdi/master/image/ayevdi-image-gen
https://raw.githubusercontent.com/ayevdi/ayevdi/master/init/ayevdi-init,https://raw.githubusercontent.com/ayevdi/ayevdi/master/init/ayevdi-init
https://raw.githubusercontent.com/ayevdi/ayevdi/master/utils/ayevdi-log,https://raw.githubusercontent.com/ayevdi/ayevdi/master/utils/ayevdi-log
https://raw.githubusercontent.com/ayevdi/ayevdi/master/doc/ayevdi-mascot,https://raw.githubusercontent.com/ayevdi/ayevdi/master/doc/ayevdi-mascot
https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-policy-timeout,https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-policy-timeout
https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-policy-timeout-test,https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-policy-timeout-test
https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-runstats,https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-runstats
https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-setup,https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-setup
https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-stop-abandoned,https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-stop-abandoned
https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-stop-abandoned-test,https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-stop-abandoned-test
https://raw.githubusercontent.com/ayevdi/ayevdi/master/passkey/ayevdi-passkey,https://raw.githubusercontent.com/ayevdi/ayevdi/master/passkey/ayevdi-passkey
https://raw.githubusercontent.com/ayevdi/ayevdi/master/passkey/ayevdi-passkey-gen,https://raw.githubusercontent.com/ayevdi/ayevdi/master/passkey/ayevdi-passkey-gen
https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-9999.sample,https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-9999.sample
https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-copy,https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-copy
https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-create,https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-create
https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-edit,https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-edit
https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-ls,https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-ls
https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-rm,https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-rm
https://github.com/ayevdi/ayevdi/blob/master/pool/ayevdi-pool-rm-all,https://github.com/ayevdi/ayevdi/blob/master/pool/ayevdi-pool-rm-all
https://raw.githubusercontent.com/ayevdi/ayevdi/master/proxy/ayevdi-proxy-setsalt.awk,https://raw.githubusercontent.com/ayevdi/ayevdi/master/proxy/ayevdi-proxy-setsalt.awk
https://raw.githubusercontent.com/ayevdi/ayevdi/master/sched/ayevdi-sched-rr.awk,https://raw.githubusercontent.com/ayevdi/ayevdi/master/sched/ayevdi-sched-rr.awk
https://raw.githubusercontent.com/ayevdi/ayevdi/master/sched/ayevdi-sched-rr-test,https://raw.githubusercontent.com/ayevdi/ayevdi/master/sched/ayevdi-sched-rr-test
https://raw.githubusercontent.com/ayevdi/ayevdi/master/setup/ayevdi-setup-basic,https://raw.githubusercontent.com/ayevdi/ayevdi/master/setup/ayevdi-setup-basic
https://raw.githubusercontent.com/ayevdi/ayevdi/master/utils/ayevdi-sourcefrom,https://raw.githubusercontent.com/ayevdi/ayevdi/master/utils/ayevdi-sourcefrom
https://raw.githubusercontent.com/ayevdi/ayevdi/master/ost/ayevdi-sfrom-init,https://raw.githubusercontent.com/ayevdi/ayevdi/master/ost/ayevdi-sfrom-init
https://raw.githubusercontent.com/ayevdi/ayevdi/master/utils/ayevdi-validator,https://raw.githubusercontent.com/ayevdi/ayevdi/master/utils/ayevdi-validator
https://web.archive.org/web/20200102083315/https://ubuntu.com/community/canonical,https://web.archive.org/web/20200102083315/https://ubuntu.com/community/canonical
https://web.archive.org/web/20200104055852/https://ubuntu.com/about/release-cycle,https://web.archive.org/web/20200104055852/https://ubuntu.com/about/release-cycle
https://raw.githubusercontent.com/ayevdi/ayevdi/master/doc/xstartup.sample,https://raw.githubusercontent.com/ayevdi/ayevdi/master/doc/xstartup.sample
https://raw.githubusercontent.com/obonac/ayevdi/master/Yandesk.Disk,https://raw.githubusercontent.com/ayevdi/profiles/master/Yandesk.Disk
```

The above list have been generated using the following command
```
git clone https://github.com/ayevdi/ayevdi; cd ayevdi; for n in $(find . -type f | grep -v .git | xargs cat | tr "()' =;" '\n\n\n\n\n\n' | grep bit.ly | grep http | sort -u); do printf "%s," ${n}; curl ${n} 2>/dev/null | grep href | cut -d'"' -f2 | grep http; done | wc -l
```
TODO: Need OSTs for migrating to different servers, repo-hosts, url shorteners, across cloud providers etc.
TODO: Enable local hosting / OSTs to build infra from scratch



```















````

## Setup front-end
Note: TBD - OST needed for scripted deployment of profiles and scenarios

## The immediate next sections are being captured into OSTs (one step tricks). Please skip ahead to launching the server

### Test RR load balancer
```
export ayeport=4203 && shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p ${ayeport} -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'wget https://raw.githubusercontent.com/ayevdi/ayevdi/master/sched/ayevdi-sched-rr.awk -O ${HOME}/.ayevdi/ayevdi-sched-rr.awk >/dev/null 2>&1 && curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-${ayeport} 2>/dev/null | uudecode | uudecode | gpg --batch --passphrase $(curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/passkey/ayevdi-passkey 2>/dev/null | bash - ) 2>/dev/null -d | awk -vstrobefile=${HOME}/.ayevdi/ayestrobe_${ayeport} -f ${HOME}/.ayevdi/ayevdi-sched-rr.awk'" --disable-ssl
```
```








```

### AyeVDI in container
Note: Run on host only - Does not run nested in AyeVDI sessions as of now!

#### AyeVDI in container with current / persistent user
```
sourcefrom https://raw.githubusercontent.com/ayevdi/ayevdi/master/docker/ayevdi-docker
```

#### AyeVDI in container with ephemeral user
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral | bash -
```

## Load testing AyeVDI ephemeral mode with 200 simultaneous GUI users
```
(for n in {1..10}; do sudo apt update -y && curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral | bash -; done) 2>/dev/null | grep vnc_auto > terms.txt
cat terms.txt
(for n in {1..190}; do sudo apt update -y && curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral | bash -; done) 2>/dev/null | grep vnc_auto > terms.txt
```

## Integration Testing

### Build, deploy, test SIAB combo on host with Shell
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/build/ayevdi-build-siab | bash - && sudo dpkg -r shellinabox && sudo dpkg -i ayebuild/shellinabox_2.21_amd64.deb  && shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p 4203 -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'echo AyeVDI by https://ayeai.xyz && (curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral-shell | bash - ) 2>&1 | tee >(tail -2) >/dev/null >(awk -f /usr/share/ayevdi/ayerun.awk ) && bash -i'" --disable-ssl
```
### Build, deploy, test SIAB combo on host with GUI
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/build/ayevdi-build-siab | bash - && sudo dpkg -r shellinabox && sudo dpkg -i ayebuild/shellinabox_2.21_amd64.deb  && shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p 4202 -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'echo AyeVDI by https://ayeai.xyz && (curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral | bash - ) 2>&1 | tee >(tail -2) >/dev/null >(awk -f /usr/share/ayevdi/ayerun.awk ) && bash -i'" --disable-ssl
```
### Host - Test with GUI in container
```
shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p 4202 -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'echo AyeVDI by https://ayeai.xyz && (curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral | bash - ) 2>&1 | tee >(tail -2) >/dev/null >(awk -f /usr/share/ayevdi/ayerun.awk ) && bash -i'" --disable-ssl
```
### Host - Test with Shell in container
```
shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p 4203 -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'echo AyeVDI by https://ayeai.xyz && (curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral-shell | bash - ) 2>&1 | tee >(tail -2) >/dev/null >(awk -f /usr/share/ayevdi/ayerun.awk ) && bash -i'" --disable-ssl
```

### Container - Test Shell directly on container
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/ayeuser/ayevdi-ayeuser-shell | bash -
```

# Production
Warning: This project is still pre-release alpha. No warranties whatsoever

## Deploy servers

### Daemonize front-end server with RR load balancer
```
export ayeport=4203 && screen -d -m shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p ${ayeport} -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'wget https://raw.githubusercontent.com/ayevdi/ayevdi/master/sched/ayevdi-sched-rr.awk -O ${HOME}/.ayevdi/ayevdi-sched-rr.awk >/dev/null 2>&1 && curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-${ayeport} 2>/dev/null | uudecode | uudecode | gpg --batch --passphrase $(curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/passkey/ayevdi-passkey 2>/dev/null | bash - ) 2>/dev/null -d | awk -vstrobefile=${HOME}/.ayevdi/ayestrobe_${ayeport} -f ${HOME}/.ayevdi/ayevdi-sched-rr.awk'" --disable-ssl
```

### Daemonize GUI service
```
screen -S "ayevdi-service-gui" -d -m shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p 4202 -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'echo AyeVDI by https://ayeai.xyz && (curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral | bash - ) 2>&1 | tee >(tail -2) >/dev/null >(awk -f /usr/share/ayevdi/ayerun.awk ) && (while [ 1 ]; do printf "."; sleep 1; done) || echo Server busy'" --disable-ssl
```

### Daemonize shell service
```
screen -S "ayevdi-service-shell" -d -m shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p 4203 -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'echo AyeVDI by https://ayeai.xyz && (curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral-shell | bash - ) 2>&1 | tee >(tail -2) >/dev/null >(awk -f /usr/share/ayevdi/ayerun.awk ) && (while [ 1 ]; do printf "."; sleep 1; done) || echo Server busy'" --disable-ssl
```

### Daemonize abandoned container stopper
TODO: Log IP addresses from where connections were recieved prior to stopping
```
screen -S "ayevdi-service-garbageCollector" -d -m bash -c 'while [ 1 ]; do sleep 10; export tmpscript=$(tempfile) && wget https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-stop-abandoned -O ${tmpscript} && sudo bash -c "source ${tmpscript}" && export tmpscript=$(date +%s); done'
```

### Daemonize policy for time based exit
```
screen -S "ayevdi-service-timePolicy" -d -m bash -c 'while [ 1 ]; do sleep 10; export tmpscript=$(tempfile) && wget https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-policy-timeout -O ${tmpscript} && sudo bash -c "export timelimit=1899 && source ${tmpscript}" && export tmpscript=$(date +%s); done'
```

### Daemonize policy for idle timeout
```
screen -S "ayevdi-service-idlePolicy" -d -m bash -c 'while [ 1 ]; do sleep 10; export tmpscript=$(tempfile) && wget https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-policy-idle -O ${tmpscript} && sudo bash -c "source ${tmpscript}" && export tmpscript=$(date +%s); done'
```

