const check = document.getElementById('check')
const currencies = document.getElementById('Currencies')
const search = document.getElementById('search')
const openModalBtn = document.querySelectorAll('[data-modal-target]')
const closeModalBtn = document.querySelectorAll('[data-close-btn')

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
    
    if(!(e.style.position == 'fixed')){
        e.style.position = 'fixed';
    } else {
        e.style.position = 'relative';
    }
 }

 function hideCurrencies() {
    currencies.style.display = 'none'
}