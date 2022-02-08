#!/bin/bash

# This script fixes the issue with Yubikey stored GPG keys where it "caches"
# the saved key locally. If you have multiple yubikeys that are exact copies of
# each other, GPG will think you are using the wrong key.
# See: https://security.stackexchange.com/a/223055

gpg -K --with-keygrip FF404ABD083C84EC | grep Keygrip | cut  -d' ' -f9 |
  xargs printf -- '/home/aos/.gnupg/private-keys-v1.d/%s.key\n' | xargs rm 2>/dev/null

gpg --card-status > /dev/null
