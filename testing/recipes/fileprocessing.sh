#!/bin/bash
#
# This file is part of fadecut
# https://github.com/micressor/fadecut
#
# fadecut is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# fadecut is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with fadecut.  If not, see <http://www.gnu.org/licenses/>.

main()
{
pushd .
TestFolder="$1"
cd "$TestFolder"/testdir
cp "$TestFolder"/testfiles/test_source/*.mp3 .
mkdir -p "$HOME_FADECUT"/profiles/
echo \
"STREAM_URL=\"http://fctest_fileproc_mp3\"
GENRE=\"fadecut testgenre\"
COMMENT=\"fadecut test fileprocessing mp3\"
# all values in seconds:
FADE_IN=1
FADE_OUT=4
TRIM_BEGIN=0
TRIM_END=0" > "$HOME_FADECUT"/profiles/fctest_fileproc_mp3
# start test
$BIN_FADECUT -p fctest_fileproc_mp3
# eval test results
# ... todo ...
# cleanup
rm -rf error new orig
popd
# if all ok, return with errorlevel 0
return 0
}


main "$1"
if [ $? -ge 1 ]; then 
  exit 1
else
  exit 0
fi

