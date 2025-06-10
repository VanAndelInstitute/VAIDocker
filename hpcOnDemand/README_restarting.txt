PREREQ
   do you have your ondemand image built? if not, make it:
   docker build . --tag ondemand:20241212
   then make sure that the compute-common-docker-compose.yml refers to this image you created

EXAMPLE FOR ONDEMANDCF3
   docker-compose -f docker-compose-ondemandcf3.yml up -d
    
copy in payloads/ood_portal_ondemandcf3.yml to container to overwrite old 
   docker cp payloads/ood_portal_ondemandcf3.yml ondemandcf3:/etc/ood/config/ood_portal.yml
 
get inside container
   docker exec -it ondemandcf3 bash
  
run 
   /opt/ood/ood-portal-generator/sbin/update_ood_portal
   systemctl restart httpd
   

reinstall cloudflared (the long key is specific to each server)
   curl -L --output cloudflared.rpm https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-x86_64.rpm  

   sudo yum localinstall -y cloudflared.rpm  

	   ondemand1 cloudflare token: eyJhIjoiMTNiMjExNTZhMmI0ODcwOTcxMjcxMDI2YjU4YzcwNDgiLCJ0IjoiM2NlNTQ5MjItNTQyNS00ZmU4LWJhNDQtNjA3MzE4ZTljZjhhIiwicyI6Ik16TmlaV0UzTVdVdE5tWXdNaTAwTTJVekxXRTBPR010TW1WaE5XRTRaREZtTURBMiJ
	   ondemand2 cloudflare token: eyJhIjoiMTNiMjExNTZhMmI0ODcwOTcxMjcxMDI2YjU4YzcwNDgiLCJ0IjoiZjc0M2VhNTktMjM5NS00YWZkLTk2Y2UtYjliZjdkMjg4YWE3IiwicyI6Ik1HTmpZalJqTlRNdE56WXhNQzAwTVdVNUxXSTNOekV0TnpnME9HWTNPRGd4TkRSaSJ9
	   ondemand3 cloudflare token: eyJhIjoiMTNiMjExNTZhMmI0ODcwOTcxMjcxMDI2YjU4YzcwNDgiLCJ0IjoiZDk0YzVjMDUtZjYxNS00Nzg2LWI1NDEtZGI1NzE0ZjdhYmI2IiwicyI6IlkyUTROamt4TnpBdE5ESTVNaTAwWkRBeUxUbGpNV0V0Wm1ObE5EZGhZVFV5TXpNdyJ9

example: 

   sudo cloudflared service install eyJhIjoiMTNiMjExNTZhMmI0ODcwOTcxMjcxMDI2YjU4YzcwNDgiLCJ0IjoiZDk0YzVjMDUtZjYxNS00Nzg2LWI1NDEtZGI1NzE0ZjdhYmI2IiwicyI6IlkyUTROamt4TnpBdE5ESTVNaTAwWkRBeUxUbGpNV0V0Wm1ObE5EZGhZVFV5TXpNdyJ9
