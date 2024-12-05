curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh --stable-channel

sudo ufw allow 19999/tcp



หลังจากเชื่อม Netdata เข้ากับบัญชี Netdata แล้ว ให้ทำการปิด Local Dashboard

sudo nano /etc/netdata/netdata.conf

```cmd
[web]
    mode = none
```

sudo systemctl restart netdata



สามารถเปลี่ยนชื่อของ Server เพื่อแสดงใน Netdata ได้

sudo nano /etc/netdata/netdata.conf

```cmd
[global]
	hostname = your_desired_nickname
```

sudo systemctl restart netdata
