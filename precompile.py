#!/usr/bin/python3
#-*-coding: utf-8 *-

import sys
import argparse
import os

parser = argparse.ArgumentParser()
parser.add_argument("-p", "--production", action="store_true", help="precompile in production mode")
parser.add_argument("-s", "--staging", action="store_true", help="precompile in staging mode")
args = parser.parse_args()

branch = os.popen("git rev-parse --abbrev-ref HEAD").read()

if "fatal" in branch:
	"Not a git repository : abort"
	os.exit(1)

clobber = "bundle exec rake assets:clobber"
precompile = "bundle exec rake assets:precombile"
git = "git add . && git commit -m 'Assets' && git push origin {}".format(branch)

def get_secret_key(env):
	secret_key = input("Type secret key base for environment {} : ".format(env))
	return(secret_key)

if args.staging and args.production:
	print("Only one environment can be chosen at a time")
	os.exit(1)

if args.production:
	secret_key = get_secret_key("production")
	prefix = "RAILS_ENV=production SECRET_KEY_BASE={}".format(secret_key)
elif args.staging:
	secret_key = get_secret_key("staging")
	prefix = "RAILS_ENV=staging SECRET_KEY_BASE={}".format(secret_key)
else:
	prefix = ""

precompile = prefix + precompile

cmds = [
	clobber,
	precompile,
	git
]

for cmd in cmds:
	if os.system(cmd) != 0:
		print("Error while executing cmd : '{}'".format("cmd"))
		sys.exit(1)
	else:
		print("{} ==> OK".format(cmd))


