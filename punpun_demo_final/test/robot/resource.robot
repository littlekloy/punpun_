*** Settings ***
Documentation     A resource file with reusable keywords and variables.

Library                     Selenium2Library

*** Variables ***
${SERVER PORT}              8383
${APP NAME}                 PunpunWithDashboard
${SERVER}                   localhost:${SERVER PORT}/${APP NAME}
${BROWSER}                  gc
${DELAY}                    0.5

${SPACE}                    \\32

${UPLOAD DIR}               D:\\Frost2Ice\\Dropbox\\CharityWeb_Kloy_Ice\\Project_media\\PNG\\character.png
${INDEX URL}                http://${SERVER}/
${LOGIN URL}                http://${SERVER}/login.html
${DASHBOARD URL}            http://${SERVER}/dashboard.html
${BROWSE URL}               http://${SERVER}/browse.html
${DONATE URL}               http://${SERVER}/donate.html

${FIRSTNAME}                ดิศานุวัตร
${LASTNAME}                 วรจิรกาล
${ADDRESS}                  2131/169 ม.7
${SUB-DISTRICT}             เทพารักษ์
${DISTRICT}                 เมือง
${PROVINCE}                 สมุทรปราการ
${POSTAL CODE}              10270
${USERNAME}                 disanuwat
${NEW EMAIL}                disanuwat.w@gmail.com
${NEW PASSWORD}             disanuwat
${NEW RE-PASSWORD}          disanuwat
${VALID EMAIL}              disanuwat.w@gmail.com
${VALID PASSWORD}           disanuwat

${DONATE AMOUNT}            2000

${PROJECT NAME}             คนไทยใส่ใจเด็กดอย ครั้งที่ 97
${PROJECT TARGET}            25000
${PROJECT DURATION}         30
${PROJECT DETAIL}           หมู่บ้านปิยอทะ (วาโซทะ) ตั้งอยู่ในตำบลแม่ตื่น อำเภออมก๋อย จังหวัดเชียงใหม่ อยู่ห่างจากจังหวัดเชียงใหม่ประมาณ 300 กิโลเมตร ต้องใช้เวลาขับรถมากกว่า 6-8 ชั่วโมงกว่าจะถึงที่หมาย ยิ่งการเดินทางในฤดูฝนนั้นต้องในรถยนต์ขับเคลื่อน 4 ล้อ ประชากรส่วนใหญ่เป็นชาวเขาชนเผ่ากะเหรี่ยงสะกอร์ ประกอบอาชีพเกษตรกรรม ปลูกข้าวไร่เลื่อนลอย ฐานะยากจนและขาดโอกาสทางการศึกษา เด็ก ๆ ในหมู่บ้านส่วนใหญ่จึงเป็นเด็กยากจนและด้อยโอกาส มีจำนวนครั้วเรือนทั้งหมด 115 ครัวเรือน จาก 3 ย่อมบ้าน คือ ย่อมบ้าน วะโซะทะ ย่อมบ้านปิยอทะ และย่อมบ้านแมะแตะและกิว มีจำนวนประชากรทั้งหมด 485 คน มีเด็กแรกเด็กถึง เด็กอายุ 12 ปี จำนวน 97 คน

*** Keywords ***
Open Browser To Home Page
    Open Browser            ${INDEX URL}        ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}

Goto Homepage
    Go To                   ${INDEX URL}

Sign up with Punpun
    Focus                   login-btn
    Click Element           login-btn
    Focus                   signup-link
    Click Element           signup-link
    Input Text              firstname           ${FIRSTNAME}
    Input Text              lastname            ${LASTNAME}
    Input Text              email               ${NEW EMAIL}
    Input Text              username            ${USERNAME}
    Input Password          password            ${NEW PASSWORD}
    Input Password          retype_password     ${NEW RE-PASSWORD}
    Focus                   signup-btn
    Click Element           signup-btn

Browse and View Project
    Click Element           browse-link
    Focus                   project01
    Click Element           project01

Donate
    Focus                   donate-focus-btn
    Click Element           donate-btn
    Select Checkbox         per-item
    Select Checkbox         item1
    Click Element           amount-500
    Focus                   submit-btn
    Click Element           submit-btn

Payment : Bank Tranfer
    Input Text              address             ${ADDRESS}
    Input Text              sub-district        ${SUB-DISTRICT}
    Input Text              district            ${DISTRICT}
    Input Text              province            ${PROVINCE}
    Input Text              postal-code         ${POSTAL CODE}
    Click Element           submit-btn
    Focus                   bank-dropdown
    Click Element           bank-dropdown
    Focus                   bank02
    Click Element           bank02
    Input Text              amount              ${DONATE AMOUNT}
    Choose File             upload-file-btn     ${UPLOAD DIR}
    Focus                   submit-btn
    Click Element           submit-btn

Login
    Click Element           login-btn
    Input Text              username            ${VALID EMAIL}
    Input Password          password            ${VALID PASSWORD}
    Click Element           submit-btn

Create New Project
    Click Element           create-btn

Create New Project : Info
    Focus                   project-name
    Input Text              project-name        ${PROJECT NAME}
    Click Element           project-category
    Focus                   category02
    Click Element           category02
    Input Text              project-target          ${PROJECT TARGET}
    Input Text              project-duration        ${PROJECT DURATION}
    Click Element           submit-btn
    Click Element           team-link

Create New Project : Team
    Focus                   owner
    Click Element           detail-link

Create New Project : Detail
    Focus                   submit-btn
    Click Element           image-link

Create New Project : Image
    Focus                   submit-btn
    Click Element           wishlist-link

Create New Project : Wishlist
    Focus                   submit-btn
    Click Element           submit-link

Create New Project : Submit
    Focus                   submit-btn
    Click Element           project-list-link