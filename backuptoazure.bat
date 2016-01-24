@ECHO OFF
set local_db=%1
set dump_file=%2
pg_dump %local_db% > %dump_file%
::ECHO sudo -u postgres psql %local_db% ^< %dump_file% > ssh_sh.sh
ECHO pg_dump file created.
PAUSE
set /p ssh_url="Please enter your ssh URL for your VM: "
set /p username="Username: "
pscp %dump_file% ssh_sh.sh %ssh_url%:/home/%username% 
ECHO Your sql dump file has been uploaded to your VM. You will now be connecting to your VM over ssh. Run the psql import command after logging into the VM.
PAUSE
ssh %ssh_url%
@ECHO ON