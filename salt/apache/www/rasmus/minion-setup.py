import sys, os
import subprocess

DEFAULT_MASTER_URL = "ziva.wejlgaard.com"
info = {}


def gather_information():
	info['hostname'] = raw_input("Enter hostname to be used: ")
	info['master_url'] = raw_input("Enter Master URL[{}]".format(DEFAULT_MASTER_URL))
	if info['master_url'] == '':
		info['master_url'] = DEFAULT_MASTER_URL


def change_hostname():
	print("Setting hostname to: {}".format(info['hostname']))
	os.popen('echo "{}" > /etc/hostname'.format(info['hostname']))


def bootstrap_salt():
	print("Bootstrapping salt..")
	show_output_bool = None
	while show_output_bool != True and show_output_bool != False:
		yn_input = raw_input("Do you want to see the output?: ")
		if yn_input.lower() in ['y', 'yes', 'ye']:
			show_output_bool = True
		elif yn_input.lower() in ['n', 'no']:
			show_output_bool = False
		else:
			print("please answer yes or no")
	print("Downloading latest Saltstack installer")
	subprocess.call("curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com".split(' '), stdout=show_output_bool)
	print("Bootstrapping...")
	cmd = ("sudo sh bootstrap-salt.sh -i {minion_id} -A {master_url}".format(minion_id=info['hostname'], master_url=info['master_url'])).split(' ')
	subprocess.call(cmd, stdout=show_output_bool)


if __name__ == '__main__':
	if os.geteuid() != 0:
		exit("This script is intended to run as root, please do so")
	gather_information()
	change_hostname()
	bootstrap_salt()
