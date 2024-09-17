### การสำรองไฟล์ฐานข้อมูล SQL อัพขึ้น Google Drive

1. เชื่อมต่อผ่าน Putty โดยใช้ Tunnels

   ![image-20240918044143682](C:\Users\casno\AppData\Roaming\Typora\typora-user-images\image-20240918044143682.png)

2. ติดตั้ง rclone

   ```cmd
   curl https://rclone.org/install.sh | sudo bash
   ```

3. ตั้งค่า rclone เพื่อเชื่อมต่อกับ Google Drive โดยใช้คำสั่ง

   ```c,d
   rclone config
   ```

4. ดูไฟล์ในไดร์โดยใช้คำสั่ง โดย "googleDrive" คือชื่อ remote ที่ตั้ง

   ```cmd
   rclone ls googleDrive:
   ```

5. ตัวอย่างการอัพโหลดไฟล์ไปยัง Google Drive

   ```cmd
   touch myFile
   
   rclone copy myFile googleDrive:/SpireHorizonOnline/DatabaseBackup
   ```

6. การใช้ไฟล์สคริปในการ Export SQL และการสำรองไฟล์ไปยัง Google Drive

   สร้างไฟล์นี้โดยการใช้ nano backup.sh

   ```cmd
   #!/bin/bash
   
   DATE=$(date +"%Y-%m-%d_%H-%M-%S")
   
   mysqldump -u mendoka -ppassword spire_horizon_online > /home/admin/backup/backup_$DATE.sql
   
   rclone copy /home/admin/backup/backup_$DATE.sql googleDrive:/SpireHorizonOnline/DatabaseBackup
   ```

7. การใช้ Cron Job ในการทำงานเป็นเวลา

   เปิดไฟล์ Cron สำหรับแก้ไขด้วยคำสั่ง:

   ```cmd
   crontab -e
   ```

   เพิ่มบรรทัดต่อไปนี้ที่ท้ายไฟล์เพื่อให้ Cron Job รันสคริปต์ทุก ๆ 1 นาที:

   ```cmd
   * * * * * /home/admin/backup.sh
   ```

   สามารถตรวจสอบว่า Cron Job ได้ถูกเพิ่มแล้วหรือไม่โดยใช้คำสั่ง:

   ```cmd
   crontab -l
   ```

   ตัวอย่างการสำรองไฟล์ และลบไฟล์ที่เก่าเกิน 7 วัน (ยังไม่ได้ทดสอบ)

   ```cmd
   #!/bin/bash
   
   # ตั้งค่าเวลาปัจจุบันเพื่อใช้ในชื่อไฟล์สำรอง
   DATE=$(date +"%Y-%m-%d_%H-%M-%S")
   
   # กำหนดชื่อไฟล์สำรอง
   BACKUP_FILE="/home/admin/backup/backup_$DATE.sql"
   
   # ทำการสำรองข้อมูลจากฐานข้อมูลไปยังไฟล์
   mysqldump -u your_db_user spire_horizon_online > $BACKUP_FILE
   
   # อัปโหลดไฟล์ไปยัง Google Drive ด้วย rclone
   rclone copy $BACKUP_FILE googleDrive:/SpireHorizonOnline/DatabaseBackup
   
   # ลบไฟล์สำรองใน Google Drive ที่มีอายุมากกว่า 7 วัน
   rclone delete googleDrive:/SpireHorizonOnline/DatabaseBackup --min-age 7d
   
   # ลบไฟล์สำรองในเครื่องที่มีอายุมากกว่า 7 วัน (ถ้ามีการเก็บไว้ในเครื่อง)
   find /home/admin/backup/ -type f -name "*.sql" -mtime +7 -exec rm {} \;
   ```

   