  
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
   curl -L --output cloudflared.rpm https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-x86_64.rpm && 

   sudo yum localinstall -y cloudflared.rpm && 

   sudo cloudflared service install eyJhIjoiMTNiMjExNTZhMmI0ODcwOTcxMjcxMDI2YjU4YzcwNDgiLCJ0IjoiZDk0YzVjMDUtZjYxNS00Nzg2LWI1NDEtZGI1NzE0ZjdhYmI2IiwicyI6IlkyUTROamt4TnpBdE5ESTVNaTAwWkRBeUxUbGpNV0V0Wm1ObE5EZGhZVFV5TXpNdyJ9
