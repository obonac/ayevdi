# AyeVDI - Virtualized Deployment IaaS (VDI) by AyeAI

Copyright (C) 2019-2020 Abhishek Choudhary
AyeVDI is claimed as a trademark and a businessmark by
the author in Inida and other geographies.

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
and unless in conflict the terms and conditions of GNU GPL v2
shall apply with no retort to other GPL licenses, AND, These
terms and conditions are implied read, understood and accepted
by the access, or usage of these artifacts and methods which
must STRICTLY be IN ACCORDANCE, and this notice must be 
reproduced in derivatives along with the original assertions
of copyrights.

## Getting started

### Enabling web OSTs
TBD: Improve security at this stage with AyeQu
```
ayesh=$(tempfile) && wget https://bit.ly/ayevdi-sfrom-init -O${ayesh} -q && . ${ayesh}
```

### Activating persistent disk services
Note: AyeAI does not guarantee success of these integrations

Example: Yandex Disk
```
export AYEDISK_PROFILE=https://bit.ly/ydprof && sourcefrom https://bit.ly/ayedisk-proact
```

## Utils

### Get lines and md5sum
```
(cat | tee >(echo LINES=$(wc -l)) >(echo CSUM=$(md5sum)) >/dev/null) && echo ""
```

### Release fatal error lockdown
TBD: This should be replaced with field data gathering utility (including confidentialilty review)
```
rm ${HOME}/.ayevdi/ayevdi-error.fatal
```

bit.ly mappings
https://bit.ly/ayevdi-sfrom-init https://raw.githubusercontent.com/ayevdi/ayevdi/master/ost/ayevdi-sfrom-init


# AyeVDI - Virtualized Deployment IaaS (Old Readme)
(Infrastructure as a Service for Scientific and Cognitive Computing - IaaS2C2 -> IaaS2aC2 -> IaSaC)

Note: These instructions are based on Ubuntu 18.04 LTS which is supported by Canonical until April 2023 (TBD give reference). Support of other distros, including future Ubuntu releases, is pertinent to resource availability.

## Simple introduction !!
While we wait for more descriptive articles to be written, here's some quick information on how to get started. AyeVDI is a virtuaized desktop IaaS. The core objective of AyeVDI is to deliver seamless application, desktop and service virtualization including HPC. We aspire to offer optimal and hardened convergence of VDI and HPC with utmost fluidity in user experience.

The core of AyeVDI consists of containers running domain targeted and role / scenario specific images. These are currently run on docker but the abstraction design allows for other containerization platforms to be used as well, such as our upcoming AyeCons platform. With OCI standards in vogue, compliant container platforms from any vendor / project suffice for the core functionality. As one implementation of our abstraction layer, the AyeVDI core functionality will be offered as Kubernetes pods as well - but thats for one of the next upcoming releases subject to project constraints. All our images for the containers are hosted on dockerhub and other public image registeries.

The core is encapsulated into AyeVDI nodes. AyeVDI nodes are essentially the minimal concrete units of compute, storage and I/O. As of the current release we are treating server nodes as the only nodes, but the configuration granularity is being refined incrementally.  

The nodes stand behind load balancers which keep the service levels optimal.

The highest level abstraction is of the zoners - AI based optimizers for AyeVDI, which are also in the pipeline for near future releases.

## Quick start guide

### 1 step setup - takes less than 5 mins (unless you are accessing internet from a Mars settlement!)
Copy the following command and execute on a Ubuntu 18.04 LTS system. It can be on cloud or an on-premise (private) system. AyeVDI scales across all scenarios. (We will show you soon how AyeVPN allows you to create a hybrid cloud based deployment easily- though that's another "coming soon" feature). (Note: For defence and other non internet use cases we are rolling out DVD and BlueRay releases, subject to legal compliance)

So get going - just copy the following command onto an internet connected system 
```
curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-setup | bash -
```

Caution: Please backup your data including server / system configuartion prior to executing any of the software / tools given on this page. There are no warranties whatsoever and you are using these software / tools at your own risk, subject to GNU GPL v2 license and applicable copyright notices.

Great! Congratulations. You have AyeVDI working on your system now. Just point your browser to your server and start using AyeVDI.

## Setup front-end
Note: TBD - OST needed for scripted deployment of profiles and scenarios

## The immediate next sections are being captured into OSTs (one step tricks). Please skip ahead to launching the server

### Install packages
```
sudo apt install sharutils gpg && wget https://github.com/ayevdi/ayevdi/releases/download/v0.1-alpha/shellinabox_2.21_amd64.deb && sudo dpkg -r shellinabox && sudo dpkg -i ./shellinabox_2.21_amd64.deb
```
### Generate keys
```
gpg --generate-key
```
### Generate passphrase
```
export passfile=$(tempfile) && curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/passkey/ayevdi-passkey-gen > ${passfile} && source ${passfile} && export passfile=$(date +%s)
```
### Configure pool nodes
Note:Needed for each deployment
```
git clone https://github.com/ayevdi/ayevdi && cd ayevdi && ls && echo Use the ayevdi-pool-create/copy/edit tools to configure
```
### Test RR scheduler
Note:Replace port number in example below
```
export ayeport=4203 && curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-${ayeport} 2>/dev/null | uudecode | uudecode | gpg --batch --passphrase $(curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/passkey/ayevdi-passkey 2>/dev/null | bash - ) 2>/dev/null -d | awk -vstrobefile=${HOME}/.ayevdi/ayestrobe_${ayeport} "$(curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/sched/ayevdi-sched-rr.awk 2>/dev/null)"
```
### Test RR load balancer
```
export ayeport=4203 && shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p ${ayeport} -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'wget https://raw.githubusercontent.com/ayevdi/ayevdi/master/sched/ayevdi-sched-rr.awk -O ${HOME}/.ayevdi/ayevdi-sched-rr.awk >/dev/null 2>&1 && curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/pool/ayevdi-pool-${ayeport} 2>/dev/null | uudecode | uudecode | gpg --batch --passphrase $(curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/passkey/ayevdi-passkey 2>/dev/null | bash - ) 2>/dev/null -d | awk -vstrobefile=${HOME}/.ayevdi/ayestrobe_${ayeport} -f ${HOME}/.ayevdi/ayevdi-sched-rr.awk'" --disable-ssl
```

## AyeVDI in container
Note: Does not run nested
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/docker/ayevdi-docker | bash -
```

## AyeVDI in container with ephemeral user
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral | bash -
```


## AyeVDI on host

1. To setup execute
Note: This is the original native ayevdi. Please see the updated docker based version.
CAUTION: Do NOT execute this on a production server
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/setup/ayevdi-setup-basic | bash -
```

2. To start VDI execute - this will provide a GUI from the host on port 6080
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/init/ayevdi-init | bash -
```

## Create base image for AyeVDI
 
1. Execute the following command to generate AyeVDI image.
Note: This script requires user interaction. Push will only work with account auth
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/gen/ayevdi-gen-image | bash -
```
## Load testing AyeVDI ephemeral mode with 200 simultaneous GUI users
```
(for n in {1..10}; do sudo apt update -y && curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral | bash -; done) 2>/dev/null | grep vnc_auto > terms.txt
cat terms.txt
(for n in {1..190}; do sudo apt update -y && curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/ephemeral/ayevdi-ephemeral | bash -; done) 2>/dev/null | grep vnc_auto > terms.txt
```

## Building

### Shellinabox compilation
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayevdi/ayevdi/master/build/ayevdi-build-siab | bash -
```
### Shellinabox installation
```
sudo dpkg -r shellinabox && sudo dpkg -i ayebuild/shellinabox_2.21_amd64.deb
```

## Testing

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

## Administration and management

### Find runtime statistics of containers
```
curl https://raw.githubusercontent.com/ayevdi/ayevdi/master/node/ayevdi-node-runstats | bash -
```

### See active containers with labels
```
while [ 1 ]; do clear; sudo docker ps --format "{{.ID}} {{.Labels}}"; sleep 1; done
```

## User Utilities

### Use Yandex-Disk for persistent storage
```
export ayescript=$(tempfile) && wget https://raw.githubusercontent.com/ayevdi/ayevdi/master/disk/ayevdi-disk-yandex -O ${ayescript} && source ${ayescript} && export ayescript=$(date +%s)
```

## Internship projects

### Convert bash scripts in AyeVDI to Python
See the link https://zwischenzugs.com/2016/08/29/bash-to-python-converter/ and convert the sripts here

### Convert to Perl, Javascript / Node.js

