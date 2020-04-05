const title = document.getElementById('title')
const description = document.getElementById('description')
const properties = document.getElementById('properties')
const street = document.getElementById('street')
const city = document.getElementById('city')
const province = document.getElementById('province')
const postalCode = document.getElementById('postalCode')
const country = document.getElementById('country')
const bedroom = document.getElementById('Bedroom')
const bathroom = document.getElementById('Bathroom')
const startDate = document.getElementById('Start_Date')
const endDate = document.getElementById('End_Date_Selection')
const indefinitely = document.getElementById('Indefinitely')
const Rate = document.getElementById('Rate')
const image = document.getElementById('image')
const form = document.getElementById('form')
const errorElem = document.getElementById('error')

// Date validation
var currentDate = new Date()
var dd = currentDate.getDate()
var mm = currentDate.getMonth() + 1
var yyyy = currentDate.getFullYear()

if (dd < 10){
    dd = '0' + dd
}

if (mm < 10){
    mm = '0' + mm
}

currentDate = yyyy + '-' + mm + '-' + dd
startDate.setAttribute("min", currentDate)
endDate.setAttribute("min", currentDate)

form.addEventListener('submit', (e) => {
    let errorMessages = []

    if (startDate.value === startDate.value){
        errorMessages.push('Your start and end dates can not be the same!')
    }

    if (!(endDate === null || endDate ==='') && indefinitely.checked){
        errorMessages.push('Enter an end date or select "Indefinitely", not both!')
    }

    if (errorMessages.length > 0){
        e.preventDefault()
        errorElem.innerText = errorMessages.join("\r\n")
    }
})