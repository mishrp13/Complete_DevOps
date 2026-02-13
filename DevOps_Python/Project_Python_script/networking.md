🧠 Linux Networking Commands (Pure Explanation)
1️⃣ ip a (MOST IMPORTANT)
What it does

Shows all network interfaces on the system and their IP addresses.

Why DevOps uses it

Check server IP

Debug “server not reachable” issuesl

Verify network configuration

Think of it as:

“Show me my machine’s network identity”

Key things to look for

Interface name: eth0, ens33, lo

inet → IPv4 address

UP → interface is active

2️⃣ ip r
What it does

Shows the routing table

Why DevOps uses it

Check how traffic leaves the server

Debug internet connectivity

Verify default gateway

Think of it as:

“Which road does my traffic take to reach the internet?”

Important line
default via 192.168.1.1


Means:

This is the gateway

All external traffic goes through it

3️⃣ ping
What it does

Checks if another system is reachable

Why DevOps uses it

First step in network troubleshooting

Test connectivity

Think of it as:

“Are you alive? Can you hear me?”

Example logic

Replies → network works

No replies → network issue, firewall, or server down

4️⃣ ss -tuln (Modern replacement for netstat)
What it does

Shows listening ports and services

Why DevOps uses it

Check which app is running on which port

Debug “port already in use”

Security checks

Think of it as:

“Which doors are open on this server?”

Key flags

t → TCP

u → UDP

l → listening

n → numeric (faster, no DNS lookup)

5️⃣ netstat (Older but still used)
What it does

Shows:

Active connections

Listening ports

Network statistics

Why DevOps uses it

Legacy systems

Interview questions 😄

Think of it as:

“Who is talking to my server right now?”

6️⃣ curl (VERY IMPORTANT)
What it does

Sends HTTP requests from the terminal.

Why DevOps uses it

Test APIs

Test web servers

Health checks

Debug microservices

Think of it as:

“Open this URL and show me the response”

DevOps meaning

Response received → service is up

No response / error → service problem

7️⃣ wget
What it does

Downloads files from the internet.

Why DevOps uses it

Download binaries

Fetch artifacts

Bootstrap servers

Think of it as:

“Download this file without a browser”

8️⃣ traceroute
What it does

Shows every hop your packet takes to reach a destination.

Why DevOps uses it

Find where network traffic is failing

Diagnose slow connections

Think of it as:

“Show me every router my request passes through”

9️⃣ nslookup
What it does

Checks DNS resolution

Why DevOps uses it

Debug domain issues

Check if DNS is working

Think of it as:

“Convert domain name into IP address”

Important DevOps insight

If DNS fails → app won’t work even if server is up

🔟 dig (Advanced DNS check)
What it does

Detailed DNS lookup.

Why DevOps uses it

Deep DNS troubleshooting

Production outages

Think of it as:

“Explain exactly how DNS answered this request”

1️⃣1️⃣ nc (netcat)
What it does

Tests if a port is reachable

Why DevOps uses it

Check firewall rules

Test service availability

Think of it as:

“Is this port open and reachable?”

1️⃣2️⃣ telnet
What it does

Connects to a port manually.

Why DevOps uses it

Legacy systems

Quick port checks

Think of it as:

“Manually knock on a service door”

🔁 How DevOps engineers actually troubleshoot (IMPORTANT)
Real-world order:

ip a → Do I have an IP?

ip r → Do I have a gateway?

ping → Can I reach the network?

nslookup → Is DNS working?

ss -tuln → Is service listening?

curl → Is application responding?