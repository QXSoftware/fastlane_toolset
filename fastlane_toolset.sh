#!/bin/sh

# skip fastlane autoupdate check
export FASTLANE_SKIP_UPDATE_CHECK=1

# to use /usr/local/bin/fastlane
export PATH=/usr/local/bin/:${PATH}

xcodeproj=''
plist=''
build_number=''
build_version=''
ipa_path=''

while getopts "x:p:n:v:o:" opt; do
	case $opt in
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

fastlane ${lane} \
	xcodeproj:${xcodeproj} \
	plist:${plist} \
	build_number:${build_number} \
	build_version:${build_version} \
	ipa_path:${ipa_path} \

if (($?)); then exit -1; fi

say 'fastlane build success!'
