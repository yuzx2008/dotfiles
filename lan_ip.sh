#!/usr/bin/env bash

# cp from https://github.com/erikw/tmux-powerline.git
# Prints the local network IPv4 address for a statically defined NIC or search for an IPv4 address on all active NICs.

run_segment() {
		# Get the names of all attached NICs.
		all_nics="$(ip addr show | cut -d ' ' -f2 | tr -d :)"
		all_nics=(${all_nics[@]//lo/})	 # Remove lo interface.
		all_nics=(${all_nics[@]//docker0/})	 # Remove docker0 interface.

		for nic in "${all_nics[@]}"; do
			# Parse IP address for the NIC.
			lan_ip="$(ip addr show ${nic} | grep '\<inet\>' | tr -s ' ' | cut -d ' ' -f3)"
			# Trim the CIDR suffix.
			lan_ip="${lan_ip%/*}"
			# Only display the last entry
			lan_ip="$(echo "$lan_ip" | tail -1)"

			[ -n "$lan_ip" ] && break
		done

	echo "${lan_ip-N/a}"
	return 0
}
run_segment;
