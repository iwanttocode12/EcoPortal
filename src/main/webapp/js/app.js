const curProj = document.querySelectorAll(".count-down");
for(let i=0; i<curProj.length; i++) {
	console.log(curProj[i]);
    const span = curProj[i].firstElementChild.firstElementChild;
    console.log(span);
    if (span !== null){
	    let days = parseInt(span.textContent);
	    if (days <= 3) {
	    	span.className = "close"; 
	    }
    }
}

const clickLi = document.querySelectorAll(".projlist");
for(var i=0; i<clickLi.length; i++){
	const div = clickLi[i]
	div.addEventListener('click', (event) => {
		const form = div.firstElementChild;
		console.log(form);
		form.submit();
	});
}

