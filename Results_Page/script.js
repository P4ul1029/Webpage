const check = document.getElementById('check')
const currencies = document.getElementById('Currencies')
const search = document.getElementById('search')

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

 function toggleCheckbox() {
    currencies.style.display = 'none'
}