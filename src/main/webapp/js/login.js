/**
 * 
 */

const message = ddocument.querySelector(".pop-up");
message.style.display = 'none';

if (message.textContent !== '') {
	message.style.display = 'block';
	message.delay(10000);
	message.style.display = 'none';
}