# AyeVDI - Virtualized Deployment IaaS (VDI) by AyeAI

Copyright (C) 2019 Abhishek Choudhary
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
```
wget https://bit.ly/ayevdi-sfrom-init -O- -q | . /dev/stdin
```

## Utils

### Get lines and md5sum
```
(cat | tee >(echo LINES=$(wc -l)) >(echo CSUM=$(md5sum)) >/dev/null) && echo ""
```

bit.ly mappings
https://bit.ly/ayevdi-sfrom-init https://raw.githubusercontent.com/ayevdi/ayevdi/master/ost/ayevdi-sfrom-init
