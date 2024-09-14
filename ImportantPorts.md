### Port ที่จำเป็นจะต้องใช้

```cmd
sudo ufw status
sudo ufw enable
sudo ufw disable
```

**SSH (พอร์ต 22)**: สำหรับการเชื่อมต่อ SSH (ถ้าคุณใช้พอร์ตอื่นสำหรับ SSH ให้ระบุพอร์ตนั้นแทน)

```cmd
sudo ufw allow 22/tcp
```

**HTTP (พอร์ต 80)**: สำหรับเว็บเซิร์ฟเวอร์ที่ให้บริการเว็บไซต์ผ่าน HTTP

```cmd
sudo ufw allow 80/tcp
```

**HTTPS (พอร์ต 443)**: สำหรับเว็บเซิร์ฟเวอร์ที่ให้บริการเว็บไซต์ผ่าน HTTPS

```cmd
sudo ufw allow 443/tcp
```

**MariaDB/MySQL (พอร์ต 3306)**: ถ้าคุณใช้ MariaDB/MySQL และต้องการให้การเชื่อมต่อภายนอกเข้าถึงได้

```cmd
sudo ufw allow 3306/tcp
```

**SMTP (พอร์ต 25, 587)**: สำหรับการส่งอีเมลผ่านเซิร์ฟเวอร์ SMTP

```cmd
sudo ufw allow 25/tcp
sudo ufw allow 587/tcp
```

**DNS (พอร์ต 53)**: ถ้าคุณรันเซิร์ฟเวอร์ DNS หรือใช้บริการ DNS ภายใน

```cmd
sudo ufw allow 53/udp
```

