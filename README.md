# Shell functions for different cloud providers

This directory contains files providing shell
functions and aliases for use with different cloud
providers.

I'm dropping these onto GitHub primarily as a personal
backup, but if they're useful to you, hooray!

# Examples

## AWS

```
$ aws-omnios
i-03cddae6ab64100cb
$ ec2wait `aws-netbsd`
i-02e4000b052b97b6f
ec2-3-94-117-24.compute-1.amazonaws.com
ec2-user

Sleeping up to 60 seconds to wait for ssh:
......
Ready.
$ instances
i-02e4000b052b97b6f
i-03cddae6ab64100cb
$ termInstance i-03cddae6ab64100cb >/dev/null
$ running
i-02e4000b052b97b6f
$ awsListResources
You have the following AMIs in us-east-1:
ami-0669dd7b1ff900fcc snap-0c37190f3fa002bc7 "OmniOS illumos distribution"
ami-01eeb2af939d69edd snap-0aff3f645fe826271 "NetBSD/evbarm 10.0"
ami-0999f80a08a9de4cc snap-0a0aae99276d81331 "NetBSD/amd64 10.0"

You have the following snapshots in us-east-1:
snap-0a0aae99276d81331 2024-08-29T01:23:07.717000+00:00
snap-0c37190f3fa002bc7 2023-01-27T00:34:13.769000+00:00
snap-0aff3f645fe826271 2024-08-16T19:50:01.793000+00:00

You have the following instances in us-east-1:
i-02e4000b052b97b6f (running) ec2-3-94-117-24.compute-1.amazonaws.com
i-03cddae6ab64100cb (terminated)

You have the following volumes in us-east-1:
vol-0e19184ab50b62099 2024-10-11T00:30:00.599000+00:00 i-02e4000b052b97b6f

You have the following S3 buckets:
[bucket-name1]
[bucket-name2]

[bucket-name1]
Total Objects: 16
   Total Size: 163.2 GiB

[bucket-name2]
Total Objects: 2030
   Total Size: 84.3 GiB
$ awsCurrentBill
AWS Billing Period 2024-09-10 - 2024-10-10: $6.38
$ instance-id-and-names
ec2-3-94-117-24.compute-1.amazonaws.com i-02e4000b052b97b6f
i-03cddae6ab64100cb
$ kill-all-instances >/dev/null
$
```

## Linode

```
$ lin-debian
65166481
$ linwait `lin-ubuntu`
Waiting for linode 65166479 to be ready............
65166479
172.234.207.139
2600:3c06::f03c:95ff:fe0e:274e/128
172-234-207-139.ip.linodeusercontent.com
Sleeping up to 60 seconds to wait for ssh:
....
Ready.
$ linstances
65166479
65166481
$ linnames
172-234-207-139.ip.linodeusercontent.com
172-234-220-85.ip.linodeusercontent.com
$ linIPs 172-234-207-139.ip.linodeusercontent.com
172.234.207.139
2600:3c06::f03c:95ff:fe0e:274e/128
$ linIPs 65166479
172.234.207.139
2600:3c06::f03c:95ff:fe0e:274e/128
$ linSummary 172.234.207.139
ID      : 65166479
Label   : ubuntu24.04-us-ord
Image   : linode/ubuntu24.04
Created : 2024-10-11T00:52:40
Status  : running
Region  : us-ord
IPv6    : 2600:3c06::f03c:95ff:fe0e:274e/128
IPv4    : 172.234.207.139
Hostname: 172-234-207-139.ip.linodeusercontent.com

$ licl shutdown 65166481
$ linstances running
65166479
$
```
