#!/bin/sh

# skip fastlane autoupdate check
export FASTLANE_SKIP_UPDATE_CHECK=1

# to use /usr/local/bin/fastlane
export PATH=/usr/local/bin/:${PATH}

lane=''
xcodeproj=''
plist=''
build_number=''
build_version=''
ipa_path=''

while getopts "l:x:p:n:v:o:" opt; do
	case $opt in
		l)
			lane=$OPTARG
			;;
		x)
			xcodeproj=$OPTARG
			;;
		p)
			plist=$OPTARG
			;;
		n)
			build_number=$OPTARG
			;;
		v)
			build_version=$OPTARG
			;;
		o)
			ipa_path=$OPTARG
			;;
		\?)
			exit -1
			;;
	esac
done

function ShowUsage
{
	echo "$0 -l lane -x xcodeproj -p plist -n build_number -v build_version -o ipa_path"
}

if [[ ${lane} == '' || ${xcodeproj} == '' || \
	${plist} == '' || build_number == '' || \
	build_version == '' || ipa_path == '' ]] ; then
	ShowUsage
	exit -1
fi

fastlane ${lane} \
	xcodeproj:${xcodeproj} \
	plist:${plist} \
	build_number:${build_number} \
	build_version:${build_version} \
	ipa_path:${ipa_path} \

if (($?)); then exit -1; fi

say 'fastlane build success!'
