// comment

/* 
    - Khai niem Bien: Dai dien cho 1 vung nho chua du lieu
*/

var name = "name"; // Khong khuyen nghi - Chua khai bao van co the su dung -> hosting 
let number = 0;
const PI = 3.14; // Hang so

/* 
    - Kieu du lieu: Cung cap thong tin cho may tinh de cap phat bo nho de chua du lieu
    - Doi voi JS: Khong can khai bao kieu du lieu -> Co the tu nhan kieu du lieu cho bien
    - Cac kieu du lieu co the su dung:
        + String: Chuoi ky tu
        + Number: So thuc
        + Boolean: True/False
        + Null: Gia tri rong
        + Undefined: Gia tri chua duoc gan gia tri
        + Symbol: Kieu du lieu duy nhat trong JS, duoc tao bang ham Symbol()
        + Object: Toan bo cac thuoc tinh va phuong thuc
        + Array: Mang chua cac phan tu cung kieu du lieu
    - Luu y: Khi khai bao dien ma khong gan gia tri ngay -> Mac dinh bien do thuoc kieu "Undefined"
*/

/*
    - Cau truc dieu kien & cau truc lap tuong tu cac ngon ngu khac
*/

/*
    - Array: Bien dac biet chua nhieu phan tu, phan tu lien tiep nhau
        + Moi phan tu se co chi so Index - Vi tri & Value - Gia tri phan tu
        + Do dai khong co dinh
        + Cac phan tu trong mang khong can cung kieu du lieu
        + Su dung ham map, filter, reduce de xu ly mang
        + Su dung ham pop, push, shift, unshift de them/xoa phan tu o dau/cuoi mang
        + Su dung ham concat de noi 2 mang thanh mot mang
        + Su dung ham slice de cắt mảng
        + Su dung ham splice de them/xoa/thay doi phan tu o vi tri bat ky
        + Su dung ham indexOf, lastIndexOf de tim kiem phan tu xuat hien trong mang
        + Su dung ham includes de kiem tra xem mang co chua mot phan tu xac dinh hay khong
        + Su dung ham join de noi mang thanh mot chuoi ky tu cach bang khoang trang
        + Su dung ham reverse de dao chieu mang
        + Su dung ham sort de sap xep mang theo gia tri
        + Su dung ham find, findIndex de tim kiem phan tu xac dinh trong mang
        + Su dung ham every, some de kiem tra tat ca/tat ca phan tu trong mang co duoc kiem tra theo dieu kien xac dinh hay khong
        + Su dung ham reduce de tinh tong/tinh tich/tim kiem phan tu nao do trong mang
*/

let array = ["apple", "banana", "cherry"]; // Khai bao mang
array.foreach(
    (fruit, index) => {
        console.log(`Phan tu thu ${index + 1}: ${fruit}`);
    }
)
for (let index = 0; index < array.length; index++) {
    console.log(`Phan tu thu ${index + 1}: ${array[index]}`);
}

let numbers = [
    [1, 2, 3],
    2,
    3
]
let x = numbers[0][1]; //x = 2

/*
    - Function: Nhom cac cau lenh
        + Tham so ham: Bien cua ham -> Nhan gia tri truyen vao khi goi ham
        + Tai su dung code 
        + Chia nho chuc nang -> Lap trinh de dang hon
    - Co 2 loai ham:
        + Ham co san trong Core: console.log()
        + Ham tao rieng: Tao ra mot ham moi de thuc thi cac cau lenh rieng biet
*/

function showMessage(message) {
    console.log(message);
    alert(message);
}

showMessage("Hello World!");

function sum(a, b) {
    return a + b;
}

let a = sum(1, 2);

/*
    - Cong dung cua JS:
        > Xu ly hieu ung cua trang web thong qua xu ly cac su kien duoc dua vao phan tu HTML
            + Su kien (Event): Tac dong vao cac phan tu html -> Cac su kien dinh nghia la thuoc tinh cua cac phan tu HTML
                o Su kien tu con tro chuot
                o Su kien tu ban phim
        > Thay doi noi dung cua HTML
        > Lay gia tri cac thuoc tinh cua phan tu HTM
            + B1: Tim phan tu HTML -> 
            + B2: Lay gia tri thuoc tinh -> titleElement.getAttribute('name')
        > Thay doi css cua phan tu HTML
*/  

function changeSizeText() {
    let input = document.getElementById('size-text');
    let size = +input.value; // Lay gia tri va add sang kieu du lieu NUMBER

    let pMessage = document.getElementById('message');
    pMessage.style.fontSize = size + "px";
}

function changeBackgroundColor() {
    let input = document.getElementById('background-color');
    let color = input.value; // Lay gia tri cua thuoc tinh

    let body = document.getElementById('main');
    body.style.backgroundColor = color;
}