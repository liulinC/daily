set -ex
commit(){
	#commit and push  current change
	echo "========commit -current changes==========="
	cd repos/qemu-trad
	git commit -a --amend -m "inv xenfb_guest_copy"
	git format-patch HEAD~
	yes|cp -f 0001-inv-xenfb_guest_copy.patch ../qemu-trad.pg/master
	cd ../qemu-trad.pg/master
	git commit -a --amend --no-edit
	git remote set-url origin https://USERNAME:PASSWORD@code.citrite.net/scm/~linl/qemu-trad.pg.git
	git push -f origin master
	cd ../../../
}

compile(){
	#compile current change
	echo "========compile current change======="
	rm -rf repos
	planex-buildenv run generic -- planex-clone PINS/xen-device-model.pin
	planex-buildenv run generic -- planex-rpmake xen-device-model
}

deploy(){
	#deploy the debug build to test machine	
	echo "=========deploy========================="
	sshpass -p "xenroot" scp ./_build/RPMS/x86_64/xen-device-model-0.10.2.xs-3.0.0.x86_64.rpm root@NKGXENRT-4.xenrt.citrite.net:/root/debug
	sshpass -p "xenroot" scp ./_build/RPMS/x86_64/xen-device-model-debuginfo-0.10.2.xs-3.0.0.x86_64.rpm root@NKGXENRT-4.xenrt.citrite.net:/root/debug
	echo "deploy success"

}
case "$1" in
	"commit")
		commit
		;;
	"compile")
		compile
		;;
	"deploy")
		deploy
		;;
	*)
		commit
		compile
		deploy

esac




