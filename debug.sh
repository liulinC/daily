sshpass -p $2 scp ./_build/default/ocaml/xapi/xapi_main.exe root@$1.xenrt.citrite.net:/root
sshpass -p $2 ssh root@$1.xenrt.citrite.net "service xapi stop"
sshpass -p $2 ssh root@$1.xenrt.citrite.net "cp -f /root/xapi_main.exe /opt/xensource/bin/xapi"
sshpass -p $2 scp _build/default/ocaml/alerts/certificate/certificate_check_main.exe root@$1.xenrt.citrite.net:/opt/xensource/libexec/alert-certificate-check
sshpass -p $2 ssh root@$1.xenrt.citrite.net "md5sum /opt/xensource/bin/xapi"
md5sum ./_build/default/ocaml/xapi/xapi_main.exe
sshpass -p $2 ssh root@$1.xenrt.citrite.net "service xapi start"
