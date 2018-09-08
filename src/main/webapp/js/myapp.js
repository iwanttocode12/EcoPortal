/**
 * 
 */
const table = document.getElementById("mytable");

const pass = document.querySelector(".pa");
const paParent = pass.parentNode.parentNode.parentNode;
var passValue = parseInt(pass.textContent);
const fail = document.querySelector(".fa");
const faParent = fail.parentNode.parentNode.parentNode;
var failValue = parseInt(fail.textContent);
const pend = document.querySelector(".pe");
const peParent = pend.parentNode.parentNode.parentNode;
var pendValue = parseInt(pend.textContent);
const pendin = document.querySelector(".pend");
const pendParent = pendin.parentNode.parentNode.parentNode;
var pendinValue = parseInt(pendin.textContent);
const saveform = document.querySelector(".saveproj");
const submitBtn = document.querySelector("#submit");
const submitBtnDiv = submitBtn.parentNode;
const dummyjson = saveform.firstElementChild;

const tr = table.rows;
let total = tr.length;
total -=1;

const select = document.querySelector('.custom-select');

select.addEventListener('change', (event) => {
	if (event.target.value === 'Pend'){
		for(let i=1; i<tr.length; i++) {
			console.log(tr.item(i).cells.item(3).textContent);
			if (tr.item(i).cells.item(3).querySelector("input").value === 'Pending') {
				tr.item(i).style.display = '';
			}else {
				tr.item(i).style.display = 'none';
			}
		}
	} else {
		for(let i=1; i<tr.length; i++) {
			tr.item(i).style.display = '';
		}
	}
});

const curProj = document.querySelectorAll(".count");
for(let i=0; i<curProj.length; i++) {
    const span = curProj[i].querySelector("span");
    let days = parseInt(span.textContent);
    if (days <= 3) {
    	span.className = "close"; 
    }
}

// number of count
let count = 0;
// number of passes
let passNum = 0;
//number of fails
let failNum = 0;
//number of not pendings
let pendNum = 0;
let pendinNum = total;

// get number of passes and fails
for(let i=1; i<tr.length; i++) {
    const cell = tr.item(i).cells;
	const status = cell.item(3).querySelector("input").value;
	if (status == "Pass") {
		count++;
		passNum++;
		pendNum++;
		pendinNum--;
	} else if (status == "Fail") {
		count++;
		failNum++;
		pendNum++;
		pendinNum--;
	}
}

if (count !== total) {
	submitBtn.setAttribute('type', 'button');
	//submitBtn.disabled = true;
	submitBtn.className += " disabled";
}  else {
	submitBtn.setAttribute('type', 'submit');
	//submitBtn.disabled = false;
	submitBtn.className = "projectsSave";
}

table.addEventListener('change', (event) => {
	if (event.target.tagName == "INPUT"){
		let statusValue = event.target.parentNode.parentNode.firstElementChild.value;
	    if (event.target.value == "Pass") {
			if (statusValue == "Pending") {
				count++;
			    passNum ++; 
			    pendNum ++;
			    pendinNum--;
			    passValue = passNum * 100 / total;
			    pass.textContent = Math.round(passValue);
			    paParent.className = "progress-radial"; 
			    paParent.className += " progress-" + Math.round(passValue);
			    pendValue = pendNum * 100 / total;
			    pend.textContent = Math.round(pendValue); 
			    peParent.className = "progress-radial"; 
			    peParent.className += " progress-" + Math.round(pendValue);
			    pendinValue = pendinNum * 100 / total;
			    pendin.textContent = Math.round(pendinValue); 
			    pendParent.className = "progress-radial"; 
			    pendParent.className += " progressred-" + Math.round(pendinValue);
			    if (count === total) {
			    	submitBtn.setAttribute('type', 'submit');
			    	submitBtn.className = "projectsSave";
			    }
		    } else if (statusValue == "Fail") {
			    passNum ++;
			    failNum --;
			    passValue = passNum * 100 / total;
			    pass.textContent = Math.round(passValue);
			    paParent.className = "progress-radial"; 
			    paParent.className += " progress-" + Math.round(passValue);
			    failValue = failNum * 100 / total;
			    fail.textContent = Math.round(failValue);
			    faParent.className = "progress-radial"; 
			    faParent.className += " progress-" + Math.round(failValue);
			}
			event.target.parentNode.parentNode.firstElementChild.value = "Pass";
		} else if(event.target.value == "Fail") {
			if (statusValue == "Pending") { 
				count++;
				failNum++; 
				pendNum++;
				pendinNum--;
			    failValue = failNum * 100 / total;
			    fail.textContent = Math.round(failValue);
			    faParent.className = "progress-radial"; 
			    faParent.className += " progress-" + Math.round(failValue);
			    pendValue = pendNum * 100 / total;
			    pend.textContent = Math.round(pendValue);
			    peParent.className = "progress-radial"; 
			    peParent.className += " progress-" + Math.round(pendValue);
			    pendinValue = pendinNum * 100 / total;
			    pendin.textContent = Math.round(pendinValue); 
			    pendParent.className = "progress-radial"; 
			    pendParent.className += " progressred-" + Math.round(pendinValue);
			    if (count === total) {
			    	submitBtn.setAttribute('type', 'submit');
			    	submitBtn.className = "projectsSave";
			    }
		    } else if (statusValue == "Pass") {
				passNum --;
				failNum ++; 
				passValue = passNum * 100 / total;
			    pass.textContent = Math.round(passValue);
			    paParent.className = "progress-radial"; 
			    paParent.className += " progress-" + Math.round(passValue);
			    failValue = failNum * 100 / total;
			    fail.textContent = Math.round(failValue);
			    faParent.className = "progress-radial"; 
			    faParent.className += " progress-" + Math.round(failValue);
		    }
			event.target.parentNode.parentNode.firstElementChild.value = "Fail";
		}   else if(event.target.value == "Pending") {
			if (statusValue == "Pass") {
				count--;
			    passNum --; 
			    pendNum --;
			    pendinNum++;
			    passValue = passNum * 100 / total;
			    pass.textContent = Math.round(passValue);
			    paParent.className = "progress-radial"; 
			    paParent.className += " progress-" + Math.round(passValue);
			    pendValue = pendNum * 100 / total;
			    pend.textContent = Math.round(pendValue); 
			    peParent.className = "progress-radial"; 
			    peParent.className += " progress-" + Math.round(pendValue);
			    pendinValue = pendinNum * 100 / total;
			    pendin.textContent = Math.round(pendinValue); 
			    pendParent.className = "progress-radial"; 
			    pendParent.className += " progressred-" + Math.round(pendinValue);
			    submitBtn.setAttribute('type', 'button');
			    submitBtn.className = "projectsSave disabled";
		    } else if (statusValue == "Fail") {
		    	count--;
		    	pendNum--;
			    failNum--; 
			    pendinNum++;
			    pendValue = pendNum * 100 / total;
			    pend.textContent = Math.round(pendValue); 
			    peParent.className = "progress-radial"; 
			    peParent.className += " progress-" + Math.round(pendValue);
			    pendinValue = pendinNum * 100 / total;
			    pendin.textContent = Math.round(pendinValue); 
			    pendParent.className = "progress-radial"; 
			    pendParent.className += " progressred-" + Math.round(pendinValue);
			    failValue = failNum * 100 / total;
			    fail.textContent = Math.round(failValue);
			    faParent.className = "progress-radial"; 
			    faParent.className += " progress-" + Math.round(failValue);
			    submitBtn.setAttribute('type', 'button');
			    submitBtn.className = "projectsSave disabled";
			}
			event.target.parentNode.parentNode.firstElementChild.value = "Pending";
		}
	}
}); 

saveform.addEventListener('click', (event) => {
	if (event.target.tagName == "BUTTON"){
		if (event.target.textContent === 'Submit' && submitBtn.getAttribute('type') === 'button'){
			console.log(count);
			alert("You cannot leave any test case pending. Make sure you have tested each case before submitting!!");
		}
		else{
			let temp = event.target.textContent + ';;';
			temp += Math.round(passValue);
			temp += " ";
			temp += Math.round(pendValue);
			temp += " ";
			temp += Math.round(failValue);
			temp += ";;";
			for(let i=1; i<tr.length; i++) {
		        const cell = tr.item(i).cells;
		        const tcid = cell.item(1).querySelector("input").value;
				const status = cell.item(3).querySelector("input").value;
				const comment = cell.item(4).querySelector("textarea").value;
			    temp += tcid;
			    temp += "~"
			    temp += status;
			    temp += "~"
			    temp += comment;
				temp += ";;"
		    }
			dummyjson.value = temp;
			console.log(dummyjson);
		}
	}
});