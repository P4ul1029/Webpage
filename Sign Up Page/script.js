const firstName = document.getElementById('firstName')
const lastName = document.getElementById('lastName')
const email = document.getElementById('email')
const number = document.getElementById('number')
const password = document.getElementById('password')
const confirmPassword = document.getElementById('confirmPassword')
const form = document.getElementById('form')
const errorElem = document.getElementById('error')

form.addEventListener('submit', (e) => {
    let errorMessages = []

    if (number.value.length <  9){
        errorMessages.push('Enter a valid phone number!')
    }

    if (password.value.length <=  6){
        errorMessages.push('Password must be longer than 6 characters!')
    }

    if (!(password.value === confirmPassword.value)){
        errorMessages.push('The passwords do not match!')
    }

    if (errorMessages.length > 0){
        e.preventDefault()
        errorElem.innerText = errorMessages.join("\r\n")
    }
})