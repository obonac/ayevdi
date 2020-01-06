# AYESEC:POST_MD5('18 lines')=9e65a33c9f13130a71e5588e1211b9d2
# AYESEC:STATUTORY_HEADER
if [ "${ayevdi_sourcefrom}" != "${HOME}/.ayevdi/ayevdi-sourcefrom" ]
then
  echo "AyeVDI by https://ayeai.xyz"
  echo "Copyright (C) 2019-2020 Abhishek Choudhary"
  echo ""
  echo "NO WARRANTY, and ZERO LIABILITY (Limited to INR 1/- only)"
  echo "Further usage of these software, artifacts or methods"
  echo "are subject to the 'latest' license agreement avaialble at"
  echo "https://raw.githubusercontent.com/ayeai/spl/master/LICENSE"
  echo ""
  echo "AyeVDI not activated. Please use the following command to"
  echo "activate AyeVDI"
  echo '  ayesh=$(tempfile) && wget https://bit.ly/ayevdi-sfrom-init -O${ayesh} -q && . ${ayesh}'
  echo ""
  exit
fi
# AYESEC:STATUTORY_HEADER_COMPLETED
# AYESEC:PREV_MD5('18 lines')=9e65a33c9f13130a71e5588e1211b9d2

BEGIN {
        start=0;
        nodes=0;
        cntr=0;
        print "Using strobefile " strobefile
        system("mkdir -p $(dirname " strobefile ")")
        system("touch " strobefile)
        getline strobe < strobefile
        print "Read strobe value " strobe
        strobe=strobe+1;
}
/.*/ {
        if (start==0){
                nodes=$0;
                start=1;
                #The first input line has node count
                #hence the actual strobe targets will
                #be at strobe + 1
                if (strobe>nodes){
                        strobe=1;
                }
        }
        cntr++;
        #print nodes,cntr,strobe
        if (cntr==(strobe+1)){
                target=$0;
                print strobe > strobefile
                print target
                print "policy: rr target " target
                print "target "target" on strobe " strobe
        }
}
