const check = document.getElementById('check')
const currencies = document.getElementById('Currencies')
const bookedHomes = document.getElementById('BookedHomes')
const search = document.getElementById('search')
const openModalBtn = document.querySelectorAll('[data-modal-target]')
const closeModalBtn = document.querySelectorAll('[data-close-btn')
const checkIn = document.getElementById('checkIn')
const checkOut = document.getElementById('checkOut')
const form = document.getElementById('form')
const errorElem = document.getElementById('error')

openModalBtn.forEach(label => {
    label.addEventListener('click', () =>{
        const modal = document.querySelector(label.dataset.modalTarget)
        openModal(modal)
    })
})

closeModalBtn.forEach(button => {
    button.addEventListener('click', () =>{
        const modal = button.closest('.filter')
        closeModal(modal)
    })
})

function openModal(modal) {
    if (modal == null) return

    modal.classList.add('active')
}

function closeModal(modal) {
    if (modal == null) return

    modal.classList.remove('active')
}

function toggling(id) {
    var e = document.getElementById(id);
    if(e.style.display == 'block'){
        e.style.display = 'none';
    } else {
        e.style.display = 'block';
    }
 }

 function hideMenus() {
    currencies.style.display = 'none'
    bookedHomes.style.display = 'none'
}

// Date validation
var currentDate = new Date()
var dd = currentDate.getDate()
var mm = currentDate.getMonth() + 1
var yyyy = currentDate.getFullYear()

if (dd < 10){
    dd ='0' + dd
}

if (mm < 10){
    mm='0' + mm
}

currentDate = yyyy + '-' + mm + '-' + dd
checkIn.setAttribute("min", currentDate)
checkOut.setAttribute("min", currentDate)

form.addEventListener('submit', (e) => {
    let errorMessages = []

    if (checkIn.value === checkOut.value){
        errorMessages.push('You can not check in and out on the same date!')
    }

    if (errorMessages.length > 0){
        e.preventDefault()
        errorElem.innerText = errorMessages.join("\r\n")
    }
})