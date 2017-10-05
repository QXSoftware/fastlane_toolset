#!/bin/sh

# skip fastlane autoupdate check
export FASTLANE_SKIP_UPDATE_CHECK=1

fastlane
