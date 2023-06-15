#run as su - novaseq6000
cd /var/GeoMxNGSPipeline
newgrp sequencing-technology
umask 002
export ASPNETCORE_ENVIRONMENT=Production
export DOTNET_PRINT_TELEMETRY_MESSAGE=false
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
nohup /var/GeoMxNGSPipeline/GeoMxNGSPipeline_API &

