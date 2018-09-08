/**
 * 
 */

//const table = document.querySelectorAll('.scrolltable');
const select = document.querySelector('.custom-select');
const progBar = document.querySelector('.progbar');
const disTable = document.querySelector('.distable');
const barGraph = document.querySelector('.bargraph');

//table[0].style.display = 'none';
//table[1].style.display = 'none';

select.addEventListener('change', (event) => {
	if (event.target.value === 'bargraph'){
		barGraph.style.display = 'block';
		disTable.style.display = 'none';
		progBar.style.display = 'none';
	} else if (event.target.value === 'progresbar'){
		progBar.style.display = 'block';
		disTable.style.display = 'none';
		barGraph.style.display = 'none';	
	} else if (event.target.value === 'distable'){
		disTable.style.display = 'block';
		progBar.style.display = 'none';
		barGraph.style.display = 'none';
	} else {
		disTable.style.display = 'block';
		progBar.style.display = 'block';
		barGraph.style.display = 'block';
	}
})