set -o pipefail

RED="\033[31m"
NORMAL="\033[0;39m"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export LC_ALL=en_US.UTF8
export DEBIAN_FRONTEND=noninteractive
export TERM=xterm

cd ~/

rm -rf ~/citool
git clone -q --depth=1 --branch=master https://github.com/vexor/vx-citool.git ~/citool || (
  rs=$?

  echo -e "${RED}The command 'git clone -q --depth=1 --branch=master https://github.com/vexor/vx-citool.git ~/citool' failed with code $rs${NORMAL}"

  exit $rs
)



echo LS0tCi0gbmFtZTogY2xvbmUKICB0YXNrczoKICAtIHNzaF9hZ2VudDoKICAgICAga2V5OgogICAgICAtIHwKICAgICAgICAtLS0tLUJFR0lOIFJTQSBQUklWQVRFIEtFWS0tLS0tCiAgICAgICAgTUlJRXBBSUJBQUtDQVFFQXBNa2FtK21od0NkQ1FkcXR1N1U5cDVWUkZta3JiaTlIYUEzdmFncGhNdnlyeVdxeAogICAgICAgIEM5c1krYW44akNOUlVwZWx5ako4ZjZiNi9WNWg0V2NubHdwT3ZWR0duczRIT2JuWWo4OUdLb0JGK1FwVDI4bXAKICAgICAgICBDTWkwa3pITlNXTVJaZy9kOXgzQWYyY0RJZ0poZ0dLZEtMaE9iK1NKMmlSektBNnl3bXlOVHJVQjR0SmhwZ0ovCiAgICAgICAgUEExbEdsWVhrR2FkMktSQWZnN21UY3VRcnFMSjRxaTJYZGdBSGN0SVNOOXdVZGJFMXg1SEZQeXp1a3dLdUJBRQogICAgICAgIGg3bTZWVnJKenNrS05yQnN1T1ZTWnVRNnJ2OVRpcVdYVnBBWGdyV3ZLenRsZjNTTkF0dG1BQmI1ZDJ1UE9hMisKICAgICAgICByZUNXRXpIYldPRmdNUURRc1hzUzNycUMzZnp3NFZNS1JRd1hJUUlEQVFBQkFvSUJBRGdaT3BUUGtjQmYzUitjCiAgICAgICAgT2I4SWNZZm12bWM1d0k1UFRDanhiWXNWSTRmL0d1Q0VFT2Z2Vys1SzMyNDU2OHFKVStpbERWdEwxbkNCUENOSAogICAgICAgIFFlUWFuem0yVW5VbndLLzNRL0daWjlLNlBwZ00yd1djL28yOS9qT0tKZEFSQ1BCTkFJekxOU2hxUWxmR3BialcKICAgICAgICBXWmh1UGsyN2FPNjVyL1o0SW9Vci9XTkpIZTVBa3Y1Rk1mc2VBWit6bEFIQTMyUXFOZ2dPZWl0NjVHaW8yY0l1CiAgICAgICAgWURLSTVOcjFpaVNxM0pNZkVadm1jLzVRZWRVOVU3REllTld3amk4cEd6RmtGOHhodTZFeTlocEdSMlU3Z0VxUgogICAgICAgICtkeVNud2k4K3Fhc3BvZjhyZ3VHZVNVWlZtb1RHbWZZVUVuejFacEpWYVFpQUJrYVZYd0FEYWhodmU4dGQxVHIKICAgICAgICA3aDFiK1EwQ2dZRUExdkRwN09rbFd5dkZpZVBZdTRybG5talZLTnY2a2JVVUx0T2l4OXlLV2JBcFk2bGpwWWhTCiAgICAgICAgeWlnaXFWNmppVm9yQzFDbGNYUFdwV3NIb3NkK3A2RFJhYTBNaXFEMldKUFNYbmRDb21HUnNPckNlTzdEckxXbAogICAgICAgIFVDUkhsMU9sY1JIY3V4U3FWREgrQ0NxVytOQzRKeFVLYzIyT3pJK2thS1RydWozczlYa2VmSU1DZ1lFQXhFTjYKICAgICAgICBCN3hBTlk5Y2ViMVhvZXYzWjdBV0loTFBROEdQWjNLU1NtejFaZHAxMU1Ob3V4UkpCekRTNGs2NFF2Mm40NEpQCiAgICAgICAgVStrYlhTanZuQ3lJVENqVGV2RElzS3hIdE8wd09MRXdCNUxDQnpwSlRFc2p3R1pjVFAwQU92NmRxd0p3TFBwbQogICAgICAgIHlzaVRyTEZCSDVTZFZzVE10OFVKRnhaMzNzRFdIWnZTbzBwMjFJc0NnWUI2ODhyTWs3Mmp2cEU4UkpMcERSWTIKICAgICAgICBuSDg2NVVNYmNIc0FJbDRlZCtESVYwWUYxWkxEMFF5U3lZeXlXQW15ZTFyZUdSN2FuRW52ekI3TkZkTTByb0M4CiAgICAgICAgTTVwVi9xZU1tZHFmNFJiRDdvNDVwc0RpRHFydU0rWkJ4czhSR0c4dUUrcXhOYXdOaDU5cUtucThFQ0VYY2lqTgogICAgICAgIFNLR0VFTE1halNTdkg5ZFp3QlFaWXdLQmdRQ2NCaGlJOWJzRjJVWm04WU10RW0zSVhFLzhIbi92R1gxcmU4V1kKICAgICAgICByUzRaSHFiMTBiTDhwbyszeTdTYWZJSTNuM2RNZ2xlV0dZYkxkTE9uc0M5YWZFcERQaEFOZzZndHlUSEFuL3ZTCiAgICAgICAgeVhTK1VqUGJGeEVBNzE4SlJVaGRuZlN4OG1wREYzMklVQlEyQVdRSU94a3AxYUg1cGdZbitKQ3E0UnBXeDMyWQogICAgICAgIG1xWUZLUUtCZ1FDYkVzdllsZmVXSkRpK0NCSCt6aGZrZldJWTlTaXl1SEVVUWE0aE5iYVMvRGtETWdxTjU4Q3UKICAgICAgICA4Z1hHU2Z0RWlUY0xhdDBhMFA2dmVhY2dQS3VoQUhlMUs3aDg0K1IwckUvY3YxUVRCcFczOFJRZ2FiTHMrZXh5CiAgICAgICAganlGNVIxTkhJL0xYc0RCTmFpUjA1c3JYZGlTWnVtTDBhd1g3cmlDNER6SWs2WlpZUmRibmJRPT0KICAgICAgICAtLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQogICAgICAtIHwKICAgICAgICAtLS0tLUJFR0lOIFJTQSBQUklWQVRFIEtFWS0tLS0tCiAgICAgICAgTUlJRW9RSUJBQUtDQVFFQXArc0lXay9YNjJBYTdGdWVaT0p6WGpSTFJ5cEtBbVVDK3dMTHYyUnNKVHFGdExPcgogICAgICAgIHBGVWZPY0R1WFlDUFdjZ3hjYlJEenQ5TGZUYk9kNTFRSW45QnpLeXRubEVDV1dlUXMwL2J5MjVLN2JMVkpZaDgKICAgICAgICBWTm1Gb2h6aVBjbDhHTCtnMFBQd2Z5WmFhTGVTWGlJcVlKMy9Dd3k5Q1c3eG9nOFhvV21XODFud2lYYWlJY3BFCiAgICAgICAgVWt0cTQ4VlJiR2x6WWlXYU15MlN0NDh1UmFES0ZhdERrcmNoU3RrQWt0U2YwYm9maU41WEZSaU5mUTVwdDBFZQogICAgICAgIDVzM1RYR2hNWXpQU08xbWw4OGJ4QkRDa3ZKOFZjaUFUTE5TWjhLVFl2YkpHcmdQYnZHeWNsVzF2OVNCQmNNWHIKICAgICAgICBXaFpQTDc1aDI0elVLd3RtZ0swZnZ6MTMvYnZYZHhQbE9Zby9sd0lEQVFBQkFvSUJBUUNEZ21pZFNwRUJiOWhHCiAgICAgICAgS284SDFlNmk1ZlBhL1h6UEdVdFhTVjVIUENBU25CM2hZeUhYWnk4NGJTaUNKRkNnOFZBQUREMWJCTGk3alRQdwogICAgICAgIHJFejVaNDhoL0U5UmdZS0VnTDdzSUd3MGkrRzAvZTAvSXdDMDkxTllucVIxM1pvS1MvSm9FOVRUMERiWWNvVDQKICAgICAgICBvbXRzRmZHTU51TEtRNUNNNnFNSU1Ja2ZkOTRSMlluYWJuWjhvNk9WNnRldnIzbTNQWldYRDlCOUY4ZElmTllMCiAgICAgICAgeWNZSi9lUVErSjk4dThVcVVVT091Z2puNE5TQy9rdGRPMmZBUGJTSDMrWEs4Vzc1Q251aDJZL2RialRyYUlqcAogICAgICAgIE1lNW52UWE4Y1BITlNvbkNDZXFCb2RuRExwSUpKM0FJYlFtZXFVclVNV3hVN2J5cFR2b0Q0SG9OUEZpaWgyQzcKICAgICAgICAreGNpWURGUkFvR0JBTk1vYlErYU1PUExVMEVLL0p3eUNUakxVTFFneDBlaW9LK3ZYYkJCbHJwSUhBYVdXL0JqCiAgICAgICAgb1FNQlRQQ0lrQlVybDJnbjg1TmNtZ0J0NEZhRmV2SUVzUW9ReGxnbk12d2o3M2x2UTFmTEpDa0pqbXhsck0wdgogICAgICAgIGdHYkt0aVVoYWFvM1RKc2p3dXZsRG1SMnFRbnJXZVQ5NVFvNkpiNE44alU5akNpUWVNWFdBMXMvQW9HQkFNdVQKICAgICAgICA0UldQbVRVV0RLTTJ0ZFptdTk3bis2S3JCNEJVUTk0TDFBN0lKWTNucUN1N0phMDY1eWFualBrd3pwTDdvNE9QCiAgICAgICAgUjNTTWRGNjNsZEtiL252TTJwSld1Q1gwREYySGtQQmJ1a096T3RTVC9zdXRHb2c0UTY2cHpLSjRxQlFyR1MwYwogICAgICAgIHM0RThtemdVSkNpOUZKWXNBbTJPOFJiNnRIU1pBMnZ6T0hUdkt6MnBBb0dBWWFVV0dkcnh0TVUzY0tLR0FpeloKICAgICAgICBPdHc2SzdIa3RXbXM2TkV0Zis0MHAxdmxLZDZxRVZYaEJTUzYwWmcxR0xVWnhONkVzcVpseU1FR3RydnZDSy9HCiAgICAgICAgdHFMZk5iQ2EwU0pGQVdERVFYcjg4OFVwaVZMVFArY3hkMWRTTjRWbCtZS3MrQ2puWUhLQjMwOUlDQUEvaDdjcAogICAgICAgIERUdXFiR0xDbUlBbnFqSjB4dmVhZ2IwQ2dZQUVoMnV3Z1J0VmRRSWU5MjZnTUhUcGhwdXdpTUdIOTFmekxxd3YKICAgICAgICBFQURWNFZ0NmJaVnUveXA1VDZ6eE5rYkNPbHJ1NkZjY25xdFFHQ0Y3S0FGSFc4MVpDQmpjcjBzL0lXNzJDZlJnCiAgICAgICAgNFRIajNNOEVWUHVNSUVSUk5ISGJBM2dweXJPcXIwTEhFMFFZd1VuMHBoQTVMdzEyeG9GU2s0MUVNc3RDc1l5RgogICAgICAgIC9YUW0wUUovU1E2aEp2TlEwa3I0WnI4TGhmNXhNVWJYUWVpa3ZQV1NQUmREZDU0SEFEVjVUVVRHN0pNZjVBeEkKICAgICAgICBrMHlZSDNKT2NFdnp0aUpkYjNjWTZxZFZXWlRRc2szQ0Iyd3lTSVNwR0J4WkFqaUJ5TmdLeWwxci9VTDFseW5QCiAgICAgICAgN05HcnNhTFZiZHlmeVpGRDNaMWF4UnVJM0ZmR21iMmV4QmRtRXVjeWhteHc4Rzc4eGc9PQogICAgICAgIC0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCiAgICAgIC0gfAogICAgICAgIC0tLS0tQkVHSU4gUlNBIFBSSVZBVEUgS0VZLS0tLS0KICAgICAgICBNSUlFcEFJQkFBS0NBUUVBNzZJK0U2dStKZFR1OCtYNFoyRCszOFdTL0NuODRLaTZjSmNUVnVpK3RhYmthdWYzCiAgICAgICAgL1hLYlhDeEpoZFBtN253RHJobzFHL1hiOXY3eEI2c0oxYUhxV21WbVB6MWtWZitFbnl4RUt1UnFETWhOcHBNQgogICAgICAgIE5CcHljTVVEMG1oT1RDVjd6M1VVRUtPNnFrdHozcXZhMmV4QkJwSGlHaG94ZUpXWHE0T2txR2o1S0ozVUdld1cKICAgICAgICBKcWRxK3FyMmJzcDJWcVlrNFFMVlVLVDBKMGVNSDJDVTRBRU5EMFlwT3B4ckQ3QU9qL0pzaWdMdmYvK24rTXYrCiAgICAgICAgMWlvdWJSenN0TlRFZnhXK1hyOUhISlVsUGZ2VUZhVE5Dck1QWVNGKzRjS2lUTm1JZ2daa0hiYlJxaUNudVBsVQogICAgICAgIGZ4Q3FrcHlnV3JqeXJpR2VtTE9DZkRUMFN4RnNRVHFyN2hJR1V3SURBUUFCQW9JQkFIUTdVYmpnMkw0bzVpNVAKICAgICAgICBJWW1qTm56N3JDdTdnZmpHWG9nMS94OXNqUFEzR3h2dm9BM0RCVEJVR3VWYXZ1eDJJcUxUKzJhd2ZoenowNTFRCiAgICAgICAgak5pZVRMbkQ3VEJIYXQ5N3JLdzRJR2hkbWtMUTlUa1NuTWJVL1NWTnFtam9SdklRVEZsNEJGOTl5eERHd0ZFRgogICAgICAgIE1vWDVYaUQ5cVpuWGtwOVdqOWFWWjh4My9rS0FPeE5aMGswc2YwZktQT3BiTGsveWxYTERrM0d5cFBtSkZsQ0sKICAgICAgICAxZ2xzVWh3akx5bEYwaXZKSUFSbDJSaFF3WG9leFlhRDhsckVzUlVMRU15SG9MWlgvbUticmhzdlV5WDRjOUUxCiAgICAgICAgd3RjNVpEOHR6ZFM2RXNUaktqNVdvTnF6SEVaTFRtTVZZRlJOejgwSWVFSEwyMVYyM25OeHNwR1ArZHJTOW10bgogICAgICAgIG5hUGp2c0VDZ1lFQStqcHo2eEtxV1V3U05OcVFDUUF0bFF2KzFOMWlBRWVtUjBsSzYvVFlxUHRocHFwV0VMSzEKICAgICAgICBDRUR5R2szNnRMcnR3Q25zejdzREZZa3IwMkx6VjZzTlhheGxYQlBaamQ4NUJLczF5SmZXMWR4dTVGc1M2VVo4CiAgICAgICAgYkpwU0ZvNHMxL0pib2ZGTVZXdVUyMXZQNUlISmNicHVhZDlWUE5CMVRubUNWbnRWVmRaWkhLa0NnWUVBOVNrNwogICAgICAgIEhFemEydEg4clM3aVVXcHZvS0w2M2htNVFFQUhNWDYrcWJDSzV6ODl6NjNHUHFXUUpHSTN0MTRBbk41alAwb1QKICAgICAgICBoaGUyckhJeDdmNzk5TWtDa3N5LzVtZU91ejdYT0JpUkVRbERSNWRNN2hFOHNWV1BtQ3dlV3lUaGNYR2N0OVlrCiAgICAgICAgT1JRMUVXUEVlZ3lqSGRwVWtFbkhvRUxQSFdlSnVrU1RKc1p2ekpzQ2dZRUE3Vldqdk1MbmIrc0hHYnAwQXhWNAogICAgICAgIEpuWktMZndNaDlkdGp3K2xVRWZiZCt0Mm8yM01VK29zYXJldTZlUXNkbDhXUWIyQ0wwVmhsM3VUWmR2a2tySmEKICAgICAgICA2dzRvMVR5K2pDRzlJd0NBOHRHUm95YUF4M2JhYVFmQjNBQkMrOEcrSnRSb3RTRDVGY3dFVkVxdzFEdUZwYWorCiAgICAgICAgTU16ek84czhlRUluclg4dFlVejlHSUVDZ1lBajAxK2c5aFl4VGVoWHduY3VJSmlwWjhlek54MGNKMzhsbTNqdgogICAgICAgIFFTNDdOc0dvbktOUXVrOERFaHRFUDRkbFpSWXB4SUJ2NHYwOTIvNHg0a1pvUkF1Tk9rQjh3ZnRZbjRsQjJFMHkKICAgICAgICBxU0RjMEY1Y2w4WS92OW9aQ2JGeDdrVEhtQ3VucmJKamFQR01WZ0Q3T09lSlVFTjFSbUxXcDR5dXBsZTVFWlpUCiAgICAgICAgWDBJdEt3S0JnUURiYWdzLzBHYUphc2ZHNGdOVHAwdnBSelhlR2hDTnNWUG03MlZOb2R2NWZBWkdVNlZnZmpweQogICAgICAgIDBRbHNIbDdjMTQ4Zmt2amozVHhyaXFSV21Fb3NJOXZqVnB0VFlqY2N0QkRoaGsrZ0Q0dWZva3FoaHRja2JmUmsKICAgICAgICBFUWV5ZGV5YktMVzQ5TWV3bTQybWpKTW0rQ0FJcE8rVFZGWVIrL1VaeEJaTjNXaEtlUE9YaUE9PQogICAgICAgIC0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCiAgLSBnaXRfY2xvbmU6CiAgICAgIHJlcG86IGdpdEBnaXRodWIuY29tOnZleG9yL3Z4LXRlc3QtcmVwby5naXQKICAgICAgZGVzdDogIn4vdmV4b3IvdngtdGVzdC1yZXBvIgogICAgICBicmFuY2g6IHRlc3QvcHVsbC1yZXF1ZXN0CiAgICAgIHNoYTogOGY1M2MwNzcwNzI2NzQ5NzJlMjFjODJhMjg2YWNjMDdmYWRhOTFmNQotIG5hbWU6IGluaXQKICBjaGRpcjogIn4vdmV4b3IvdngtdGVzdC1yZXBvIgogIGVudmlyb25tZW50OgogICAgQ0k6ICcxJwogICAgQ0lfSk9CX0lEOiAxCiAgICBDSV9KT0JfTlVNQkVSOiAxMDAKICAgIENJX0JVSUxEX0lEOiAxMgogICAgQ0lfQlVJTERfTlVNQkVSOiAxMDEKICAgIENJX1BST0pFQ1RfTkFNRTogdmV4b3IvdngtdGVzdC1yZXBvCiAgICBDSV9CVUlMRF9TSEE6IDhmNTNjMDc3MDcyNjc0OTcyZTIxYzgyYTI4NmFjYzA3ZmFkYTkxZjUKICAgIENJX0JSQU5DSDogdGVzdC9wdWxsLXJlcXVlc3QKICAgIERJU1BMQVk6ICI6OTkiCiAgICBDSV9QQVJBTExFTF9KT0JTOiAzCiAgICBDSV9QQVJBTExFTF9KT0JfTlVNQkVSOiAwCiAgICBnbG9iYWw6ICcnCiAgICBtYXRyaXg6ICcnCiAgICBSQUlMU19FTlY6IHRlc3QKICAgIFJBQ0tfRU5WOiB0ZXN0CiAgICBHRU1fSE9NRTogIn4vLnJ1YnlnZW1zIgogICAgVFJBVklTX1BZVEhPTl9WRVJTSU9OOiBweV92ZXJzaW9uCiAgdGFza3M6CiAgLSBzZXJ2aWNlczoKICAgIC0gcmFiYml0bXEtc2VydmVyCiAgLSBjYWNoZV9mZXRjaDoKICAgICAgdXJsOgogICAgICAtIGh0dHA6Ly9sb2NhbGhvc3Q6MzAwMS9yZWFkP2ZpbGVfbmFtZT10ZXN0L3B1bGwtcmVxdWVzdC9zY2FsYS0yLjEwLjMtcnZtLTIuMC4wLWdlbWZpbGUtbm9kZWpzLTAuMTAtcnVzdC0wLjExLjAtcHl0aG9uLTIuNy50Z3oKICAgICAgLSBodHRwOi8vbG9jYWxob3N0OjMwMDEvcmVhZD9maWxlX25hbWU9bWFzdGVyL3NjYWxhLTIuMTAuMy1ydm0tMi4wLjAtZ2VtZmlsZS1ub2RlanMtMC4xMC1ydXN0LTAuMTEuMC1weXRob24tMi43LnRnegogIC0gY2FjaGVfYWRkOgogICAgICBkaXI6CiAgICAgIC0gIn4vLmNhY2hlIgogICAgICAtICJ+Ly5zYnQiCiAgICAgIC0gIn4vLml2eTIiCiAgICAgIC0gIn4vLnJ1YnlnZW1zIgogICAgICAtIG5vZGVfbW9kdWxlcwogICAgICAtIGJvd2VyX2NvbXBvbmVudHMKICAgICAgLSAifi8ucGlwLWRvd25sb2FkcyIKLSBuYW1lOiBiZWZvcmVfaW5zdGFsbAogIHRhc2tzOgogIC0gc2hlbGw6IGVjaG8gYmVmb3JlX2luc3RhbGwKLSBuYW1lOiBpbnN0YWxsCiAgZW52aXJvbm1lbnQ6CiAgICBQQVRIOiAiJHtQQVRIfToke1BXRH0vbm9kZV9tb2R1bGVzL2JpbiIKICB0YXNrczoKICAtIHNjYWxhOgogICAgICBhY3Rpb246IGluc3RhbGwKICAgICAgc2NhbGE6IDIuMTAuMwogIC0gcnVieToKICAgICAgYWN0aW9uOiBpbnN0YWxsCiAgICAgIHJ1Ynk6IDIuMC4wCiAgLSBydWJ5OiBhbm5vdW5jZQogIC0gdnh2bTogbm9kZWpzIDAuMTAKICAtIHNoZWxsOiBucG0gY29uZmlnIHNldCBzcGluIGZhbHNlCiAgLSBzaGVsbDogbm9kZSAtLXZlcnNpb24KICAtIHNoZWxsOiBucG0gLS12ZXJzaW9uCiAgLSB2eHZtOiBydXN0IDAuMTEuMAogIC0gc2hlbGw6IHJ1c3RjIC0tdmVyc2lvbgogIC0gcHl0aG9uOgogICAgICBhY3Rpb246IGluc3RhbGwKICAgICAgcHl0aG9uOiAnMi43JwogIC0gcHl0aG9uOiB2aXJ0dWFsZW52CiAgLSBweXRob246IGFubm91bmNlCiAgLSBzaGVsbDogZWNobyBpbnN0YWxsCi0gbmFtZTogZGF0YWJhc2UKICB0YXNrczoKICAtIHJ1Ynk6IHJhaWxzOmRhdGFiYXNlCi0gbmFtZTogYmVmb3JlX3NjcmlwdAogIHRhc2tzOgogIC0gc2hlbGw6IGVjaG8gYmVmb3JlX3NjcmlwdAotIG5hbWU6IHNjcmlwdAogIHRhc2tzOgogIC0gc2hlbGw6IFJBSUxTX0VOVj10ZXN0IGxzIC0xICYmIGVjaG8gRE9ORSEKLSBuYW1lOiBhZnRlcl9zdWNjZXNzCiAgdGFza3M6CiAgLSBzaGVsbDogZWNobyBhZnRlciBzdWNjZXNzCi0gbmFtZTogdGVhcmRvd24KICB0YXNrczoKICAtIGNhY2hlX3B1c2g6CiAgICAgIHVybDogaHR0cDovL2xvY2FsaG9zdDozMDAxL3dyaXRlP2ZpbGVfbmFtZT10ZXN0L3B1bGwtcmVxdWVzdC9zY2FsYS0yLjEwLjMtcnZtLTIuMC4wLWdlbWZpbGUtbm9kZWpzLTAuMTAtcnVzdC0wLjExLjAtcHl0aG9uLTIuNy50Z3oK \
  | base64 --decode | ~/citool/bin/vx-citool -

exit $?
