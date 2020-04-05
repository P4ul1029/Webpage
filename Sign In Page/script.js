const email = document.getElementById('email')
const password = document.getElementById('password')
const form = document.getElementById('form')
const errorElem = document.getElementById('error')

form.addEventListener('submit', (e) => {
    let errorMessages = []

    if (password.value.length <=  6){
        errorMessages.push('Password must be longer than 6 characters!')
    }

    if (errorMessages.length > 0){
        e.preventDefault()
        errorElem.innerText = errorMessages.join(',')
    }
})