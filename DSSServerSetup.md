1. ติดตั้ง net-tools

   ```cmd
   sudo apt update
   sudo apt install net-tools
   ```


2. ติดตั้ง Curl และ Telnet

   ```cmd
   sudo apt install curl
   sudo apt install telnet
   ```

3. ติดตั้ง libsecret และ odbc-mariadb

   ```cmd
   sudo apt install libsecret-1-0
   sudo apt-get install odbc-mariadb
   ```

4. ติดตั้ง OBDC

   https://mariadb.com/kb/en/mariadb-connector-odbc/

   https://mariadb.com/docs/server/connect/programming-languages/odbc-api/install/

   ```cmd
   tar -xvzf mariadb-connector-odbc-3.2.3-ubuntu-jammy-amd64.tar.gz
   
   cd mariadb-connector-odbc-3.2.3-ubuntu-jammy-amd64
   
   sudo install lib/mariadb/libmaodbc.so /usr/lib/
   sudo install -d /usr/lib/mariadb/
   sudo install -d /usr/lib/mariadb/plugin/
   sudo install lib/mariadb/plugin/* /usr/lib/mariadb/plugin/
   
   sudo apt update
   sudo apt install unixodbc
   
   #กำหนด Library Path
   sudo nano /etc/odbcinst.ini
   
   [MariaDB ODBC 3.2 Driver]
   Description=MariaDB ODBC Driver 3.2
   Driver=/usr/lib/libmaodbc.so
   UsageCount=1
   ```

5. เปิด Port DSS และ UE5

   !! ห้ามลืมใส่ Port 22

   ```cmd
   sudo ufw status
   sudo ufw enable
   sudo ufw allow 22/tcp
   sudo ufw allow 5000/tcp
   sudo ufw allow 7770:7870/udp
   sudo ufw allow 19999/tcp
   ```

6. xxxxxxxxxx exitcmd

   ```cmd
   sudo apt update
   sudo apt install screen
   ```

7. วิธี Unzip

   ```cmd
   sudo apt update
   sudo apt install unzip
   unzip file.zip
   ```

   

