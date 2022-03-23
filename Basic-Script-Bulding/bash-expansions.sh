#!/usr/bin/env bash
set -euo pipefail

## Purpose of this script is to show how to use bash expansions in simple tasks
## to make script less dependent on tools like awk, sed, grep, cut, tr and ...
## this is just a little of what You are able to do with expansions, to learn more
## you can read bash man pages and GNU documents

## regex we will use to validate source images in our Dockerfile
_matchMe='^registry\.yaser\.linux\/\w+(\:.*?)?@sha256:\w{64}$'

while read -r ; do 
  case "${REPLY}" in
    \#*)
        ## wont to check lines started with hashtag (comments)
        ## its simplest way, You can improve it with similar mindset
    ;;
    *)
      ## FROM <image> [AS <alias>]
      ## image is always second value if we use space as our delimiter
      ## ${1} will be FROM
      ## ${2} will be image name
      ## we don't care for the rest of it
      set ${REPLY}
      [[ "${1,,}" == "from" ]] && { 
        _image="${2}"
        [[ "${_image}" =~ ${_matchMe} ]] && { ## if image is matched with our regexp
          ## IMO `latest` tag with image footprint digest is OK but
          ## still its a bad practice, so we check for latest tag
          ## and then exit if image tag is `latest`
          [[ ${#BASH_REMATCH[@]} -eq 2 ]] && {  ## if length of matched is 2, it means image has a tag, 0 -> whole text , 1 -> first matched case in ()
            : ${BASH_REMATCH[1]/:/}             ## remove : from image tag and put it in ${_}
            : ${_,,}                            ## make all letters lowercase and put int ${_}
            [[ "${_}" == "latest" ]] && {       ## check if tag is latest
              printf >&2 '%s\n' "${_image} is using latest tag which is not allowed."
              # exit 1
            }
          }
        } 
    }
  ;;
  esac
done <<-'THIS'
# Comment
## Match
FROM registry.yaser.linux/script:v0.10.2@sha256:10683d82b024a58cc248c468c2632f9d1b260500f7cd9bb8e73f751048d7d6d4
from registry.yaser.linux/script:kKKk@sha256:10683d82b024a58cc248c468c2632f9d1b260500f7cd9bb8e73f751048d7d6d4
## will throw an error , latest tag
FROM registry.yaser.linux/script:latest@sha256:10683d82b024a58cc248c468c2632f9d1b260500f7cd9bb8e73f751048d7d6d4
## Doesn't match with regexp , wrong hash
FROM registry.yaser.linux/script:this@sha256:106c468c2632f9d1b260500f7cd9bb8e73f751048d7d6d4
## Doesn't match because it does not start with `from`
salam registry.yaser.linux/script:kKKk@sha256:10683d82b024a58cc248c468c2632f9d1b260500f7cd9bb8e73f751048d7d6d4
THIS

printf '%s\n' "finished"
