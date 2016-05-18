var myImage = document.querySelector('img');

myImage.onclick = function() {
    var mySrc = myImage.getAttribute('src');
    if(mySrc === 'images/lastknight.jpg') {
    myImage.setAttribute ('src','images/shia.jpg');
    } else {
        myImage.setAttribute ('src','images/lastknight.jpg');
    }
};


var myButton = document.querySelector('button');
var myHeading = document.querySelector('h1');
function setUserName() {
    var myName = prompt('Please enter your name.');
    localStorage.setItem('name', myName);
    myHeading.textContent = 'Transformers movies are lame,' + myName;
}

if(!localStorage.getItem('name')) {
    setUserName();
} else {
    var storedName = localStorage.getItem('name');
    myHeading.textContent = 'Transformers movies are lame, ' + storedName;
}

myButton.onclick = function() {
    setUserName();
};
