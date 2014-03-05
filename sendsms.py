#!/usr/bin/python

import sys

from googlevoice import Voice
from googlevoice.util import input

voice = Voice()
voice.login()


voice.send_sms(sys.argv[1], sys.argv[2])
