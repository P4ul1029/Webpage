const where = document.getElementById('where')
const checkIn = document.getElementById('checkIn')
const checkOut = document.getElementById('checkOut')
const numberOfGuests = document.getElementById('numberOfGuests')
const form = document.getElementById('form')
const errorElem = document.getElementById('error')

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